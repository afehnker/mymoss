class Background {
  
  /*
This is where the background of the shop window is: floral background and the plant.
 */
  
  PImage floralBackground;
  float floralX;
  float floralY;


  Background(PImage floral) {
    floral = loadImage("shopwindow2.png");
    floralX = 0;
    floralY = 0;
    floralBackground = floral;
  }

  void display() {
    image(floralBackground, floralX, floralY);
  }
}
