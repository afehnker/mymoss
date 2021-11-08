class Lamp {

  int xLamp;
  int yLamp;                                                //global variables for class Lamp
  float lampSwing;
  Lamp(int initX, int initY) {
    xLamp=initX;
    yLamp=initY;                                            //Lamp constructor sets passed on values to the x and y positions of the Lamps
  }

  void display() {



    pushMatrix();
    translate(xLamp, yLamp);
    rotate(HALF_PI);
    rotate(lampSwing);
    stroke(5);                                            //draws the lamps
    strokeWeight(4);

    line(0, 0, 200, 0);
    strokeWeight(1);

    if (falling == true) {
      noStroke();
      fill(237, 195, 40, 60);                      //displays the glowing effect around the lamps
      ellipse(205, 0, 55, 55);
      fill(237, 195, 40, 30);
      ellipse(205, 0, 80, 80);
      fill(237, 195, 40, 10);
      ellipse(205, 0, 100, 100);
    }

    if (falling == false) {
      noStroke();                                    //no more glowing:(
      fill(255, 255, 255, 90);
      ellipse(205, 0, 50, 50);
    }


    stroke(5);
    strokeWeight(1);
    fill(235, 202, 16);
    ellipse(205, 0, 30, 30);
    fill(59, 61, 64);
    rect(170, -4, 20, 10);
    popMatrix();

    rectMode(CORNER);
  }
}
