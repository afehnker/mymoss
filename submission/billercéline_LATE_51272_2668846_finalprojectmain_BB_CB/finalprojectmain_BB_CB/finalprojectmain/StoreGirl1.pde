class WhiteGirl {
  float xPosWhiteGirl = 200;
  float yPosWhiteGirl = 300;
  float xSpeed;
  float ySpeed;
  float hittimer;

  WhiteGirl(float initX, float initY) {
    xPosWhiteGirl = initX;
    yPosWhiteGirl = initY;
    xSpeed = 0;
    ySpeed = 0;
  }
  void display() {//displays the mannequin1
    if (!Hit2) {//if not hit is displays the normal face
      image(imgManneQuin1, xPosWhiteGirl, yPosWhiteGirl, width/11, height/3);
      //changes hittimer to 0 every time
    } else  image(imgManneQuin1Mad, xPosWhiteGirl, yPosWhiteGirl, width/11, height/3); // when hit is changes it to a different face
    hittimer++; //adds to hittimer
    if (hittimer >100) {
      Hit2 = false; //stops the hit2 from being true
      hittimer = 0; // hittimer is now zero again
    }
  }
  void countSpeed() { //counts the speed of the girl
    if (keyLeft && xPosWhiteGirl>190) xSpeed-= 0.5;
    if (keyRight && xPosWhiteGirl<330) xSpeed+= 0.5;
    if (keyUp && yPosWhiteGirl>140) ySpeed-= 0.5;
    if (keyDown && yPosWhiteGirl<400) ySpeed+= 0.5;
    xSpeed *= 0.9; //Apply some drag so that the girl wouldn't fly off to fast
    ySpeed *= 0.9;
  }
  void changePosition() {//changes the position of the girl
    xPosWhiteGirl+=xSpeed;
    yPosWhiteGirl+=ySpeed;
  }
}
