/*
The birb takes a walk across the top shelf, randomly pecking. 
 When clicked on, the birb panics and flies to the nest to hide.
 If the birb is in the nest and clicked on, then it will return to the shelf and continue pecking.
 
 Code written by Rosalie Luff and Natan van Bergem
 */
 
class Birb {

  float birbX;
  float birbY;
  float horizontalWalkSpeed;
  float horizontalFlySpeed;
  float verticalFlySpeed;
  float fleeSpeed;
  float shelfSpeed;
  int timeBirb1 = millis();
  int timeBirb2 = millis();
  int timeBirb3 = millis();
  boolean isPecking;
  boolean isFlying;
  boolean isReturning;
  PImage birbStanding;
  PImage birbStandingMirror;
  PImage birbPecking;
  PImage birbPeckingMirror;
  PImage birbFlying;
  PImage birbFlyingMirror;

  Birb(float initBirbX, float initBirbY) {
    birbX = initBirbX;
    birbY = initBirbY;
    birbX = constrain(birbX, 0, width);                                                   //constrained to the size of the window
    birbY = constrain(birbY, 0, height);
    birbStanding = loadImage("birbStanding.png");
    birbStandingMirror = loadImage("birbStandingMirror.png");
    birbPecking = loadImage("birbPecking.png");
    birbPeckingMirror = loadImage("birbPeckingMirror.png");
    birbFlying = loadImage("birbFlying.png");
    birbFlyingMirror = loadImage("birbFlyingMirror.png");
  }

//The birb or its mirror image will be displayed appropriate to the direction it is travelling in.
  void display() {
    if (isFlying) {
      if (dist(birb.birbX, birb.birbY, nest.nestX+15, nest.nestY-25) <=20) {            //when flying close enough to nest, it will display a still image
        image(birbStanding, birbX, birbY, 1920*1/5, 1080*1/5);
      } else if (horizontalFlySpeed > 0) {                                              //birb will face in the direction of travel when flying
        image(birbFlying, birbX, birbY, 1920*1/5, 1080*1/5);
      } else {
        image(birbFlyingMirror, birbX, birbY, 1920*1/5, 1080*1/5);
      }
    } else {
      if (isPecking) {                                                                  //pecking image displayed if isPecking is true
        if (horizontalWalkSpeed > 0) {
          image(birbPecking, birbX, birbY, 1920*1/5, 1080*1/5);
        } else {
          image(birbPeckingMirror, birbX, birbY, 1920*1/5, 1080*1/5);
        }
      } else {
        if (horizontalWalkSpeed > 0) {                                                  //standing image disaplyed if isPecking is false
          image(birbStanding, birbX, birbY, 1920*1/5, 1080*1/5);
        } else {
          image(birbStandingMirror, birbX, birbY, 1920*1/5, 1080*1/5);
        }
      }
    }
  }

//when the birb is not flying, it walks across the shelf at a randomised speed. 
  void walk() {
    if (!isFlying) { 
      birbX = constrain(birbX, width*1/5+150, width*4/5-50);                           //constrained to the size of the shelf
      birbX = birbX + horizontalWalkSpeed;
      if (millis() > timeBirb1 + random(600, 1400)) {                                  //the walking speed changes at a random interval
        horizontalWalkSpeed = random(-4, 4);
        timeBirb1 = millis();
      }
    }
  }

//when the birb is not flying, it pecks at a random interval.
  void pecc() {
    if (!isFlying) {
      if (millis() > timeBirb2 + random(1000, 2000)) {
        isPecking = true;                                                              //isPecking changes the image to birbPecking at random intervals whilst walking
        if (horizontalWalkSpeed > 0) {                                                 //checks inital walking speed, reduces to almost 0 so that the direction of the pecking image is consistant with the direction of the standing image 
          horizontalWalkSpeed = 0.1;
        } else {
          horizontalWalkSpeed = -0.1;
        }
        timeBirb2 = millis();
      }
      if (millis() > timeBirb3 + random(400, 500)) { 
        isPecking = false;                                                            //changes the image back to walking after a randomised interval
        timeBirb3 = millis();
      }
    }
  }

  //when birb is flying but returning, then it will fly straight to the nest.
  void flee() {
    if (!isReturning && isFlying) {
      birbX = birbX + horizontalFlySpeed;
      birbY = birbY + verticalFlySpeed;

      if (birb.birbX > nest.nestX+15) {                                               //checks the position of the birb in relation to the nest and chooses the appropriate direction
        horizontalFlySpeed =  random(-fleeSpeed, 0);
      } else {
        horizontalFlySpeed = random(0, fleeSpeed);
      }
      if (birb.birbY > nest.nestY-25) {
        verticalFlySpeed = random(-fleeSpeed, 0);
      } else {
        verticalFlySpeed = random(0, fleeSpeed);
      }
    }
  }

  //when birb is flying and also returning, then it will fly straight to the start position on the shelf.
  void shelf() {
    if (isReturning && isFlying) {
      birbX = birbX + horizontalFlySpeed;
      birbY = birbY + verticalFlySpeed;

      if (birb.birbX > width*1/3) {                                                  //checks the position of the birb in relation to the shelf and chooses the appropriate direction
        horizontalFlySpeed =  random(-shelfSpeed, 0);
      } else {
        horizontalFlySpeed = random(0, shelfSpeed);
      }
      if (birb.birbY > height*1/2-10) {
        verticalFlySpeed = random(-shelfSpeed, 0);
      } else {
        verticalFlySpeed = random(0, shelfSpeed);
      }
    }
  }
  
//boolean to check if the mouse is over the birb
  boolean mouseOverBirb(float initMouseX, float initMouseY) {
    if (
      initMouseX <= birbX+100 && 
      initMouseX >= birbX-100 &&
      initMouseY <= birbY+50  &&
      initMouseY >= birbY-50) {
      return true;
    } else {
      return false;
    }
  }
}
