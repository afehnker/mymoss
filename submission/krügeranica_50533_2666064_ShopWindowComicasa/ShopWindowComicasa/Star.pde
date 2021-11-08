/*
  This class is used to display a star. 
 The star is a circle in yellow.
 */
class Star {
  //position and size of the star
  float xPosStar;
  float yPosStar;
  float size;

  //constructor
  Star(float newX, float newY, float newSize) {
    xPosStar = newX;
    yPosStar = newY;
    size = newSize;
  }

  void display() {
    fill(255, 255, 0);
    circle(xPosStar, yPosStar, size);
  }
}
