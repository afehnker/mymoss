class Suits {

  PImage suitImage1;
  PImage suitImage2;

  float suitX;
  float suitY;
  float checkX;
  float checkY;

  Suits(PImage suit1, PImage suit2, float tempX, float tempY) {
    suitImage1 = suit1;
    suitImage2 = suit2;
    suitX = tempX;
    suitY = tempY;
  }

  void display() {
    if (checkX >= suitX-suitImage1.width/2 && checkY >= suitY-suitImage1.height/2 && checkX <= suitX+suitImage1.width/2 && checkY <= suitY+suitImage1.height/2) {
      image(suitImage1, suitX + 5, suitY + 40);
    } else {
      image(suitImage2, suitX + 3, suitY + 40);
    }
  }

  void isOverSuit(float tempX, float tempY) {
    checkX = tempX;
    checkY = tempY;
  }
}
