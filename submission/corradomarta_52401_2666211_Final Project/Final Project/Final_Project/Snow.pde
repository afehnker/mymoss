//Snow particles
class Snow {
  float radSnow;
  float xPosSnow;
  float yPosSnow;
  float xSpeedSnow;
  float ySpeedSnow;
  int posX;
  int posY; 
  int sizeX;
  int sizeY;

  Snow() {
    xPosSnow = random(1555, 1841);
    yPosSnow = 598;
    radSnow = 2.5;
    ySpeedSnow = random(1, 4);
  }

  void display(int posX, int posY, int sizeX, int sizeY) {
    xPosSnow = constrain(xPosSnow, posX - (sizeX)/2 + 15, posX + (sizeX)/2 - 15);

    // Change the snow particle position
    xPosSnow = xPosSnow + random(-2, 2);
    yPosSnow = yPosSnow + ySpeedSnow;

    //reset the position of the snow particles when they reach the boundry
    if (yPosSnow > posY + sizeY/2 - 20) {
      yPosSnow = 598;
    }

    //Drawing the snow particles
    strokeWeight(3);
    stroke(255);
    fill(255, 226, 182);
    circle(xPosSnow, yPosSnow, radSnow);
  }
}
