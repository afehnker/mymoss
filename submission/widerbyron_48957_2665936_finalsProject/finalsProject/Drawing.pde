/*
  Drawing Class
 Lets the user draw on the screen until they press the mouse, which automatically deletes everything.
 Source: This code is based on an example in the book learning processing by Daniel Schiffman on page 141 example 9.8
 Author: Door
 */


class Drawing {
  int[] xpos = new int[10000]; //creating an enourmous array to draw that many circles. It's such a big number so you never get there.
  int[] ypos = new int[10000];
  boolean pressed = false;  //boolean so a reset function is possible

  Drawing(boolean initPressed) {   
    pressed=initPressed;
    // Initialize all elements of each array to -10 outside the canvas.
    for (int i = 0; i < xpos.length; i ++ ) {
      xpos[i] = -10; 
      ypos[i] = -10;
    }
  }

  void display() {
    if (pressed) {
      // Shift array values
      for (int i = 0; i < xpos.length-1; i ++ ) {
        // Shift all elements down one spot. 
        // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. 
        // Stop at the second to last element.
        xpos[i] = xpos[i+1];
        ypos[i] = ypos[i+1];
      }

      // New location
      // Update the last spot in the array with the mouse location.
      xpos[xpos.length-1] = mouseX; 
      ypos[ypos.length-1] = mouseY;

      // Draw everything
      for (int i = 0; i < xpos.length; i ++ ) {
        // Draw an ellipse for each element in the arrays. 
        noStroke();
        fill(#fca103);
        ellipse(xpos[i], ypos[i], 10, 10);
      }
    }
  }

  void activated() {
    if (!pressed) { 
      pressed=true;
    } else pressed=false; //resets the ellipses so you don't continue drawing without noticing it
    for (int i = 0; i < xpos.length; i ++ ) {
      xpos[i] = -10; 
      ypos[i] = -10;
    }
  }
}
