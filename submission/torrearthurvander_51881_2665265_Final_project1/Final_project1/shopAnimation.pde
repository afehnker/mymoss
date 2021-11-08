class Animation {
  int xPos;
  int yPos;
  float opacity;
  float add=5.0;
  float rotate;
  int distance=80;
  Animation(int x, int y) {
    xPos=x;
    yPos=y;
  }

  void play() {
    if (StoryProgress == "shop") { //light-up effect for shop
      fill(230, opacity);
      rect(xPos, yPos, 1200, 600);
      opacity+=add;
      if (opacity>255 || opacity<0) {
        add*=-1;
      }
      if (opacity<30 && add<0) {
        add=-0.1;
      } else if (opacity<30 && add>0) {
        add=0.1;
      } else if (opacity>=30 && add>0) {
        add=5.0;
      } else if (opacity>=30 && add<0) {
        add=-5.0;
      }
    }
  }
}
