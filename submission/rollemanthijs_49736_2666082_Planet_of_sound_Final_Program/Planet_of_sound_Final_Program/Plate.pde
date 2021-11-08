//rotating plate on the window with sound

class plate {
  float plateX;
  float plateY;
  PImage platePic;
  float angle = 0;

  boolean isPlaying = true;

  plate(float initX, float initY) {
    plateX = initX;
    plateY = initY;
  }

  void display() {
    imageMode(CENTER);
    pushMatrix();
    platePic = loadImage("LpPlaat4.png");
    translate(plateX, plateY);
    rotate(angle);
    angle +=0.2;
    image(platePic, 0, 0);
    popMatrix();
  }
}
