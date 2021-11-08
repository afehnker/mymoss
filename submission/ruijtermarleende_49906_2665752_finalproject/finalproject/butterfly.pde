class Butterfly {
  PImage butterflyImage;

  float xPosButterfly, yPosButterfly;    // Starting position of shape    

  float xspeed = 2.8;  // Speed of the shape
  float yspeed = 2.2;  // Speed of the shape

  int xdirection = 1;  // Left or Right
  int ydirection = 1;  // Top to Bottom

  float boxWidth;
  float boxHeight;
  float xPosBox; 
  float yPosBox;

  Butterfly(PImage initImage, int initX, int initY) {        // Set the starting position of the shape and ask for image
    butterflyImage = initImage;
    boxWidth = random(200, 500);
    boxHeight = boxWidth;

    xPosButterfly = initX;      //Connect the values given to xPosButterfly
    yPosButterfly = initY;      //Connect the values given to yPosButterfly
    xPosBox = xPosButterfly;
    yPosBox = yPosButterfly;
  }

  void display() {
    image(butterflyImage, xPosButterfly, yPosButterfly);
  }

  void bounce() {//int j
    xPosButterfly = xPosButterfly + ( xspeed * xdirection );
    yPosButterfly = yPosButterfly + ( yspeed * ydirection );  

    if (xPosButterfly > xPosBox+(boxWidth/2) || xPosButterfly < xPosBox - boxWidth/2) {    // Test to see if the shape exceeds the boundaries of the screen
      xdirection *= -1;    // If it does, reverse the xdirection by multiplying by -1
    }
    if (yPosButterfly > yPosBox+boxHeight/2 || yPosButterfly < yPosBox-boxHeight/2) {    // Test to see if the shape exceeds the boundaries of the screen
      ydirection *= -1;      // If it does, reverse the ydirection by multiplying by -1
    }
  }
}
