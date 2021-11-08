/* creates the princess and her background in the window on the right */

class princess{
  int xPos;
  int yPos;
  int princessSize;
  int windowSize;
  float hairY;
  float hairSize;
  boolean princessVisible;
  //princess constructor
  princess(){
    xPos = window2.xPosWindow(); //gets right window position
    yPos = window2.yPosWindow();
    windowSize = 300;
    hairY = 0;
    hairSize = 120;
    princessVisible = false;
  }
  void display(){
    for (int i = 0; i <= 60; i = i + 1) { //creating the window background (might move to the class thats behind the window covers)
      pushStyle();
      noStroke();
      fill(4*i,0,i*2);
      rect(xPos+ i, yPos + i, windowSize - 2*i, windowSize - i);
      popStyle();
    }
    pushStyle();
    imageMode(CENTER);
    image(princessBody, xPos+150, yPos+164, princessSize, princessSize);
    if (princessVisible==true){ //displays the princess hair when the princess has her full size
      pushStyle();
      noStroke();
      fill(#d0ac1e);
      rect(xPos+165/2, yPos+225/2, 20, hairY);
      ellipseMode(CORNER);
      ellipse(xPos+225/2, yPos+150/2+hairY, -hairSize, hairSize);
      popStyle();
    }
    image(princessHead, xPos+150, yPos+164, princessSize, princessSize);
    if (princessVisible==true){ //displays a speechbubble when the princess has its full size
    //speechbubble
      fill(255);
      triangle(xPos+190, yPos, xPos+250, yPos+20, xPos +150, yPos + 90);
      ellipse(xPos+190, yPos, 200, 100);
      textSize(18);
      fill(5);
      text("Please save me!", xPos+120, yPos-10);
      text("HELP!", xPos+160, yPos+20);
    }
    popStyle();
  }
  void update(){
    if (princessSize <= windowSize){ //makes the princess grow until it reaches the window size
    princessSize = princessSize + 1;
    }
    if (princessSize >= windowSize && hairSize >= 60){ //makes the hair full down, once the princess reaches its full size
    hairY = hairY + 1;
    hairSize = hairSize - 0.1;
    princessVisible = true;
    } else if (princessSize == windowSize){ //makes the hair visile, once it reaches the ground
      hairY = 1400;
      hairSize = 60;
    }  
  }
}
