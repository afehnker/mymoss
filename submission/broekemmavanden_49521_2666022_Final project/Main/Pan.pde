class Pan {
  float xPos;
  float yPos;


  Pan() {
    xPos = width/2+400;
    yPos = height/2+300;
    rectMode(CENTER);
    ellipseMode(CENTER);
  }

  void display() {
    //pan
    noStroke();
    fill(0);
    ellipse(xPos, yPos, 200, 200);
    rect(xPos, yPos-75, 200, 50, 50);
    ellipse(xPos+50, yPos+90, 20, 20);
    ellipse(xPos-50, yPos+90, 20, 20);

    //poison
    fill(color(40, 201, 0));
    ellipse(xPos, yPos-75, 175, 25);
  }
}
