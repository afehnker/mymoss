class overlay {

  float xPos;
  float yPos;
  int imgWidth;
  int imgHeight;

  PImage overlay;


  overlay(float x, float y, int wide, int high) {
    xPos=x;
    yPos=y;
    imgWidth=wide;
    imgHeight=high;
    overlay = loadImage("transparantOverlay.jpg");
  }
  void display() {
    //loads a 1px by 1px image and halves the transparency to appear like glass
    tint(255, 127);
    overlay.resize(imgWidth, imgHeight);
    image(overlay, xPos, yPos);
    noTint();
  }
}
