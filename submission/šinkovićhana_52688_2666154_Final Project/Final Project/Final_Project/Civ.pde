//Civilization - Danny Kaye & The Andrew Sisters
class Civ {
  PImage civWhole;
  PImage civDisc;

  float angleRotate;

  int posX;
  int posY;
  int sizeX;
  int sizeY;
  int sizeDiscX;
  int sizeDiscY;

  boolean keyPress;

  Civ() {
    angleRotate = 0.0; 
    keyPress= false;
    civWhole = loadImage("Civ.jpg");
    civDisc = loadImage("CivDisc.png");
  }

  void display(int posX, int posY, int sizeX, int sizeY, int sizeDiscX, int sizeDiscY) {
    line(posX, 0, posX, 30);

    image(civWhole, posX, posY, sizeX, sizeY);

    //rotate the inside disc if key is pressed
    if (keyPress) {
      pushMatrix();
      translate(posX, posY);
      rotate(radians(angleRotate));
      image(civDisc, 0, 0, sizeDiscX, sizeDiscY);
      popMatrix();
      angleRotate += 1.5;
    }
  }

  void keyPress() {
    keyPress= true;
  }  
  void keyRelease() {
    keyPress=false;
  }
}
