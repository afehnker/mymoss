class Door {
  // a moving door
  float doorX;
  float doorY;
  float speedX;
  float leftWidth;      //right bar of the left door moves
  float rightWidth;      //left bar of the right door moves
  float speedMiddle;    // the speed of the background once the door opens
  float middleWidth;    //the x value of the background behind the doors.
  boolean upIsPressed;


  Door() {
    doorX = width/2;
    doorY = height/2;
    speedX = -1;
    leftWidth = 200;
    rightWidth = -200;
    speedMiddle = 2;
    middleWidth = 20;
    upIsPressed = false;
  }

  void display() {

    rectMode(CENTER);
    //   background when doors open
    fill(#69AA74);

    rect(doorX+235, doorY+50, middleWidth, 700);
    fill(#b5b898);
    stroke(0);
    strokeWeight(2);
    rect(doorX+235, doorY+300, middleWidth, 200);

    rectMode(CORNER);
    strokeWeight(20);
    stroke(220);
    noFill();
    //left door
    rect(doorX+35, doorY-290, leftWidth, 680);
    //right door
    rect(1335, doorY-290, rightWidth, 680);
  }
  void update() {
    if (!upIsPressed) {
      if (!(leftWidth>=200)) {
        leftWidth -= speedX;    //right bar of the left door moves
        rightWidth += speedX;  //left bar of the right door moves
        middleWidth -= speedMiddle; // background in shop
      }
    }
    if (upIsPressed) {
      if (!(leftWidth<=50)) {
        leftWidth += speedX;             //right bar of the left door moves
        rightWidth -= speedX;             //left bar of the right door moves
        middleWidth += speedMiddle;        //background in the shop
      }
    }
  }
  void upPressed() {
    upIsPressed = true;
  }
  void downPressed() {
    upIsPressed = false;
  }
}
