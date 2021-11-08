/*
 Displays finish and detects if you are there.
 */

class Finish {
  float finishX;
  float finishY;
  PImage finishLine;

  Finish() {
    finishX = width/2-25;
    finishY = height-20;
    finishLine = loadImage("finishLine.jpg");
  }

  //draw the finishline
  void display() {
    image(finishLine, finishX, finishY, 50, 20);
  }

  //detect if Longboy is in reach of the finishline, if so, phase becomes 2
  void finito(float dogXpos, float dogYpos) {
    if (dogXpos >=  finishX-30 && dogXpos <=  finishX + 30 && dogYpos >=  finishY-30 && dogYpos <=  finishY +30) {
      println("FINISH");
      phase = 2;
    }
  }
}
