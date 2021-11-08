class gradientShapes {

  /*
  Here we will draw the shapes with a gradient and the white border with the letters Dior
   
   */

  int x, y, xMid, yMid, axis, rectX, rectY, shape1X, shape2X, shape1Y, shape2Y;
  float w, h;
  color lower, higher, gradient;
  int blueColor;

  gradientShapes(int x, int y) {
    /*
    
     */
    
    shape1X = ((width/10 * 2) + 100);
    shape2X = x + 450;
    shape1Y = ((height/10 * 2) + 10);
    blueColor = 0;
    lower = #FFC800;
    higher = #FF6600;
    textSize(72);
    
    rectX = shape1X;
    rectY = shape1Y;
  }


  void display() {
    
    setGradient(rectX, rectY, ((width/10) * 1), ((height/10) * 7), lower, higher, 1) ;
    fill(#EAB45C);
    text("Dior", ((width/10 * 2) + 75), ((height/10 * 2) - 60));
    fill(#FF9E00);
    noStroke();
    circle(x + 450, y + 470, 290);
    
    noFill();
    stroke(#FFFEFC);
    rect(150, 50, 750, 980);
    strokeWeight(100);
  }

  void moveGradientRight() {
    x += 250;
    rectX = shape2X;
    if (x > 400) {
      x = 10;
      rectX = shape1X;
    }
  }

  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis) {
    /*

     */
    boolean Y_AXIS = false, X_AXIS = false;
    noFill();

    if (axis == 1) {
      Y_AXIS = true;
    } else if (axis == 2) {
      X_AXIS = true;
    }

    if (Y_AXIS) {
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    } else if (X_AXIS) {
      for (int i = x; i <= x+w; i++) {
        float inter = map(i, x, x+w, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(i, y, i, y+h);
      }
    }
  }
}
