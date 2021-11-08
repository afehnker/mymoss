/*
The purpose of this class is displaying the differnt states of the butterflies
 and letting them fly in a random path, while keeping them inside the poster.
 */


class Butterfly {

  //Positions and speed
  float xPosButterfly;
  float yPosButterfly;
  float xCenter;
  float yCenter;
  float xSpeed = random(-0.1, 0.1);
  float ySpeed = random(-0.1, 0.1);

  //Mouse position
  float xCursor;
  float yCursor;

  //Boolean for mouse on poster
  boolean hoverOnPoster = false;

  //Booleans for each type of butterfly
  boolean downLeft = false;
  boolean downRight = false;
  boolean upLeft = false;
  boolean upRight = false;


  Butterfly(float x, float y, float x2, float y2) {
    xPosButterfly = x;
    yPosButterfly = y;
    xCenter = x2;
    yCenter = y2;
  }


  void display() {

    //Display butterflies when static
    if (hoverOnPoster == false) {
      pushMatrix();
      translate(xPosButterfly, yPosButterfly);
      rotate(radians(30));
      noStroke();
      //Wing_1
      fill(235, 73, 52);
      ellipse(-20, 0, 40, 30);
      ellipse(20, 6, 30, 20);

      fill(0, 0, 0);
      ellipse(-20, 0, 20, 15);
      ellipse(20, 6, 15, 10);
      popMatrix();

      //Wing_2
      pushMatrix();
      translate(xPosButterfly, yPosButterfly);
      rotate(radians(-30));
      fill(235, 73, 52);
      ellipse(20, 0, 40, 30);
      ellipse(-20, 6, 30, 20);

      fill(0, 0, 0);
      ellipse(20, 0, 20, 15);
      ellipse(-20, 6, 15, 10);
      popMatrix();
      ellipse(xPosButterfly, yPosButterfly, 12, 45);
      stroke(1);
    }

    //Display butterflies each fly direction
    else {      
      if (downLeft == true) {
        pushMatrix();
        translate(xPosButterfly, yPosButterfly);
        rotate(radians(225));

        //Wing_1
        pushMatrix();
        translate(0, 0);
        rotate(radians(30));
        noStroke();
        fill(235, 73, 52);
        ellipse(-20, 0, 40, 30);
        ellipse(20, 6, 30, 20);

        fill(0, 0, 0);
        ellipse(-20, 0, 20, 15);
        ellipse(20, 6, 15, 10);
        popMatrix();

        //Wing_2
        pushMatrix();
        translate(0, 0);
        rotate(radians(-30));
        fill(235, 73, 52);
        ellipse(20, 0, 40, 30);
        ellipse(-20, 6, 30, 20);

        fill(0, 0, 0);
        ellipse(20, 0, 20, 15);
        ellipse(-20, 6, 15, 10);
        popMatrix();
        ellipse(0, 0, 12, 45);
        popMatrix();
        stroke(1);
      } else if (upLeft == true) {
        pushMatrix();
        translate(xPosButterfly, yPosButterfly);
        rotate(radians(315));

        //Wing_1
        pushMatrix();
        translate(0, 0);
        rotate(radians(30));
        noStroke();
        fill(235, 73, 52);
        ellipse(-20, 0, 40, 30);
        ellipse(20, 6, 30, 20);

        fill(0, 0, 0);
        ellipse(-20, 0, 20, 15);
        ellipse(20, 6, 15, 10);
        popMatrix();

        //Wing_2
        pushMatrix();
        translate(0, 0);
        rotate(radians(-30));
        fill(235, 73, 52);
        ellipse(20, 0, 40, 30);
        ellipse(-20, 6, 30, 20);

        fill(0, 0, 0);
        ellipse(20, 0, 20, 15);
        ellipse(-20, 6, 15, 10);
        popMatrix();
        ellipse(0, 0, 12, 45);
        popMatrix();
        stroke(1);
      } else if (downRight == true) {
        pushMatrix();
        translate(xPosButterfly, yPosButterfly);
        rotate(radians(135));

        //Wing_1
        pushMatrix();
        translate(0, 0);
        rotate(radians(30));
        noStroke();
        fill(235, 73, 52);
        ellipse(-20, 0, 40, 30);
        ellipse(20, 6, 30, 20);

        fill(0, 0, 0);
        ellipse(-20, 0, 20, 15);
        ellipse(20, 6, 15, 10);
        popMatrix();

        //Wing_2
        pushMatrix();
        translate(0, 0);
        rotate(radians(-30));
        fill(235, 73, 52);
        ellipse(20, 0, 40, 30);
        ellipse(-20, 6, 30, 20);

        fill(0, 0, 0);
        ellipse(20, 0, 20, 15);
        ellipse(-20, 6, 15, 10);
        popMatrix();
        ellipse(0, 0, 12, 45);
        popMatrix();
        stroke(1);
      } else if (upRight == true) {
        pushMatrix();
        translate(xPosButterfly, yPosButterfly);
        rotate(radians(45));
        //wing
        pushMatrix();
        translate(0, 0);
        rotate(radians(30));
        noStroke();
        fill(235, 73, 52);
        ellipse(-20, 0, 40, 30);
        ellipse(20, 6, 30, 20);
        //decorations
        fill(0, 0, 0);
        ellipse(-20, 0, 20, 15);
        ellipse(20, 6, 15, 10);
        popMatrix();
        //wing
        pushMatrix();
        translate(0, 0);
        rotate(radians(-30));
        fill(235, 73, 52);
        ellipse(20, 0, 40, 30);
        ellipse(-20, 6, 30, 20);
        //decorations
        fill(0, 0, 0);
        ellipse(20, 0, 20, 15);
        ellipse(-20, 6, 15, 10);
        popMatrix();
        ellipse(0, 0, 12, 45);
        popMatrix();
        stroke(1);
      }
    }
  }

  void fly() {
    //When hovering over poster
    if (hoverOnPoster == true) {
      //When butterflies inside poster, give random speed, but dont exceed certain limit
      if (xPosButterfly + 40 < xCenter + 150 && xPosButterfly - 40 > xCenter - 150) {
        xSpeed = constrain(xSpeed + random(-0.1, 0.1), -1.5, 1.5);
        ySpeed = constrain(ySpeed + random(-0.1, 0.1), -1.5, 1.5);
      }
      //Add speed to  position
      xPosButterfly += xSpeed;
      yPosButterfly += ySpeed;

      //Contain butterflies within poster border
      if (xPosButterfly + 40 > xCenter + 150 && xSpeed > 0) {
        xSpeed = -xSpeed;
      } else if (xPosButterfly - 40 < xCenter - 150 && xSpeed < 0) {
        xSpeed = -xSpeed;
      } else if (yPosButterfly + 40 > yCenter + 150 && ySpeed > 0) {
        ySpeed = -ySpeed;
      } else if (yPosButterfly - 40 < yCenter - 150 && ySpeed < 0) {
        ySpeed = -ySpeed;
      }
    }
    //Decide which variant of butterfly to display,
    //when certain direction is obtained.
    if (xSpeed < 0.05 && ySpeed > 0.05) {
      downLeft = true;
      upLeft = false;
      downRight = false;
      upRight = false;
    } else if (xSpeed < 0.05 && ySpeed < 0.05) {
      upLeft = true;
      downLeft = false;
      downRight = false;
      upRight = false;
    } else if (xSpeed > 0.05 && ySpeed > 0.05) {
      downRight = true;
      upLeft = false;
      downLeft = false;
      upRight = false;
    } else if (xSpeed > 0.05 && ySpeed < 0.05) {
      upRight = true;
      upLeft = false;
      downRight = false;
      downLeft = false;
    }
  }

  //Check for mouse position on poster
  void hover(float x, float y) {
    xCursor = x;
    yCursor = y;
    if (dist(xCenter, yCenter, xCursor, yCursor)<150) {
      hoverOnPoster = true;
    } else {
      hoverOnPoster = false;
    }
  }
}
