//Class Mario with movements 

class Mario {
  //variables
  PImage Mario;
  float MarioX;
  float MarioY;
  float speed;
  float speedX;
  float s;

  //constructors
  Mario(float x, float y, float speedX) {
    MarioX = x;
    MarioY = y;
    speed = speedX;
    s = 15;
    Mario = loadImage("Mario.png");
  }

  //needed to display the png picture of Mario
  void display() {
    Mario.resize(0, 100);
    image (Mario, MarioX, MarioY);
  }

  //neccessary to make Mario move to the left with the left arrow key
  void moveLeft() {
    MarioX -= s;
  }

  //necessary to make Mario move to the right with the right arrow key
  void moveRight() {
    MarioX += s;
  }


  //checking the direction of mario to change his speed when he jumps.
  void drive(boolean direction) {
    if ((MarioX + speed) > width && (direction)) {
      float remainder = float(width) - MarioX;
      MarioX = (speed - remainder);
    } else if ((MarioX - speed)< 0 && !(direction)) {
      float remainder = MarioX;
      MarioX = width - (speed - remainder);
    } else {
      if (direction) MarioX += speed;
      else MarioX -= speed;
    }

    //borders for Mario
    if ((MarioX >= width-150 && speedX > 0) || (MarioX <= width+150 && speedX < 0)) {
      speedX = 0;
    }
  }

  //make Mario jump when the right key is pressed (this is checked by the y position of Mario)
  void jump() {
    velocity = velocity + 0.2;
    if (MarioY + velocity > 580) {
      MarioY = 580;
      jump = false;
      velocity = velocityconst;
    } else {
      MarioY += velocity;
    }
  }
}
