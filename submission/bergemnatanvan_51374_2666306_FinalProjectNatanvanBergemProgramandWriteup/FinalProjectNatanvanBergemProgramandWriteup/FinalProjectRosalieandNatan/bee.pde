/*
The bees 'buzz' randomly and have a random flight path. 
 They are attracted to the plants when the mouse is dragged over the plant.
 They will lose attraction when the mouse is no longer being dragged and continue their randomised buzzing/flying.
 
 Code written by Natan van Bergem
 */

class Bee {

  float beeX;
  float beeY;
  float horizontalSpeed;
  float verticalSpeed;
  int timeBee = millis();
  boolean isClicked;
  PImage bee;

  Bee(float initBeeX, float initBeeY) {
    beeX = initBeeX;
    beeY = initBeeY;
    beeX = constrain(beeX, 0, width);                                 //constrained to the size of the window so they dont leave
    beeY = constrain(beeY, 0, height);
    bee = loadImage("bee.png");
  }

  void display() {
    image(bee, beeX, beeY, 226*1/4, 229*1/4);                         //scaled to appropriate size
  }

  void move() {
    beeX = beeX + random(-2, 2) + horizontalSpeed;                    //the 'buzz' of the bees 
    beeY = beeY + random(-2, 2) + verticalSpeed;
    if (millis() > timeBee + 500) {                                   //the flight path of the bees
      horizontalSpeed = random(-5, 5);                                
      verticalSpeed = random(-5, 5);
      timeBee = millis();
    }
  }

//the bees travel towards the mouseX and mouseY positions and keep 'buzzing'
//With help from Suzy Fuentes Bongenaar
  void smellFlower(float initMouseX, float initMouseY) {              
    if (beeX > initMouseX) {
      horizontalSpeed = random(-10, 0);
    } else {
      horizontalSpeed = random(0, 10);
    }

    if (beeY > initMouseY) {
      verticalSpeed = random(-10, 0);
    } else {
      verticalSpeed = random(0, 10);
    }
  }
}
