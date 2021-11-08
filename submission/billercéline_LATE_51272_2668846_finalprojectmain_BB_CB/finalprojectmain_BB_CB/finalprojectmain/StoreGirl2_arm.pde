class BlueGirl_Arm {
  float rotateDegree = 0;

  void display() {
    if (keyX) { //if x is pressed it displays the turning arm
      pushMatrix();
      translate( ABlueGirl.xPosBlueGirl+105, ABlueGirl.yPosBlueGirl+40);
      rotateDegree = rotateDegree-0.15;
      if (rotateDegree <= -TWO_PI) {
        rotateDegree =0;
      }
      rotate(rotateDegree);
      image(imgArm2, -12, -5, width/30, height/10);
      popMatrix();
    } else if (rotateDegree !=0) {//when the rotate degree is not zero the arm is still rotating, when it is still rotating it will keep on turning until in its original position
      pushMatrix();
      translate( ABlueGirl.xPosBlueGirl+105, ABlueGirl.yPosBlueGirl+40);
      rotateDegree = rotateDegree-0.15;
      if (rotateDegree <= -TWO_PI ) {
        rotateDegree =0;
      }
      rotate(rotateDegree);
      image(imgArm2, -12, -5, width/30, height/10);
      popMatrix();
    } else {//if the arm is not turning it also gets drawn
      image(imgArm2, ABlueGirl.xPosBlueGirl+97, ABlueGirl.yPosBlueGirl+36, width/30, height/10);
    }
  }
}
