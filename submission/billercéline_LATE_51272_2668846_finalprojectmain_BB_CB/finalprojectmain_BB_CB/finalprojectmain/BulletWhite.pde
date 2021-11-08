class BulletWhite {
  float xPosBW;
  float yPosBW;
  float speed;
  float hittimer;

  BulletWhite(float initX, float initY) {
    xPosBW = initX;
    yPosBW = initY;
    speed = -5;
  }
  void move() {//moves the white bullets
    xPosBW -= speed;
  }
  void display() {//displays the white heels
    image(imgHeel, xPosBW-20, yPosBW-60, width/30, height/15);
  }
  void hitregestration() { //checks if the heels hit
    if (xPosBW <= ABlueGirl.xPosBlueGirl+50 &&
      xPosBW >= ABlueGirl.xPosBlueGirl &&
      yPosBW <= ABlueGirl.yPosBlueGirl+300 &&
      yPosBW >= ABlueGirl.yPosBlueGirl
      ) {
      Hit = true;
    }
  }
}
