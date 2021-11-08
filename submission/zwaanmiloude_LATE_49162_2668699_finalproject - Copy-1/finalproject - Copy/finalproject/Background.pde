class Background {
  //arguments
  PImage floor;

  //constructor
  Background() {
    floor = loadImage("floor.jpg");
  }

  //display methods
  //this method dipslays floor
  void displayfloor() {
    image(floor, 0, 400, 1600, 500);
  }
  //this method displays the wall
  void displaywall() {
    fill(245, 189, 34);
    fill(#D38C1A);
    rect(0, 0, 1600, 400);
  }
}
