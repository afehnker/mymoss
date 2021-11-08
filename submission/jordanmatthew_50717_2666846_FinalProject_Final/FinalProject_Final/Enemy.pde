//Enemy class attacks the cowboy and is damaged by bullets
//Different enemy types are made by the gamemanager
class Enemy {
  
  //The gamemanager sets certain variables to different values to create 3 different types of enemies
  float x, y, angle, health;
  final float speed, damage, maxHealth;

  PImage sprite;
  int sizeX, sizeY, sizeAvg;


  Enemy (float newX, float newY, float newSpeed, float newDamage, float newHealth, String name) {
    //sets the starting position and angle of the enemy
    x = newX;
    y = newY;
    angle = 0;
    //Sets the speed, damage, health, and sprite of the enemy depending on what type the gameManager wants it to be
    speed = newSpeed;
    damage = newDamage;
    health = newHealth;
    //The name given by the gamemanager is used to determine the sprite of the enemy
    switch(name) {
    case "zombie":
      sprite = loadImage("Thing_0006_zombie1.png");
      sizeX = 40;
      sizeY = 68;
      break;
    case "ghoul":
      sprite = loadImage("Thing_0005_zombie2.png");
      sizeX = 44;
      sizeY = 68;
      break;
    case "skeleton":
      sprite = loadImage("Thing_0004_zombie3.png");
      sizeX = 36;
      sizeY = 68;
      break;
    }
    //average size is found and used for collisions
    sizeAvg = (sizeX+sizeY)/2;
    //maxhealth is recorded for use in drawing the healthbar
    maxHealth = health;
  }

  void moveEnemy(Cowboy cowboy) {
    //Finds the angle between the cowboy and enemy
    float targetAngle = degrees(atan2(cowboy.y - y, cowboy.x -x) + PI/2);
    //Lerps the enemy's curernt angle towards the target angle
    angle = lerp(angle, targetAngle, 0.5);
    //Moves the enemy forward based on its angle
    x += sin(radians(angle)) * speed;
    y -= cos(radians(angle)) * speed;
  }

  void drawEnemy() {
    //draws the enemy
    ellipseMode(CENTER);
    image(sprite, x, y, sizeX, sizeY);
    //Checks if the enemy has been damaged
    if(health < maxHealth){
      //If it has, draw a healthbar floating above it, based on its health
      rectMode(CENTER);
      fill(255, 0, 25);
      rect(x - 10, y - 60, health/2, 6);
    }
  }

  boolean isColliding (Cowboy cowboy) {
    //Returns true if enemy is within distance of the cowboy
    return dist(x, y, cowboy.x, cowboy.y) < sizeAvg;
  }

  boolean isDead (float damage) {
    //Removes health from the enemy
    health -= damage;
    //Returns true if health is below 0
    return health < 0;
  }
}
