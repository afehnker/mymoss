class shopwindow {

  /*
  All the sub classes come together here.
   */
  PImage floral;
  Background background1;
  gradientShapes gradientShape1;
  Lights lights1;

  shopwindow() {
    gradientShape1 = new gradientShapes(width/2, height/2);
    background1 = new Background(floral);
    lights1 = new Lights();
  }


  void display() {
    background(163, 195, 247);
    background1.display();
    lights1.display();
    gradientShape1.display();
  }

  void moveGradientRight() {
    gradientShape1.moveGradientRight();
  }

  void lightsOnOff() {
    lights1.turnOnOff();
  }
}
