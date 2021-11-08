/*
  Circle Class
  Draws a coloured circle with a colour hue and stars.
  Author: Door
*/

class Circle {

  float beginCircle;
  float endCircle;

  float circleX;
  float circleY;
  float starSize;

  float circleR;
  float circleG;
  float circleB;

  int starTimer;

  Circle(float xPos, float yPos, float initSize) {
    
    beginCircle = 0.001;
    endCircle = 0.002;
    
    circleX = xPos;
    circleY = yPos;
    starSize = initSize;

    circleR = 255; 
    circleG = 0;
    circleB = 0;
  }

  void display() {
    pushMatrix();
    translate(circleX, circleY);
    //black backgroung circle
    fill(0);
    circle(0,0,180);
    
    //gradient arc
    strokeWeight(10);
    noFill();
    for (float i=0; i<300; i++) {
      stroke(circleR, circleG+i, circleB);
      arc(0, 0, 185, 185, (beginCircle)+i/100, (endCircle)+i/100); //maing the colour arc with lots of small arcs with slightly differnt colors
    }

    noStroke();
    for (int j=0; j<6; j++) {
      for (int i=0; i<45; i++) { //making the little stars behind the big star
        fill(255);
        rotate(0.1+j);
        circle(40+j*5, 50+i/4, starSize+j/2);
      }
    }
    beginCircle=beginCircle+0.005;//moving the gradient circle
    endCircle=endCircle+0.005;
    popMatrix();
  }


  void update() {
    starSize = random(1, 3);
  }

  void changeColour() {

    circleR = random(0, 255);
    circleG = random(0, 255);
    circleB = random(0, 255);
  }

  void resetColour() {

    circleR = 255;
    circleG = 0;
    circleB = 0;
  }
}
