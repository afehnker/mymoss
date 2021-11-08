import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class program extends PApplet {

PImage backgroundImage;

int battleCruiserX, battleCruiserY, gokuX, gokuY, cellX, cellY, red;
boolean decrement;
int state;
BattleCruiserMenu battleCruiserMenu;
BattleCruiserGame battleCruiserGame;
GokuMenu gokuMenu;
GokuGame gokuGame;
RainbowMenu rainbowMenu;
CellMenu cellMenu;
CellGame cellGame;
/*
* Sets up the initial window.
*/
public void setup() {
    
    rectMode(CENTER);
    strokeWeight(10);
    battleCruiserX = 240;
    battleCruiserY = 654;
    gokuX = 484;
    gokuY = 210;
    cellX = 195;
    cellY = 308;
    backgroundImage = loadImage("assets/gameshop.jpeg");
    reset();
}

/*
* Resets the window to its original state.
*/
public void reset() {
    surface.setSize(backgroundImage.width, backgroundImage.height);
    state = 0;
    red = 0;
    decrement = false;
    battleCruiserMenu = new BattleCruiserMenu();
    gokuMenu = new GokuMenu();
    rainbowMenu = new RainbowMenu();
    cellMenu = new CellMenu();
}

/**
* Main draw loop. Passes draw function on to objects based on the current state.
*/
public void draw() {
    switch (state) {
        case 0: {
            if (red >= 255) {
                decrement = true;
            } else if (red <= 0) {
                decrement = false;
            }
            red = red + (decrement ? -1 : 1);
            pushMatrix();
            image(backgroundImage, 0, 0);
            PImage image = colorImage(width, height, red, 255, 255, 100);
            image(image, 0, 0);
            popMatrix();

            //Lower memory usage as each image is only used once.
            g.removeCache(image);

            fill(255, 255, 0, 255);
            ellipse(battleCruiserX, battleCruiserY, 25, 25);
            ellipse(gokuX, gokuY, 25, 25);
            ellipse(cellX, cellY, 25, 25);
            break;
        }
        case 1: {
            battleCruiserMenu.draw();
            break;
        }
        case 2: {
            battleCruiserGame.draw();
            break;
        }
        case 3: {
            gokuMenu.draw();
            break;
        }
        case 4: {
            gokuGame.draw();
            break;
        }
        case 5: {
            rainbowMenu.draw();
            break;
        }
        case 6: {
            cellMenu.draw();
            break;
        }
        case 7: {
            cellGame.draw();
            break;
        }
    }
}

/**
* Main mousePressed function. Passes the event to objects based on the current state.
*/
public void mousePressed() {
    println("X: " + mouseX + " Y: " + mouseY);
    switch (state) {
        case 0: {
            if (overCircle(battleCruiserX, battleCruiserY, 25)) {
                battleCruiserMenu.init();
            } else if (overCircle(gokuX, gokuY, 25)) {
                gokuMenu.init();
            } else if(overCircle(cellX, cellY, 25)) {
                cellMenu.init();
            }
            break;
        }
        case 1: {
            battleCruiserMenu.mousePressed();
            break;
        }
        case 2: {
            battleCruiserGame.mousePressed();
            break;
        }
        case 3: {
            gokuMenu.mousePressed();
            break;
        }
        case 6: {
            cellMenu.mousePressed();
        }
        case 7: {
            cellGame.mousePressed();
        }
    }
}

/**
* Main keyPressed function. Passes the event to objects based on the current state.
*/
public void keyPressed() {
    switch (state) {
        case 2: {
            battleCruiserGame.keyPressed();
            break;
        }
        case 4: {
            gokuGame.keyPressed();
            break;
        }
        case 7: {
            cellGame.keyPressed();
            break;
        }
    }
}


/**
* Main keyReleased function. Passes the event to objects based on the current state.
*/
public void keyReleased() {
    switch (state) {
        case 2: {
            battleCruiserGame.keyReleased();
            break;
        }
        case 4: {
            gokuGame.keyReleased();
            break;
        }
    }
}
class BattleCruiserEntity {
    int x;
    PImage sprite;
    boolean canFire, hasShot;
    int counter;
    int bulletDelay;
    BattleCruiserEntity(PImage sprite) {
        x = 0;
        this.sprite = sprite;
        canFire = true;
        hasShot = false;
        counter = 0;
        bulletDelay = 20;
    }
    
    /**
    * Updates the battle cruiser entity, checking if collision with an enemy has happened.
    */
    public void update() {
        if (!canFire && counter != bulletDelay) {
            ++counter;
        } else if (!canFire && counter == bulletDelay) {
            canFire = true;
            counter = 0;
        }
        for (ZombieEntity z : battleCruiserGame.zombies) {
            if (z.currX - this.x < 10) {
                reset();
            }
        }
    }

    /**
    * Adds a bullet to the list if enough time has passed since the last one.
    */   
    public void shoot() {
        if (canFire) {
            battleCruiserGame.bullets.add(new BulletEntity(battleCruiserGame.bulletSprite, battleCruiserGame.battleCruiser));
            canFire = false;
            hasShot = true;
        }
    }
    
    /**
    * Draws the battle cruiser.
    */
    public void draw() {
        //rotate(radians(180));
        image(sprite, x, 128);
    }
}
class BattleCruiserGame {
    PImage gameBackgroundImage, battleCruiserSprite, zombieSprite, bulletSprite;
    BattleCruiserEntity battleCruiser;
    ArrayList<ZombieEntity> zombies;
    ArrayList<BulletEntity> bullets;
    int counter, targetVal, killCount;
    
    /*
    * Initializes all the data that this object requires.
    */
    public void init() {
        state = 2;
        counter = 0;
        gameBackgroundImage = loadImage("assets/game_bg.jpeg");
        battleCruiserSprite = loadImage("assets/battlecruiser_sprite.png");
        zombieSprite = loadImage("assets/zombie.png");
        bulletSprite = loadImage("assets/blast.png");
        surface.setSize(gameBackgroundImage.width, gameBackgroundImage.height);
        battleCruiserSprite.resize(196, 196);
        zombieSprite.resize(196, 196);
        bulletSprite.resize(bulletSprite.width * 2, bulletSprite.height * 2);
        
        zombies = new ArrayList<ZombieEntity>();
        bullets = new ArrayList<BulletEntity>();
        battleCruiser = new BattleCruiserEntity(battleCruiserSprite);
        targetVal = PApplet.parseInt(random(30, 60));
    }
    
    /*
    * Draws the battle cruiser, zombies and bullets.
    */
    public void draw() {
        background(gameBackgroundImage);
        counter++; 
        if (counter == targetVal) {
            zombies.add(new ZombieEntity(gameBackgroundImage, zombieSprite));
            counter = 0;
            targetVal = PApplet.parseInt(random(15, 69));
        }
        battleCruiser.update();
        battleCruiser.draw();
        for (ZombieEntity zombie : zombies) {
            if (zombie.enabled) {
                zombie.draw();
                zombie.update();
            }
        }
        for (BulletEntity bullet : bullets) {
            if (bullet.enabled) {
                bullet.draw();
                bullet.update();
            }
        }
        fill(209, 112, 2, 255);
        textSize(36);
        text(String.format("Your score is: %s", killCount), 11, 40);
    }
    
    public void mousePressed() {
        
    }
    
    /*
    * Handles button presses.
    */
    public void keyPressed() {
        switch(key) {
            case ESC : {
                    key = 0;
                    battleCruiserMenu.init();
                    break;
                }
                case'z':
                case'Z' : {
                    if (!battleCruiser.hasShot) {
                        battleCruiser.shoot();
                    }
                    break;
            }
        }
    }
    
    /*
    * Handles button releases.
    */
    public void keyReleased() {
        switch(key) {
            case 'z':
                case'Z' : {
                    battleCruiser.hasShot = false;
                    break;
            }
        }
    }
}
class BattleCruiserMenu {
    PImage backgroundImage;
    PImage text;
    int x;
    int backButtonX, backButtonY, backButtonWidth, backButtonHeight;
    int gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight;
    BattleCruiserMenu() {
        backgroundImage = loadImage("assets/battlecruiser4.png");
    }

    /*
    * Initializes all the data that this object requires.,
    */
    public void init() {
        state = 1;
        surface.setSize(backgroundImage.width, backgroundImage.height);
        backButtonX = 0; backButtonY = 570; backButtonWidth = 200; backButtonHeight = 100;
        gameButtonWidth = 200; gameButtonHeight = 100;
        gameButtonX = backgroundImage.width - gameButtonWidth; gameButtonY = backgroundImage.height - gameButtonHeight;

        text = gradientText("Do you want to choose this ship?", 750, 250, 36);
    }

    /*
    * Draws the battle cruiser menu.
    */
    public void draw() {
        background(backgroundImage);
        fill(0, 0, 0, 255);
        textSize(24);
        text("Battlecruisers fire rapid low damage shots from laser batteries,\n" +
"with the anti-ground attack being more powerful than the anti-air attack.\n" +
"This makes them better able at handling groups of weaker, low armor, units.\n" +
"Battlecruisers are heavily armored.\n" + 
"Controls: Z to shoot.", 5, 25);

        image(text, 284, 325);

        fill(224, 63, 90, 100);
        rectMode(CORNER);
        rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight);

        fill(255, 255, 255, 255);
        textSize(36);
        text("Go back", backButtonX + backButtonWidth / 2 - 60, backButtonY + backButtonHeight / 2 + 10);

        fill(64, 194, 227);
        rect(gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight);
        fill(255, 255, 255, 255);
        text("Play game", gameButtonX + gameButtonWidth / 2 - 85, gameButtonY + gameButtonHeight / 2 + 10);
    }

    /*
    * Handles mouse presses inside the battle cruiser menu.
    */
    public void mousePressed() {
        if (overRect(backButtonX, backButtonY, backButtonWidth, backButtonHeight)) {
            reset();
        } else if (overRect(gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight)) {
            battleCruiserGame = new BattleCruiserGame();
            battleCruiserGame.init();
        }
    }
}
class BulletEntity {
    int currX;
    boolean enabled;
    PImage sprite;
    BulletEntity(PImage sprite, BattleCruiserEntity battleCruiser) {
        currX = battleCruiser.x + 218;
        this.sprite = sprite;
        enabled = true;
    }
    
    /*
    * Updates the bullet entity.
    */
    public void update() {
        if (enabled) {
            currX += 7;
            if (currX > battleCruiserGame.gameBackgroundImage.width - sprite.width) {
                enabled = false;
                return;
            }
            for (ZombieEntity z : battleCruiserGame.zombies) {
                if (z.enabled && z.currX - currX < 10) {
                    z.enabled = false;
                    this.enabled = false;
                    battleCruiserGame.killCount++;
                    break;
                }
            }
        }
    }
    
    /*
    * Draws the bullet entity to the screen.
    */
    public void draw() {
        image(sprite, currX, 196);
    }
}
class CellGame {
    class Answer {
        private boolean correct;
        private String text;
        
        Answer(boolean correct, String text) {
            this.correct = correct;
            this.text = text;
        }
        
        /*
        * Returns whether or not this specific answer is correct.
        */
        public boolean isCorrect() {
            return this.correct;
        }

        /*
        * Returns the text of the answer.
        */        
        public String getText() {
            return this.text;
        }

        @Override
        public String toString() {
            return String.format("Answer{correct=%s,text=%s}", this.correct, this.text);
        }
    }
    class Question {
        private String text;
        private ArrayList<Answer> answers;
        
        Question(String text, String answersString) {
            this.text = text;
            this.answers = new ArrayList();
            for (String s : answersString.split("\n")) {
                answers.add(new Answer(s.endsWith(".c"), s.replace(".c", "")));
            }
        }
        
        /*
        * Returns the text of the question.
        */
        public String getText() {
            return this.text;
        }
        
        /*
        * Returns the answer at the given index.
        */
        public Answer getAnswerAt(int index) {
            return answers.get(index);
        }
        
        /*
        * Returns whether or not the answer at the given index is correct.
        */
        public boolean isAnswerAtCorrect(int index) {
            //println(answers.get(index));
            return answers.get(index).isCorrect();
        }
    }
    
    PImage backgroundImage;
    private ArrayList<Question> questions;
    int currentQuestion;
    int correctAnswers;

    /*
    * Initializes all the data used by this object.
    */
    public void init() {
        backgroundImage = loadImage("assets/cell_quiz.png");
        surface.setSize(backgroundImage.width, backgroundImage.height);
        state = 7;
        questions = new ArrayList();
        
        questions.add(new Question("Who was the character that defeated Cell in Dragon Ball Kai series?", "Gohan.c\n" +
            "Goku\n" + 
            "Vegeta"));
        questions.add(new Question("If Cell from Dragon Ball Kai series would fight with Ultra Instinct Goku from Dragon Ball Super, who would win?", 
            "Cell\nGoku.c\nTrick question: no one."));
        questions.add(new Question("How much is 9+3*5-4+5*2?", "30.c\n∞\nThe mitochondria is the powerhouse of the cell."));
        questions.add(new Question("Who is stronger, Goku in the stage of a god(red haird Goku) or Cell in Dragon Ball Kai at full power?", 
            "Vegeta\nCell\nGoku.c"));
        currentQuestion = 0;
        correctAnswers = 0;
    }
    
    /*
    * Draws the questions and answers to the screen.
    */ 
    public void draw() {
        background(backgroundImage);
        if (currentQuestion < questions.size()) {
            fill(0, 0, 0, 255);
            textSize(24);
            text(questions.get(currentQuestion).getText(), 161, 48);
            text(questions.get(currentQuestion).getAnswerAt(0).getText(), 100, 150);
            text(questions.get(currentQuestion).getAnswerAt(1).getText(), 100, 250);
            text(questions.get(currentQuestion).getAnswerAt(2).getText(), 100, 350);
            fill(255, 0, 0, 25);
            rect(0, 100, width, 100);
            rect(0, 200, width, 100);
            rect(0, 300, width, 100);
        } else {
            fill(0, 0, 0, 255);
            textSize(48);
            switch(correctAnswers) {
                case 0: {
                    text("D: You should start reading!", 601, 230);
                    break;
                }
                case 1: {
                    text("C: At least you got one.", 601, 230);
                    break;
                }
                case 2: {
                    text("B: Are you even trying?", 601, 230);
                    break;
                }
                case 3: {
                    text("A: You can do better!", 601, 230);
                    break;
                }
                case 4: {
                    text("S: Good job!", 601, 230);
                    break;
                }
            }
        }
    }
    
    /*
    * Handles button presses, checking which answer has been clicked.
    */
    public void mousePressed() {
        if (currentQuestion < questions.size()) {
            if (mouseY >= 100 && mouseY <= 200) {
                if (questions.get(currentQuestion++).isAnswerAtCorrect(0)) {
                    ++correctAnswers;
                }
            } else if (mouseY >= 200 && mouseY <= 300) {
                if (questions.get(currentQuestion++).isAnswerAtCorrect(1)) {
                    ++correctAnswers;
                }
            } else if (mouseY >= 300 && mouseY <= 400) {
                if (questions.get(currentQuestion++).isAnswerAtCorrect(2)) {
                    ++correctAnswers;
                }
            }
        }
    }
    
    /*
    * Handles key presses, returning to the main menu if ESC is detected.
    */
    public void keyPressed() {
        switch (key) {
            case ESC: {
                key = 0;
                reset();
                break;
            }
        }
    }
}
class CellMenu {
    PImage backgroundImage, text;
    int backButtonX, backButtonY, backButtonWidth, backButtonHeight, gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight;

    /*
    * Initializes all the data used by this object.
    */
    public void init() {
        backgroundImage = loadImage("assets/cell.png");
        surface.setSize(backgroundImage.width, backgroundImage.height);
        state = 6;

        backButtonX = 0;
        backButtonY = backgroundImage.height - 100;
        backButtonWidth = gameButtonWidth = 200;
        backButtonHeight = gameButtonHeight = 100;

        gameButtonX = backgroundImage.width - gameButtonWidth; 
        gameButtonY = backgroundImage.height - gameButtonHeight;

        text = gradientText("Do you want to choose this character?", 750, 200, 32);
    }

    /*
    * Draws the menu to the screen.
    */
    public void draw() {
        background(backgroundImage);

        textSize(17);
        fill(0, 0, 0, 255);
        text("Cell is the ultimate creation of Dr. Gero, designed via cell recombination\n" +
"using the genetics of the greatest fighters that the remote tracking\n" +
"device could find on Earth. The result was a \"perfect warrior\",\n" +
"possessing numerous favorable genetic traits and special abilities from\n" +
"Goku, Vegeta, Piccolo, Frieza and King Cold.", 0, 50);
        image(text, 10, 387);

        fill(224, 63, 90, 100);
        rectMode(CORNER);
        rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight);

        fill(255, 255, 255, 255);
        textSize(36);
        text("Go back", backButtonX + backButtonWidth / 2 - 60, backButtonY + backButtonHeight / 2 + 10);

        fill(64, 194, 227, 100);
        rectMode(CORNER);
        rect(gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight);

        fill(255, 255, 255, 255);
        textSize(36);
        text("Play game", gameButtonX + gameButtonWidth / 2 - 75, gameButtonY + gameButtonHeight / 2 + 10);
    }

    /*
    * Handles mouse presses inside the menu, checking whether or not a button was pressed.
    */
    public void mousePressed() {
        if (overRect(backButtonX, backButtonY, backButtonWidth, backButtonHeight)) {
            reset();
        } else if (overRect(gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight)) {
            cellGame = new CellGame();
            cellGame.init();
        }
    }
}
class GokuBullet {
    PImage sprite;
    float currX, currY, targetX, targetY, startX, startY;
    boolean enabled, xPos, yPos;
    float counter, totalFrameCount;
    /*
    * Constructs a new GokuBullet object with the given parameters.
    */
    GokuBullet(PImage sprite, float currX, float currY, float targetX, float targetY) {
        this.sprite = sprite;
        this.currX = this.startX = currX;
        this.currY = this.startY = currY;
        println(String.format("%s %s", this.currX, this.startX));
        
        this.targetX = targetX;
        this.targetY = targetY;
        this.xPos = (targetX > currX);
        this.yPos = (targetY > currY);
        enabled = true;
        counter = 0;
        totalFrameCount = 15;
    }
    
    /*
    * Draws and updates this object.
    */
    public void draw() {
        if (enabled) {
            image(sprite, currX, currY);
        

            currX = lerp(startX, targetX, counter / totalFrameCount);
            currY = lerp(startY, targetY, counter / totalFrameCount);
            ++counter;
            if (counter == 200) {
                enabled = false;
                return;
            }
            
            for (GokuEnemy enemy : gokuGame.enemies) {
                if (enemy.enabled && circleOverlap(currX, currY, sprite.width, enemy.currX, enemy.currY, gokuGame.enemySprite.width)) {
                    enemy.enabled = false;
                    enabled = false;
                    gokuGame.killCount++;
                    break;
                }
            }
        }
    }
}
class GokuEnemy {
    float currX, currY;
    int xMovement, yMovement, attackCounter, target;
    boolean enabled;
    PImage sprite;
    
    /*
    * Creates a new GokuEnemy based on the given sprite and coordinates
    */
    GokuEnemy(PImage sprite, float startX, float startY) {
        this.sprite = sprite;
        this.currX = startX;
        this.currY = startY;
        xMovement = yMovement = 1;
        attackCounter = 0;
        target = PApplet.parseInt(random(30, 60));
        enabled = true;
    }    
    
    /*
    * Draws and updates this object.
    */
    public void draw() {
        if (enabled) {
            image(sprite, currX, currY);
            if (attackCounter != target)
                ++attackCounter;
            else{
                target = PApplet.parseInt(random(30, 60));
                attackCounter = 0;
                gokuGame.enemyBullets.add(new GokuEnemyBullet(gokuGame.enemyBulletSprite, currX, currY, gokuGame.goku.currX, gokuGame.goku.currY));
            }   
        }
    }
}
class GokuEnemyBullet {
    PImage sprite;
    float currX, currY, targetX, targetY, startX, startY;
    boolean enabled, xPos, yPos;
    int counter;
    float totalFrameCount;

    /*
    * Creates a new GokuEnemyBullet based on the given sprite and coordinates.
    */
    GokuEnemyBullet(PImage sprite, float currX, float currY, float targetX, float targetY) {
        this.sprite = sprite;
        this.currX = this.startX = currX;
        this.currY = this.startY = currY;
        
        this.targetX = targetX;
        this.targetY = targetY;
        this.xPos = (targetX > currX);
        this.yPos = (targetY > currY);
        enabled = true;
        totalFrameCount = 60;
    }

    /*
    * Draws and updates this object.
    */
    public void draw() {
        if (enabled) {
            ++counter;
            image(sprite, currX, currY);
            if (counter == 60)
                enabled = false;


            currX = lerp(startX, targetX, counter / totalFrameCount);
            currY = lerp(startY, targetY, counter / totalFrameCount);

            if (circleOverlap(currX, currY, sprite.width / 2, gokuGame.goku.currX, gokuGame.goku.currY, gokuGame.goku.sprite.width / 2)) {
                reset();
            }
        }
    }
}
class GokuEntity {
    float currX, currY;
    PImage sprite;
    int cooldown;

    /*
    * Creates a new GokuEntity based on the given sprite.
    */
    GokuEntity(PImage sprite) {
        this.sprite = sprite;
        currX = 150;
        currY = 150;
    }

    /*
    * Draws and updates this object.
    */
    public void draw() {
        pushMatrix();
        translate(currX, currY);
        image(sprite, 0, 0);
        popMatrix();
        if (cooldown > 0)
            --cooldown;
        currX = lerp(currX, mouseX, 0.02f);
        currY = lerp(currY, mouseY, 0.02f);
    }

    /*
    * Shoots a bullet if enough times has passed since the last one.
    */
    public void shoot() {
        if (cooldown == 0) {
            float targetX = PApplet.parseFloat(mouseX);
            float targetY = PApplet.parseFloat(mouseY);
            gokuGame.bullets.add(new GokuBullet(gokuGame.enemyBulletSprite, this.currX, this.currY, targetX, targetY));
            cooldown = 15;
        }
    }
}
class GokuGame {
    PImage backgroundImage, gokuSprite, enemySprite, enemyBulletSprite;
    GokuEntity goku;
    ArrayList<GokuEnemyBullet> enemyBullets = new ArrayList();
    ArrayList<GokuEnemy> enemies = new ArrayList();
    ArrayList<GokuBullet> bullets = new ArrayList();
    int counter, killCount;

    /*
    * Initializes all the data used by this object.
    */
    public void init() {
        state = 4;
        backgroundImage = loadImage("assets/goku_arena.png");
        gokuSprite = loadImage("assets/goku_seen_from_behind.png");
        enemySprite = loadImage("assets/saibamen.png");
        enemyBulletSprite = loadImage("assets/ball.png");
        gokuSprite.resize(64, 64);    
        enemySprite.resize(64, 64);
        enemyBulletSprite.resize(24, 24);
    
        surface.setSize(backgroundImage.width, backgroundImage.height);
        goku = new GokuEntity(gokuSprite);
        counter = 0;
        killCount = 0;
    }

    /*
    * Draws all the objects on the screen.
    */
    public void draw() {
        background(backgroundImage);
        if (counter != 40)
            ++counter;
        else {
            counter = 0;
            enemies.add(new GokuEnemy(enemySprite, random(0, backgroundImage.width), random(0, backgroundImage.height)));
        }

        goku.draw();
        for (GokuEnemyBullet bullet : enemyBullets) {
            bullet.draw();
        }
        for (GokuEnemy enemy : enemies) {
            enemy.draw();
        }
        for (GokuBullet bullet : bullets) {
            bullet.draw();
        }

        text(String.format("Your score: %s", killCount), 0, 25);
    }

    public void keyPressed() {
        switch (key) {
            case ESC: {
                key = 0;
                reset();
                break;
            }
            case 'z':
            case 'Z': {
                goku.shoot();
            }
        }
    }

    public void keyReleased() {
        //no.
    }

    public void mousePressed() {

    }
}
class GokuMenu {
    PImage backgroundImage;
    PImage text;
    int backButtonX, backButtonY, backButtonWidth, backButtonHeight, gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight;

    /*
    * Initializes all the data used by this object.
    */
    public void init() {
        state = 3;
        backgroundImage = loadImage("assets/goku_menu.png");
        backButtonX = 0;
        backButtonY = 580;
        backButtonWidth = gameButtonWidth = 200;
        backButtonHeight = gameButtonHeight = 100;

        gameButtonX = backgroundImage.width - gameButtonWidth; 
        gameButtonY = backgroundImage.height - gameButtonHeight;

        text = gradientText("Do you want to choose this character?", 750, 200, 36);

        surface.setSize(backgroundImage.width, backgroundImage.height);
    }

    /*
    * Draws the menu.
    */
    public void draw() {
        background(backgroundImage);

        fill(255,0,0,255);
        textSize(20);
        text("Goku is a character from Dragon Ball series that is considered the strongest guy.\n" +
"He gets stronger with each fight training until he is close to death.\n" +
"He is a nice guy that fights a lot with bad and good guys.\n" +
"He has a character development somewhere in the plot.", 0, 50);
        image(text, 125, 387);

        fill(224, 63, 90, 100);
        rectMode(CORNER);
        rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight);

        fill(255, 255, 255, 255);
        textSize(36);
        text("Go back", backButtonX + backButtonWidth / 2 - 60, backButtonY + backButtonHeight / 2 + 10);

        fill(64, 194, 227, 100);
        rectMode(CORNER);
        rect(gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight);

        fill(255, 255, 255, 255);
        textSize(36);
        text("Play game", gameButtonX + gameButtonWidth / 2 - 75, gameButtonY + gameButtonHeight / 2 + 10);
    }

    /*
    * Handles mouse presses, checking if a button was pressed.
    */
    public void mousePressed() {
        if (overRect(backButtonX, backButtonY, backButtonWidth, backButtonHeight)) {
            reset();
        } else if (overRect(gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight)) {
            gokuGame = new GokuGame();
            gokuGame.init();
        }
    }
}
class RainbowMenu {
    int red, green, blue;
    boolean decrement;

    /*
    * Initializes all the data used by this object.
    */
    public void init() {
        state = 5;
        red = 0;
        surface.setSize(1280, 720);
        colorMode(HSB);
        decrement = false;
    }

    /*
    * Draws a rainbow background.
    */
    public void draw() {
        if (red >= 255) {
            decrement = true;
        } else if (red <= 0) {
            decrement = false;
        }
        red = red + (decrement ? -1 : 1);
        background(red, 255, 255);
    }
}
/*
* Checks if the mouse cursor is over a mouse circle based on its coordinates and diameter.
*/
public boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;

    if (sqrt(sq(disX) + sq(disY)) < diameter/2) {
        return true;
    }
    return false;
}

/*
* Checks if the mouse is over a rectangle based on its coordinates and dimensions.
*/
public boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x + width && 
        mouseY >= y && mouseY <= y + height) {
            return true;
        }
    return false;
}

/*
* Checks if two circles overlap based on their positions and radii.
*/
public boolean circleOverlap(float x1, float y1, float r1, float x2, float y2, float r2) {
    float distSq = (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2);
    float radSumSq = (r1 + r2) * (r1 + r2);
    if (distSq == radSumSq || distSq <= radSumSq)
        return true;
    return false;
}

/*
* Draws a text colored with a gradient rainbow.
*/
public PImage gradientText(String text, int width, int height, int textImageSize) {
    int x = 0;
    PGraphics gradientMaskGraphics, textImageGraphics;
    PImage gradientMask, textImage;

    gradientMaskGraphics = createGraphics(width, height);
    gradientMaskGraphics.beginDraw();
    gradientMaskGraphics.colorMode(HSB, gradientMaskGraphics.width, 100, 100);
    gradientMaskGraphics.noStroke();
    x++;
    
    if (x > gradientMaskGraphics.width - 1) {x = 0;}
    for (int i = 0;i < gradientMaskGraphics.width; i++)   
    {
        gradientMaskGraphics.fill(i, 100, 100);
        gradientMaskGraphics.rect(i+x, 0, 1, 100);
        gradientMaskGraphics.rect(i+x-gradientMaskGraphics.width, 0, 1, 100);
        //gradientMaskGraphics.rect(i+x-(pg1.width*0), 0, 1, 100);
        gradientMaskGraphics.rect(i+x, 0, 1, 100);
    }

    gradientMaskGraphics.smooth();
    gradientMaskGraphics.endDraw();
    gradientMask = gradientMaskGraphics.get();

    textImageGraphics = createGraphics(width, height);
    textImageGraphics.beginDraw();
    textImageGraphics.textSize(textImageSize);
    textImageGraphics.text(text, 0, (int)((textImageSize * 1.5f)));
    textImageGraphics.smooth();
    textImageGraphics.endDraw();

    textImage = textImageGraphics.get();
    gradientMask.mask(textImage);

    return gradientMask;
}

/*
* Creates an image with a single color.
*/
public PImage colorImage(int width, int height, int r, int g, int b, int alpha) {
    PGraphics imageGraphics;

    imageGraphics = createGraphics(width, height);
    imageGraphics.beginDraw();

    imageGraphics.background(r, g, b, alpha);
    imageGraphics.endDraw();
    return imageGraphics.get();
}
class ZombieEntity {
    int currX;
    boolean enabled;
    PImage sprite;

    /*
    * Creates a new zombie entity based on the given sprite and background image.
    */
    ZombieEntity(PImage bg, PImage sprite) {
        currX = bg.width + 25;
        enabled = true;
        this.sprite = sprite;
    }
    
    /*
    * Updates the entity, checking if it has gone offscreen.
    */
    public void update() {
        if (currX > 0) {
            currX -= 3;
        } else {
            enabled = false;
       }
    }
        
   /*
   * Draws the entity.
   */
   public void draw() {
        image(sprite, currX, 128);
    }
}
  public void settings() {  size(720, 960); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "program" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
