/*
 The Glass is part of the Fill the Glass game and is created with an image.
 A Glass can be selected and "filled". 
 For filling the glass, the image is changed.
 
 Illustrations made by Jacelynn Moesker
 Code written by Jacelynn Moesker and Susanne Fuentes Bongenaar
*/

class Glass {
  float glassX;
  float glassY;
  int fillCounter;
  PImage[] glassImage = new PImage[5];


  Glass(float initX, float initY) {
    glassX = initX;
    glassY = initY;
    fillCounter = 0;
    for (int i = 0; i < glassImage.length; i++) {
      glassImage[i] = loadImage(i+"glass.png");
    }
  }

  void display() {
    pushMatrix();
    translate(glassX, glassY);
    imageMode(CENTER);
    image(glassImage[constrain(fillCounter, 0, 4)], 0, 0, 64, 117);
    popMatrix();
  }

  void fillUp() {
    fillCounter++;
  }

  boolean isFull() {
    return fillCounter == 4;
  }
}
