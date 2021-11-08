class Smoke {
// Assigning Global variables 
  float x, y, dx, dy;

  Smoke(float initX, float initY) {

    x=initX;
    y=initY;
    dx = 0;
    dy = 0;
  }


  void display () {
    fill(#636159);
    ellipse(x, y, 15, 30);
  }

  // movement off the smoke
  void update() { 
    x += dx;
    y += dy;
    dx = random(-3, 3);
    dy = (-2);
    if ( y < 100) {
      y = 200;
      x = 1100;
    }
  }
}
