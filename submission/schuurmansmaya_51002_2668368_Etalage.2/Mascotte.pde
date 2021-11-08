//Class Mascotte with movements

class Mascotte {
  PImage mascotte;
  float mascotteX = 50;
  float mascotteY = 580;
  float speed;

  Mascotte() {
    // mascotteX = x;
    // mascotteY = y;
    // speed = speedX;
    mascotte = loadImage("Intertoysguy.png");
  }

  //needed to display the png picture of the mascotte.
  void display() {

    image (mascotte, mascotteX, mascotteY);
   // rect(mascotteX+50, mascotteY+150, 50,50);
  }

  //neccessary to make the mascotte move to the left with the left arrow key
  void moveLeft() {
    mascotteX -=  10;
  }

  //necessary to make the mascotte  move to the right with the right arrow key
  void moveRight() {
    mascotteX += 10;
  }



  void drive(boolean direction) {
    if ((mascotteX + speed) > width && (direction)) {
      float remainder = float(width) - mascotteX;
      mascotteX = (speed - remainder);
    } else if ((mascotteX - speed)< 0 && !(direction)) {
      float remainder = mascotteX;
      mascotteX = width - (speed - remainder);
    } else {
      if (direction) mascotteX += speed;
      else mascotteX -= speed;
    }
  }

  //make the mascotte jump when the right key is pressed (this is checked by the y position of the mascotte)
  void jump() {
    velocity = velocity + 0.2;
    if (mascotteY + velocity > 590) {
      mascotteY =590;
      jump = false;
      velocity = velocityconst;
    } else {
      mascotteY += velocity;
    }
  }
}
