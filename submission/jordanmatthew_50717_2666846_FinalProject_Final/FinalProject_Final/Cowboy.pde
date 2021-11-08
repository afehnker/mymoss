//The cowboy is controlled by the user, and needs to avoid enemies to live
class Cowboy {
  final float speed = 5;
  final PImage sprite;

  float x, y;
  float angle = 0;
  float health = 100;

  Cowboy (float newX, float newY) {
    //sets the starting position of the cowboy
    x = newX;
    y = newY;
    //loads the sprite for the cowboy
    sprite = loadImage("Thing_0013_cowboy.png");
  }

  void drawCowboy() {
    imageMode(CENTER);
    image(sprite, x, y, 80, 88);
    
    //This is a healthbar that floats above the cowboys head
    //It gets shorter as the health decreases
    fill(150, 255, 150);
    rectMode(CENTER);
    rect(x - 10, y - 60, health / 2, 6);
  }

  void moveCowboy() {
    //Cowboy moves depending on which keys are pressed
    //The values of the keys array correspond to the WASD keys
    if (keys[0]) {
      y -= speed;
    } else if (keys[2]) {
      y += speed;
    }
    if (keys[1]) {
      x -= speed;
    } else if (keys[3]) {
      x += speed;
    }
    //Checks if the cowboy is on the screen and brings him back if he isnt
    if (x < 0) {
      x = 0;
    } else if (x > width) {
      x = width;
    }
    if (y < 0) {
      y = 0;
    } else if (y > height) {
      y = height;
    }
  }
  
  //Aims the cowboy at the nearest enemy, recieves the array of enemies from the gamemanger
  //gamemanger will only call this void if there is at least 1 enemy
  void aimCowboy(ArrayList<Enemy> enemy) {
    //Sets an Enemy variable to the first enemy in the recieved array, this is the current closest enemy
    Enemy closest = enemy.get(0);
    //Searches through all the enemies starting at index 1
    for (int i = 1; i < enemy.size(); i++) {
      Enemy newE = enemy.get(i);
      //Ckecks if the enemy at index i is closer than the current closest enemy
      if (dist(x, y, newE.x, newE.y) < dist(x, y, closest.x, closest.y)) {
        //If the new enemy is closer, the closest enemy is set to it
        closest = newE;
      }
    }
    //Calculates and sets the cowboys angle to the closest enemy and the cowboy
    angle = atan2(closest.y - y, closest.x - x) + PI/2;
  }

  void addHealth(int addition) {
    //Adds to the cowboys health, keeps it lower than 100
    health = constrain(health + addition, 0, 100);
  }

  boolean isDead (float damage) {
    //Removes health from the cowboy
    health -= damage;
    //Return true if the cowboy is lower than 0 health
    return health < 0;
  }
}
