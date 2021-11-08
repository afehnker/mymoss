class Closer {
  float Ximg = 0;
  float Yimg = -1080;
  void display() {
    image(img2, Ximg, Yimg, width, height);
  }

  void down() {
    if (key == BACKSPACE) {
      Yimg = Yimg + 3;
      if (Yimg >= 0) {
        Yimg = 0;
      }
    }
  }
  void up() {
    if (key == ENTER) {
      Yimg = Yimg - 3;
      if (Yimg <= -1080) {
        Yimg = -1080;
      }
    }
  }
}
