class GameManager {
  //Holds a cowboy and a soundmanager
  final Cowboy cowboy;
  final SoundManager soundmanager;
  
  //ArrayLists for each of the objects the gamemanager controls
  ArrayList<Beat> beats = new ArrayList();
  ArrayList<Enemy> enemies = new ArrayList();
  ArrayList<Bullet> bullets = new ArrayList();
  ArrayList<Response> responses = new ArrayList();
  ArrayList<Beer> beers = new ArrayList();
  
  //boolean for if the game is still going
  boolean cowboyAlive = true;
  //Counts the amount of excellent attacks the user makes, used for attacking with cacti
  int excellentCounter = 0;
  //timer and tempo for creating new beats
  int beatLastAdded = 0;
  int beatTempo = 1000;
  //difficulty variable, used to make game harder as time goes on
  float difficulty = 1;
  
  //rythmbar coordinates held as a variable, as they are used when determining damage
  final int rythmBarX = 400;
  final int rythmBarY = 680;
  final PImage rythmBarSprite;
  
  //background image
  final PImage bgImage;

  GameManager (SoundManager newSM) {
    //creates cowboy in center of screen
    cowboy = new Cowboy(width/2, height/2);
    soundmanager = newSM;
    //loads sprites
    rythmBarSprite = loadImage("Thing_0007_rythmBar.png");
    bgImage = loadImage("background.png");
    bgImage.resize(width, height);
  }

  void playGame() {
    //checks if cowboy is alive
    if (cowboyAlive) {
      //resets the screen with the background image
      background(bgImage);
      
      //increases difficulty very slightly
      difficulty += 0.0005;
      
      //Controls each of the objects the gamemanager is responsible for
      controlSongs();
      controlBeats();
      controlCowboy();
      controlEnemies();
      controlBullets();
      controlResponses();
      controlBeers();
      
      //draws each of the different objects
      drawGame();
    } else {
      //If game is over/cowboy is dead, write gameover on screen
      textAlign(CENTER);
      rectMode(CENTER);
      fill(255);
      textSize(50);
      text("Game Over", width/2, 400, 400, 200);
      text("Retry?", width/2, 510, 400, 200);
    }
  }

  void drawGame () {
    //draws each of the objects in the correct y-order
    for (int i = 0; i < beers.size(); i++) {
      beers.get(i).drawBeer();
    }
    for (int i = 0; i < enemies.size(); i++) {
      enemies.get(i).drawEnemy();
    }
    for (int i = 0; i < bullets.size(); i++) {
      bullets.get(i).drawBullet();
    }
    for (int i = 0; i < responses.size(); i++) {
      responses.get(i).drawResponse();
    }
    //draws cowboy
    cowboy.drawCowboy();
    //beats are at the top of the screen
    for (int i = 0; i < beats.size(); i++) {
      beats.get(i).drawBeat();
    }
    //draws rythm bar above beats
    imageMode(CENTER);
    image(rythmBarSprite, rythmBarX, rythmBarY, 28, 120);
    textAlign(LEFT);
    rectMode(CORNER);
    fill(255);
    textSize(40);
    //text for how many cacti the player can use
    //depends on the amount of 'excellent' attacks they make
    text("CACTI: " + excellentCounter, 40, 40, 400, 200);
  }
  
  //void is called when player hits an arrow key
  void attack (AttackType AT) {
    //first checks if there are any beats to hit/miss
    if (beats.size() > 0) {
      //if there is set the first beat in the array as a variable
      //The beat in index 0, will always be the leftmost beat on the screen
      Beat beat = beats.get(0);
      //determine the distance between the beat and the rythm bar
      float distance = abs(rythmBarX - beat.x);
      //check if the beat is within hitting distance
      //also check if the input of the user matches with the attack type of the beat
      if (AT == beat.AT && distance < 70) {
        //determine the damage using distance
        float damage = (1300 / (distance + 20)) - 15;
        //depending on the attacktype of the beat, create some bullets, giving them the determined power
        switch(AT) {
        case ONESHOT:
          //different attack types create different bullets with different power, speed, and penetration
          damage *= 5;
          bullets.add(new Bullet(cowboy.x, cowboy.y, cowboy.angle, 3, damage, 5, AT));
          break;
        case LASER:
          damage *= 1;
          //This bullet type creates several bullets with different speeds
          for (int i = 0; i < 6; i++) {
            bullets.add(new Bullet(cowboy.x, cowboy.y, cowboy.angle, 10 - ((i-3)*1.5), damage, 2, AT));
          }
          break;
        case WAVE:
          damage *= 0.5;
          //This bullet type creates several bullets in a wave pattern
          for (int i = 0; i < 8; i++) {
            bullets.add(new Bullet(cowboy.x, cowboy.y, cowboy.angle - radians((i-4)*20), 10, damage, 6, AT));
          }
          break;
        case SPRAY:
          damage *= 2;
          //This bullet type creates several bullets with random angles
          for (int i = 0; i < 4; i++) {
            bullets.add(new Bullet(cowboy.x, cowboy.y, cowboy.angle - radians(random(-60, 60)), 20, damage, 2, AT));
          }
          break;
          //There shouldnt be a case where a beat has attacktype.cactus
        case CACTUS:
          break;
        }
        //depending on the distance from the beat to the rythm bar send a response, the closer the better
        if (distance < 7) {
          //if the distance is really small, send an 'excellent'
          responses.add(new Response(int(beat.x), beat.y, 1000, "Excellent"));
          //Also increase the excellent counter, but keep it below 5
          excellentCounter = constrain(excellentCounter + 1, 0, 5);
          //Also have a chance to add a beer, checks if random between 1 and 0 is lower than 0.3
          //This means there is a 30% chance to create a beer
          if (random(0, 1) < 0.3) {
            //Create a beer and add it to the beers array
            beers.add(new Beer());
          }
        } else if (distance < 30) {
          responses.add(new Response(int(beat.x), beat.y, 1000, "Nice"));
        } else {
          responses.add(new Response(int(beat.x), beat.y, 1000, "Okay"));
        }
      } else {
        //if it is outside of hitting distance, or if the user input the wrong arrow key, respond with a 'miss'
        responses.add(new Response(int(beat.x), beat.y, 1000, "Miss"));
      }
      //Remove the beat from the array, thus deleting it
      beats.remove(0);
    }
  }
  
  //recieved when user presses 'e'
  void cactusAttack() {
    //check if the excellent counter is bigger than 0, if it is the user can use a cactus attack
    if (excellentCounter > 0) {
      //remove 1 use from the excellent counter
      excellentCounter--;
      //Create a new bullet of Attack type Cactus
      bullets.add(new Bullet(cowboy.x, cowboy.y, cowboy.angle, 10, 50, 10, AttackType.CACTUS));
    }
  }

  void controlSongs() {
    //make sure soundmanager has songs to avoid null point exception
    if (soundmanager.hasSongs()) {
      //check if a song is playing
      if (!soundmanager.isPlayingSong()) {
        //if a song isnt playing, start a new one
        beatTempo = soundmanager.playSong();
      }
    }
  }

  void controlCowboy() {
    //tells cowboy to move
    cowboy.moveCowboy();
    //checks if there is atleast 1 enemy to avoid null point exception
    if (enemies.size() > 0) {
      //tells the cowboy to aim, and gives it the enemies array
      cowboy.aimCowboy(enemies);
    }
  }

  void controlBeats() {
    //check if another beat should be added, by looking at how much time has passed since the last beat was added
    //dependent on tempo and the difficultly
    if (millis() - beatLastAdded > beatTempo / (difficulty / 3)) {
      //add a new beat of a random attack type
      beats.add(new Beat(AttackType.values()[floor(random(0, 3.99))]));
      //records the time at which the beat was added
      beatLastAdded = millis();
    }
    //checks if there is at least 1 beat
    if (beats.size() > 0) {
      //checks if beat is out of bounds
      //only needs to check beats index 1 because it is the leftmost beat
      if (beats.get(0).isOutOfBounds()) {
        //if beat is out of bounds remove it and add a 'miss' response
        responses.add(new Response(int(beats.get(0).x), beats.get(0).y, 1000, "Miss"));
        beats.remove(0);
      }
    }
    for (int i = 0; i < beats.size(); i++) {
      //move all of the beats
      beats.get(i).moveBeat();
    }
  }

  void controlEnemies() {
    for (int i = 0; i < enemies.size(); i++) {
      //move each enemy towards the cowboy
      enemies.get(i).moveEnemy(cowboy);
      //check if each enemy is colliding with the cowboy
      if (enemies.get(i).isColliding(cowboy)) {
        //if they are damage the cowboy by the enemies damage and simultaniously check if the cowboy isDead
        if (cowboy.isDead(enemies.get(i).damage)) {
          //if the cowboy is dead, call the gameOver method
          gameOver();
        }
        //remove the enemy from the array
        enemies.remove(i);
      }
    }
    //call method to add more enemies
    addEnemies();
  }

  void addEnemies() {
    //find spawnrate, dependant on the difficulty
    float spawnRate = 1 + ((difficulty - 1) / 4);
    //check if a random number is lower than spawnrate
    if (random(100) < spawnRate) {
      //if it is, a new enemy will be spawned
      //get a random position
      float spawnX = random(-200, width + 200);
      float spawnY = random(-200, width + 200);
      //check if the random position is far away from the cowboy
      while (dist(spawnX, spawnY, cowboy.x, cowboy.y) < 200) {
        //if it isnt, find another position and try again
        spawnX = random(-200, width + 200);
        spawnY = random(-200, width + 200);
      }
      //decide a random enemy type using a random int
      int enemyType = floor(random(0, 2.99));
      //depending on the enemy type, spawn either a group or single enemy, giving them different attributes
      if (enemyType == 1) {
        //decide a group size by getting a random int
        //group size changes with difficulty
        int amount = int(random(2, difficulty * 6));
        for (int i = 0; i < amount; i++) {
          //skeletons are fast but weak and spawn in big groups
          enemies.add(new Enemy(spawnX + random(-50, 50), spawnY + random(-50, 50), 4, 3, 15, "skeleton"));
        }
      } else if (enemyType == 2) {
        int amount = int(random(1, difficulty * 1));
        for (int i = 0; i < amount; i++) {
          //ghouls are slow but strong, usually a small group or single
          enemies.add(new Enemy(spawnX + random(-50, 50), spawnY + random(-50, 50), 1, 15, 100, "ghoul"));
        }
      } else {
        int amount = int(random(1, difficulty * 3));
        for (int i = 0; i < amount; i++) {
          //zombies are all round mediums
          enemies.add(new Enemy(spawnX + random(-50, 50), spawnY + random(-50, 50), 2, 8, 70, "zombie"));
        }
      }
    }
  }

  void controlBullets() {
    for (int i = 0; i<bullets.size(); i++) {
      Bullet bullet = bullets.get(i);
      //move each bullet
      bullet.moveBullet();
      if (bullet.isOutOfBounds()) {
        //check if each bullet is off the screen and remove it if it is
        bullets.remove(i);
        //use continue to skip the rest of the loop and avoid a null point exception
        continue;
      }
      for (int j = 0; j < enemies.size(); j++) {
        //for each bullet and each enemy, check if they are colliding
        if (bullet.isColliding(enemies.get(j))) {
          //if they are, damage the enemy and check if it is dead
          if (enemies.get(j).isDead(bullet.damage)) {
            //if it is dead, remove it
            enemies.remove(j);
          }
          //check if bullet has hit too many enemies
          if (bullet.isDone()) {
            //if it has, remove it
            bullets.remove(i);
            break;
          }
        }
      }
    }
  }

  void controlResponses() {
    for (int i = 0; i < responses.size(); i++) {
      //check if each response has finished its lifetime
      if (responses.get(i).isOver()) {
        //if it has, remove it
        responses.remove(i);
      }
    }
  }

  void controlBeers() {
    for (int i = 0; i < beers.size(); i++) {
      //check if each beer is within range of the cowboy
      if (beers.get(i).isDrank(cowboy.x, cowboy.y)) {
        //if it is remove it
        beers.remove(i);
        //add health to the cowboy
        cowboy.addHealth(10);
      }
    }
  }

  void gameOver() {
    //set cowboy alive to false, stopping the game
    cowboyAlive = false;
    //tell the soundmanager to stop playing the current song
    soundmanager.stopPlayingSong();
  }

  void handleMouse(int mX, int mY) {
    if (!cowboyAlive) {
      //if the game is over check if the restart button is being pressed
      if (mX < width/2+200 && mX > width/2-200 && mY < height/2+200 && mY > height/2-200 ) {
        startNewGame();
      }
    }
  }
}
