//Upset Girl
class Girl {
  PImage girl;
  PImage eyes;
  PImage white;

  int posX;
  int posY;
  int sizeX;
  int sizeY;
  float pupils = 0;

  boolean keyPress;

  TearDx[] tearsDx = new TearDx[3];
  TearSx[] tearsSx = new TearSx[3];

  Girl() {
    keyPress= false;
    white = loadImage("tears (1) copy 3.png");
    girl = loadImage("tears (1) copy 2.png");
    eyes = loadImage("eyes.png");

    for (int i = 0; i < tearsDx.length; i++) {
      tearsDx[i] = new TearDx();
    }
    for (int i = 0; i < tearsSx.length; i++) {
      tearsSx[i] = new TearSx();
    }
  }

  void display(int posX, int posY, int sizeX, int sizeY) {
    stroke(0);

    //lines that hold the poster
    line(posX + sizeX/4, posY - sizeY*0.666, posX + sizeX/4, posY - sizeY/2);
    line(posX - sizeX/4, posY - sizeY*0.666, posX - sizeX/4, posY - sizeY/2);

    image(white, posX, posY, sizeX, sizeY);

    float movePupils = posX+8*sin(pupils);
    pupils = pupils+0.3;

    image(eyes, movePupils, posY, sizeX, sizeY);

    image(girl, posX, posY, sizeX, sizeY);

    if (keyPress) {
      for (int i = 0; i < tearsDx.length; i++) {
        tearsDx[i].falling();
        tearsDx[i].display();
      }
      for (int i = 0; i < tearsSx.length; i++) {
        tearsSx[i].falling();
        tearsSx[i].display();
      }
    }
  }

  void keyPress() {
    keyPress= true;
  }
  void keyRelease() {
    keyPress=false;
  }
}
