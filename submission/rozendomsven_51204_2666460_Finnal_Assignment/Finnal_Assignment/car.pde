//this class draws the car and controlls its movement.

class car {
  int posX;
  int posY;
  int speed;
  int rotation;
  int rotationSpeed;
  int dx;
  int dy;
  int damage = 0;
  boolean up;
  boolean down;
  boolean left;
  boolean right;

  car(int initX, int initY) {
    posX = initX;
    posY = initY;
  }

  void display() {
    pushMatrix();
    translate(posX, posY);
    rotate(radians(rotation));

    //draws car
    fill(0);
    stroke(0);
    rect(-35, -25, 10, 5);
    rect(-35, 25, 10, 5);
    rect(35, 25, 10, 5);
    rect(35, -25, 10, 5);
    fill(150, 150, 255);
    rect(0, 0, 100, 50);
    fill(255);
    rect(-15, 0, 70, 40);
    popMatrix();
  }
  void keyCheck(int Key) { //Checks the imput and saves it, because it is not possible to detect more than one key at the same time.
    if (Key == UP) {
      up = true;
    }
    if (Key == DOWN) {
      down = true;
    }
    if (Key == LEFT) {
      left = true;
    }
    if (Key == RIGHT) {
      right = true;
    }
  }

  void keyReCheck(int Key) {//Rechecks the imput to see which key has been released.
    if (Key == UP) {
      up = false;
    }
    if (Key == DOWN) {
      down = false;
    }
    if (Key == LEFT) {
      left = false;
    }
    if (Key == RIGHT) {
      right = false;
    }
  }
  void wallCheck() { //stops the car at the edge of the screen.
    if ((posX<0 && dx<0)||(posY<0 && dy<0)||(posX>width && dx>0)||(posY>height && dy>0)) {
      speed = -speed;
    }
  }
  void update() {
    //moves the car.
    dx = int(cos(radians(rotation))*speed);
    dy = int(sin(radians(rotation))*speed);
    posX = posX+dx;
    posY = posY+dy;
    rotation = rotation+rotationSpeed;

    //updates movement variables, the car has to be moving for the car to be able to turn. speed is reduced through damage
    if (up == true) {
      if (down == true) {//fixes unexpected input
        speed = 0;
      } else {
        speed = 11-damage;
      }
      if (left == true && right == true) {//fixes unexpected input
        rotationSpeed = 0;
      } else if (left == true) {
        rotationSpeed = -2;
      } else if (right == true) {
        rotationSpeed = 2;
      } else {
        rotationSpeed = 0;
      }
    } else if (down == true) {
      if (up == true) {//fixes unexpected input
        speed = 0;
      } else {
        speed = -11+damage;
      }
      if (left == true && right == true) {//fixes unexpected input
        rotationSpeed = 0;
      } else if (left == true) {
        rotationSpeed = 2;
      } else if (right == true) {
        rotationSpeed = -2;
      } else {
        rotationSpeed=0;
      }
    } else { //if no key is pressed, the car won't move.
      speed = 0;
      rotationSpeed=0;
    }
  }
  void collisionCheck() { // checks if the car hit a bottle or a wrench
    for (int i = 0; i < wine.length; i++) {
      if (abs(posX-wine[i].posX) <=100 && abs(posY-wine[i].posY) <=50) {
        if (destroyedBottle[i] == false) {
          damage++;
          destroyedBottle[i] = true; // sets hit bottle to broken
        }
      }
    }
    for (int i = 0;i < wrench.length;i++) {
       if (abs(posX-wrench[i].posX) <=100 && abs(posY-wrench[i].posY) <=50) {
        if (useWrench[i] == false) {
          damage--;
          damage--;
          if(damage < 0){
            damage = 0;
          }
          useWrench[i] = true; // sets hit wrench to used
        }
      }
    }
  }
}
