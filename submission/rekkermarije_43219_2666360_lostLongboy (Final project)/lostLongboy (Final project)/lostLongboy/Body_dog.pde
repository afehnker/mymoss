/*
Makes a single ellipse that will become part of the arraylist.
 */

class Body_dog {
  float dogX;
  float dogY;
  float radius = 12;
  color dogColor = #AD7B10 ;

  Body_dog(float x, float y) {
    dogX = x;
    dogY = y;
  }

  //draw a new middle part of the dog when you move
  void dogBody() {
    noStroke();
    fill(dogColor);
    ellipse(dogX, dogY, 2 * radius, 2 * radius);
  }
}
