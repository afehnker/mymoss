//This class makes the wrenches that will repair your car

class wrench {

  int posX;
  int posY;

  wrench(int initX, int initY) {
    posX = initX;
    posY = initY;
  }

  void display() { //shows a wrench

    pushMatrix();
    translate(posX, posY);
    fill(128, 128, 128);
    quad (50, -20, -50, 20, -45, +32.5, 55, -7.5);
    circle (52.5, -13.75, 25);
    fill(80);
    circle (52.5, -13.75, 15);
    fill(128);
    circle (-47.5, 26.25, 25);
    stroke(80);
    fill(80);
    quad (-50, 20, -45, 32.5, -60, 38.5, -65, 26);
    popMatrix();
  }
}
