class Mannequin {
  //all the mannequins we have
  PImage maleModel;
  float mannequinX;
  float mannequinY;


  Mannequin(PImage manneq, float tempX, float tempY) {

    maleModel = manneq;
    mannequinX = tempX;
    mannequinY = tempY;
  }

  void display() {

    image(maleModel, mannequinX, mannequinY);   //maleModel 
  }
}
