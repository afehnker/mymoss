//Skiing woman
class Ski {
  PImage ski;
  PImage skiFrame;

  int posX;
  int posY;
  int sizeX;
  int sizeY;

  boolean keyPress;

  Snow[] particles = new Snow[100];

  Ski() {
    keyPress= false;

    //initialize the snow
    for (int i = 0; i < particles.length; i++) {
      particles[i] = new Snow();
    }

    ski = loadImage("ski.jpg");
    skiFrame = loadImage("skiFrame.png");
  }

  void display(int posX, int posY, int sizeX, int sizeY) {
    image(ski, posX, posY, sizeX, sizeY);

    //lines that hold the poster
    line(posX + 5 - sizeX/2, posY - sizeY/2 - 2, posX, 500);
    line(posX - 5 + sizeX/2, posY - sizeY/2 - 2, posX, 500);

    //if key is pressed, draw the snow
    if (keyPress) {
      for (Snow particle : particles) {
        particle.display(posX, posY, sizeX, sizeY);
      }
    }

    image(skiFrame, posX, posY, sizeX, sizeY);
  }

  void keyPress() {
    keyPress= true;
  }
}
