//Bike
class Bike {
  PImage bikeWhole;
  PImage bikeAlone;
  PImage bikeFrame;

  int posX;
  int posY;
  int sizeX;
  int sizeY;
  int sizeBikeX;
  int sizeBikeY;
  float posBikeX; 
  int posBikeY;

  int x;

  boolean keyPress;
  //width/2, 520, 385, 300
  Bike() {
    posBikeX= width/2; 
    x=1;
    keyPress= false;
    bikeWhole = loadImage("bike.png");
    bikeAlone = loadImage("bikeAlone.png");
    bikeFrame = loadImage("bikeFrame.png");
  }

  void display(int posX, int posY, int sizeX, int sizeY, int sizeBikeX, int sizeBikeY, int posBikeY) {
    line(posX + sizeX/4, posY - sizeY*0.59, posX + sizeX/4, posY - sizeY/2);
    line(posX - sizeX/4, posY - sizeY*0.59, posX - sizeX/4, posY - sizeY/2);

    image(bikeWhole, posX, posY, sizeX, sizeY);
    image(bikeAlone, posBikeX, posBikeY, sizeBikeX, sizeBikeY);
    image(bikeFrame, posX, posY, sizeX, sizeY);

    //constrain and change the direction of the bike if key is pressed
    if (keyPress) {
      if (posBikeX > (posX + sizeX/2 - sizeBikeX/2) || posBikeX < (posX - sizeX/2 + sizeBikeX/2)) {
        x = -x;
      }
      posBikeX = posBikeX + (4 * x);
    }
  }

  void keyPress() {
    keyPress= true;
  }
  void keyRelease() {
    keyPress=false;
  }
}
