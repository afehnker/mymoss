class WhiteGirl_Arm {
  float rotateDegree = 0;

  void display() { //displays the arm
    if (keyM) {//if m is pressed the arm starts to turn
      pushMatrix();
      translate( AWhiteGirl.xPosWhiteGirl+33, AWhiteGirl.yPosWhiteGirl+44);
      rotateDegree = rotateDegree+0.15;
      if (rotateDegree >= TWO_PI) {
        rotateDegree =0;
      }
      rotate(rotateDegree);
      image(imgArm1, -30, -13, width/30, height/10);
      popMatrix();
    } else if (rotateDegree !=0) {//if the rotatedegree is not zero than the arm is turned all the way around until it is at zero again, this makes for a smooth motion
      pushMatrix();
      translate( AWhiteGirl.xPosWhiteGirl+33, AWhiteGirl.yPosWhiteGirl+44);
      rotateDegree = rotateDegree+0.15;
      if (rotateDegree >= TWO_PI ) {
        rotateDegree =0;
      }
      rotate(rotateDegree);
      image(imgArm1, -30, -13, width/30, height/10);
      popMatrix();
    } else { //draws the arm if it is not spinning
      image(imgArm1, AWhiteGirl.xPosWhiteGirl+6, AWhiteGirl.yPosWhiteGirl+30, width/30, height/10);
    }
  }
}
