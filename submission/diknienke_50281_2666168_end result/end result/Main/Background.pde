class Background {
  House house;
  Moon moon;
  Eyes[] eyes = new Eyes[10];

  Background() {
    house = new House();
    moon = new Moon();

    for (int i=0; i<eyes.length; i++) {
      eyes[i] = new Eyes(random(0, width), random(0, height));
    }
  }
  void display(float initX) {
    for (int i = 0; i < eyes.length; i++) {
      eyes[i].display();
      eyes[i].movePupil(initX);
      eyes[i].update();
    }
    moon.display();
    house.display();
  }
}
