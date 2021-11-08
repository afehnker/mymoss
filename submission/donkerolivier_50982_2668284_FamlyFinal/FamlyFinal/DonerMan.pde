class DonerMan {
  float xMan, yMan, scaleMan;
  PImage manimage, blinkimage;
  boolean manBlinking = false;

  DonerMan(float initX, float initY, float initScale) {
    xMan = initX;
    yMan = initY;
    scaleMan = initScale;
    manimage = loadImage("donerman.png");          //Both images by me, inspired by Wario.
    blinkimage = loadImage("donermanblink.png");
  }

  void display() {
    pushMatrix();
    translate(xMan, yMan);
    scale(scaleMan);
    if (manBlinking == true) {
      image(blinkimage, 0, 0);
    } else {
      image(manimage, 0, 0);
    }
    popMatrix();
  }

  void makeBlinkTrue() {      //These two last methods are called in main with the blink timer, to keep the class nicely read-only!
    manBlinking = true;
  }

  void makeBlinkFalse() {
    manBlinking = false;
  }
}
