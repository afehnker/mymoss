//Class with the block objects and points Mario can collect. 
class Attributes {
  //variables
  PImage Question;
  float Questionx;
  float Questiony;
  float speedX;
  float speedY;
  float MarioX;
  float MarioY;

  //constructors
  Attributes(float x, float y) {
    Questionx = x;
    Questiony = y;
    speedX = 3;
    speedY = 3;
    Question = loadImage("Question.png");
  }

  //resizes the image to the right size and constructs the image.
  void display() {
    Question.resize(0, 40);
    image(Question, Questionx, Questiony);
  }

  //moving question blocks, that Mario needs to catch.
  void update() {
    Questionx = Questionx - 1;
    if (Questionx < -50) {
      Questionx = width + 100;
    }
  }

  //check for collison between Mario and the question block. if there is collision mario his speed stops.
  void checkCollision() {
    if ((MarioY >= Questiony+50) && (MarioY <= Questiony-50)) {
      speedY = 0;
    }
    if ((MarioX >= Questionx+50) && (MarioX <= Questionx-50)) {
      speedX = 0;
    }
  }
}
