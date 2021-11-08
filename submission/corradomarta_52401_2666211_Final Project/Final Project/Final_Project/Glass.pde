//Glass
//The glass moves continuously as if the woman is drinking from it

class Glass {
  PImage photo;
  PImage glass;

  float posX;
  float posY;
  float sizeX;
  float sizeY;

  int animationState = 0;
  int[] rotations = {0, -5};

  boolean keyPress;

  Glass() {
    keyPress= false;
    photo = loadImage("glass-copy.png");
    glass = loadImage("glass glass.png");
  }

  void display(float posX, float posY, float sizeX, float sizeY) {
    //lines that hold the poster
    line(posX + 5 - sizeX/2, posY - sizeY/2 - 2, posX, 500);
    line(posX - 5 + sizeX/2, posY - sizeY/2 - 2, posX, 500);

    image(photo, posX, posY, sizeX, sizeY);

    //rotate the glass if key is pressed
    if (keyPress) {
      pushMatrix();
      translate(posX, posY);
      rotate(radians(rotations[animationState]));
      image(glass, 0, 0, sizeX, sizeY);
      popMatrix();
      animationState = (animationState + 1) % rotations.length;
    }
  }

  void keyPress() {
    keyPress= true;
  }  
  void keyRelease() {
    keyPress=false;
  }
}
