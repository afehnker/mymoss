class House {
  float xPos;
  float yPos;


  House() {
    xPos = width/2-440;
    yPos = height/2+100;
    rectMode(CENTER);
    ellipseMode(CENTER);
  }

  void display() {
    //house
    noStroke();
    fill(0);
    rect(xPos, yPos+200, 400, 400);
    rect(xPos, yPos-75, 400, 150);

    rect(xPos-120, yPos-200, 80, 100);
    rect(xPos+120, yPos-200, 80, 100);
    rect(xPos, yPos-200, 100, 200);
    triangle(xPos-280, yPos, xPos-200, yPos-150, xPos-120, yPos);
    triangle(xPos+280, yPos, xPos+200, yPos-150, xPos+120, yPos);
    triangle(xPos-190, yPos-210, xPos-120, yPos-300, xPos-50, yPos-210);
    triangle(xPos+190, yPos-210, xPos+120, yPos-300, xPos+50, yPos-210);
    triangle(xPos-100, yPos-270, xPos, yPos-400, xPos+100, yPos-270);

    //windows 
    fill(230, 126, 0);
    arc(xPos, yPos+150, 100, 100, -PI, 0); 
    rect(xPos, yPos+250, 100, 200);

    arc(xPos-120, yPos-200, 30, 30, -PI, 0); 
    rect(xPos-120, yPos-175, 30, 55);

    arc(xPos+120, yPos-200, 30, 30, -PI, 0); 
    rect(xPos+120, yPos-175, 30, 55);

    arc(xPos, yPos-230, 50, 50, -PI, 0); 
    rect(xPos, yPos-190, 50, 80);
  }
}
