//The green tubes that can collide with Mario.

class Tube {
  //variables
  PImage Tube;
  PImage Pipe;
  float Tubex;
  float Tubey;
  float Pipex;
  float Pipey;
  float speedX;


  //constructors
  Tube(float x, float y) {
    Tubex = x;
    Tubey = y;
    Tube = loadImage("Tube.png");
    Pipex = x;
    Pipey = y;
    Pipe = loadImage("Pipe.png");
    speedX = 1;
  }


  void display() {
    Tube.resize(0, 120);
    Pipe.resize(0, 120);
    image(Pipe, Pipex, Pipey);
    image(Tube, Tubex, Tubey);
  }

  void update() {
    Tubex = Tubex - 1;
    if (Tubex < -80) {
      Tubex = width + 200;
    }

    Pipex = Pipex - 1;
    if (Pipex < -80) {
      Pipex = width + 500;
    }
  }

  void checkCollison() {
  }
}
