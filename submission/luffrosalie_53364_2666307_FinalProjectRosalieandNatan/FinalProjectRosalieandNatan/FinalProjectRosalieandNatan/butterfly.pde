/*
Butterfly flies randomly around the window.
 When clicked, the butterfly is stunned.
 The butterfly will remain stunned until clicked again
 
 Code written mostly by Natan van Bergem
 */

class Butterfly {

  float butterflyX;
  float butterflyY;
  float horizontalSpeed;
  float verticalSpeed;
  int timeButterfly = millis();
  int timeButterfly2 = millis();
  int timeButterfly3 = millis();
  boolean isFlapping;
  boolean isStunned;
  PImage butterflyOpen;
  PImage butterflyOpenMirror;
  PImage butterflyClosed;
  PImage butterflyClosedMirror;

  Butterfly(float initButterflyX, float initButterflyY) {
    butterflyX = initButterflyX;
    butterflyY = initButterflyY;
    butterflyX = constrain(butterflyX, 0, width);                                                //constrained to the size of the window
    butterflyY = constrain(butterflyY, 0, height);
    butterflyOpen = loadImage("butterflyOpen.png");
    butterflyOpenMirror = loadImage("butterflyOpenMirror.png");
    butterflyClosed = loadImage("butterflyClosed.png");
    butterflyClosedMirror = loadImage("butterflyClosedMirror.png");
  }

//The butterfly or its mirror image will be displayed appropriate to the direction it is travelling in.
  void display() {
    if (isFlapping) {                                                                            //if isFlapping is true, it will display the butterflyOpen image
      if (horizontalSpeed > 0) {
        image(butterflyOpen, butterflyX, butterflyY, 1920*1/10, 1080*1/10);
      } else {
        image(butterflyOpenMirror, butterflyX, butterflyY, 1920*1/10, 1080*1/10);
      }
    } else {                                                                                     //if isFlapping is false, it will display the butterflyClosed image
      if (horizontalSpeed > 0) {
        image(butterflyClosed, butterflyX, butterflyY, 1920*1/10, 1080*1/10);
      } else {
        image(butterflyClosedMirror, butterflyX, butterflyY, 1920*1/10, 1080*1/10);
      }
    }
  }

//Directional Movement that changes every 0.4 seconds. Flapping occurs every 0.1 seconds
  void fly() {
    if (!isStunned) {
      butterflyX = butterflyX + horizontalSpeed;
      butterflyY = butterflyY + verticalSpeed;
      if (millis() > timeButterfly + 400) {
        horizontalSpeed = random(-4, 4);
        verticalSpeed = random(-3, 3);
        timeButterfly = millis();
      }
      if (millis() > timeButterfly2 + 100) {
        isFlapping = !isFlapping;
        timeButterfly2 = millis();
      }
    }
  }
//boolean to check if the mouse is over the butterfly
//Code written by Rosalie Luff
  boolean mouseOverButterfly(float initMouseX, float initMouseY) {
    if (
      initMouseX <= butterflyX+100 && 
      initMouseX >= butterflyX-100 &&
      initMouseY <= butterflyY+50  &&
      initMouseY >= butterflyY-50) {
      return true;
    } else {
      return false;
    }
  }
}
