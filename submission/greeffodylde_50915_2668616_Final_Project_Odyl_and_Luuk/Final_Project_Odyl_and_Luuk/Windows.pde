class Window {

  float windowX, windowY;
  color windowColor;


  Window(float initX, float initY) {
    windowX = initX;
    windowY = initY; 
    windowColor = color(210, 248, 250, 80); //Window color is a transparent light blue
  }

  void display() { //Displaying of the windows
    fill(windowColor);
    stroke(150, 150, 150); //Silver stroke, being the metal frame around the window
    strokeWeight(10);
    rect(windowX, windowY, width/5, height/8);
  }
}
