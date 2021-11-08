class Skeleton {
  float xPos;
  float yPos;
  float radian;
  float eyeColor;

  Skeleton() {
    xPos = width/2-565;
    yPos = height/2+320;
    radian = 100;
    eyeColor = color(0);
  }



  void changeEyes(float initX, float initY) {
    //makes eyes change color if the mouse is over the skeleton head
    if (dist(initX, initY, xPos, yPos)< radian) {
      fill(255, 0, 0);
    } else {
      fill(0);
    }
    //eyes
    ellipse(xPos-20, yPos, 20, 20);
    ellipse(xPos+20, yPos, 20, 20);
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(xPos, yPos, radian, radian); //head
    ellipse(xPos-40, yPos+15, 30, 30);
    ellipse(xPos+40, yPos+15, 30, 30);
    ellipse(xPos, yPos+40, 80, 70); //jaw


    fill(0);
    triangle(xPos-10, yPos+20, xPos+10, yPos+20, xPos, yPos); //nose
  }
}
