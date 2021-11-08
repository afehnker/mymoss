class BulletBlue {
  float xPosBB;
  float yPosBB;
  float speed;
  //constructor
  BulletBlue(float init2X, float init2Y) {
    xPosBB = init2X;
    yPosBB = init2Y;
    speed = -5;
  }
  void move() {//moves the bullets from Blue
    xPosBB += speed;
  }
  void display() { //displays the blue bullets
    image(imgHeel, xPosBB-20, yPosBB-60, width/30, height/15);
  }
  void hitregestration() {// checks if it hits
    if (xPosBB <= AWhiteGirl.xPosWhiteGirl+50 &&
      xPosBB >= AWhiteGirl.xPosWhiteGirl &&
      yPosBB <= AWhiteGirl.yPosWhiteGirl+300 &&
      yPosBB >= AWhiteGirl.yPosWhiteGirl
      ) {
      Hit2 = true;
    }
  }
}
