class Lamp {
  int lampPosX;
  color lampColor;

  Lamp(int initPosX) {
    lampPosX = initPosX;
    lampColor =#FCDB19;
  }

  void display() {
    fill(lampColor);
    ellipse(lampPosX, 15, 20, 20);
    //fill(#FCDB19, 50);
    fill(lampColor, 75);
    ellipse(lampPosX, 15, 40, 40);
  }

  void move(int border) {
    if (lampPosX >= border) {
      lampPosX = 0;
    } 

    if (machine1.spinning||machine2.spinning) {
      lampPosX +=27;
    }
  }
}
