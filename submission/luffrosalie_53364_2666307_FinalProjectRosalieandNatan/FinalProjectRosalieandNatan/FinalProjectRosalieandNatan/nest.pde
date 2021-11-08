/*
Nest appears in top left corner.
coordinates of nest used for the birb.flee

Code written by Rosalie Luff
*/

class Nest {
  float nestX;
  float nestY;
  PImage nest;

  Nest(float initNestX, float initNestY) {
    nestX = initNestX;
    nestY = initNestY;
    nest = loadImage("nest.png");
  }

  void display() {
    image(nest, nestX, nestY, 370*2/3, 181*2/3);                    //Scaled to appropriate size
  }
}
