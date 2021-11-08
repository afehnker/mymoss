class Lights {
  int power = 1;
  int light;

  void onoff() {
    if (key == DELETE) {
      power = power*-1;
    }
  }

  void display() {
    println(power);

    if (power == 1) {
      light = 0;
    } else if (power == -1) {
      light = 122;
    }

    tint(255, light);
    image(dark, 0, 0);
    tint(255,255);
  }
}
