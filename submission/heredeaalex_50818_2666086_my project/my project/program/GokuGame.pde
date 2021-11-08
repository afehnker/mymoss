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
    void init() {
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
    void draw() {
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

    void keyPressed() {
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

    void keyReleased() {
        //no.
    }

    void mousePressed() {

    }
}