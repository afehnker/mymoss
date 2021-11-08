//Bullets are used to deal damage to the enemys
//Bullets can have different speeds, damages, pentraion, and appearances
class Bullet {
  //Variables that cannot be changed after initialization
  final float angle, speed, damage;
  //Penetration is the amount of enemies a bullet can collide with before it broken/finished
  final int sizeX, sizeY, sizeAvg, penetration;
  final PImage sprite;
  
  //Variables that can change
  float x, y;
  int hits = 0;
  ArrayList<Enemy> collidedEnemies = new ArrayList();
  
  //Constructort class, used by the gamemanager to create new bullets of different statistics/types
  Bullet (float newX, float newY, float newAngle, float newSpeed, float newDamage, int newPenetration, AttackType AT) {
    //At the start the bullet is set to the cowboys position
    x = newX;
    y = newY;
    //The angle is set to the angle between the cowboy and the closest enemy
    angle = newAngle;
    
    //These variables are determined based on the attack type of the bullet
    //the gamemanager handles this part
    speed = newSpeed;
    damage = newDamage;
    penetration = newPenetration;
    //The sprite also changes based on the attack type of the bullet
    switch(AT) {
    case ONESHOT:
      sprite = loadImage("Thing_0011_attack3.png");
      sizeX = 32;
      sizeY = 32;
      break;
    case LASER:
      sprite = loadImage("Thing_0010_attack2.png");
      sizeX = 24;
      sizeY = 52;
      break;
    case SPRAY:
      sprite = loadImage("Thing_0012_attack4.png");
      sizeX = 64;
      sizeY = 64;
      break;
    case WAVE:
      sprite = loadImage("Thing_0009_attack1.png");
      sizeX = 96;
      sizeY = 36;
      break;
    case CACTUS:
      sprite = loadImage("cactus.png");
      sizeX = 64;
      sizeY = 64;
      break;
    default:
      sprite = loadImage("cactus.png");
      sizeX = 0;
      sizeY = 0;
    }
    //The average size of the bullet is found, this is used for checking collisions
    sizeAvg = (sizeX+sizeY)/2;
  }

  void drawBullet () {
    //When drawing the bullet it is rotated depending on its direction of travel
    pushMatrix();
    //translated to 0, 0 before being rotated so it can rotate around its center
    translate(x, y);
    //rotated by angle
    rotate(angle);
    imageMode(CENTER);
    image(sprite, 0, 0, sizeX, sizeY);
    popMatrix();
  }

  void moveBullet() {
    //Moves the bullet forward, depending on its angle
    x += sin(angle) * speed;
    y -= cos(angle) * speed;
  }

  boolean isColliding (Enemy enemy) {
    //Checls if the bullet is colliding with a given enemy
    //Also checks that it hasnt already collided with the enemy, by checking if the enemy is in the collidedEnemy arraylist, this is so it doesnt deal damage to a single enemyv more than once
    if (dist(x, y, enemy.x, enemy.y) < sizeAvg && !collidedEnemies.contains(enemy)) {
      //Adds to the hit counter of the bullet, used to determine how many times the bullet has collided
      hits ++;
      //Adds the hit enemy to the collidedEnemy arraylist so they will not collide again
      collidedEnemies.add(enemy);
      //returns true if enemy was hit
      return true;
    }
    return false;
  }

  boolean isOutOfBounds () {
    //returns true if the bullet is off-screen
    return x < 0 - sizeAvg || x > width + sizeAvg || y < 0 - sizeAvg || y > height + sizeAvg;
  }

  boolean isDone() {
    //returns true if the bullet has collided with more or equal amount of enemies compared to its penetration level
    return hits >= penetration;
  }
}
