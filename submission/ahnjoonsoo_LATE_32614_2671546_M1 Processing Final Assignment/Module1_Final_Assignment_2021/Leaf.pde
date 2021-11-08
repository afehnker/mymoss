//this Leaf class has general features for every leaf
class Leaf {
  float x;
  float y;
  int leafSize = 80;
  PImage l;
  boolean isClicked = false;// to make leaf disappear when it is clicked

  Leaf(PImage init) {

    l = init;
    x = random(width/3, width);//give them random position when it generates
    y = random(-600, -40);
  }

  void fall() {
    x = x + random(-2, 2);//this makes leaves fall like a real leaf(tried another way but this is
    y = y + random(0.1, 3);//most natural one)
    if (y > height+leafSize) {
      y = -40;
      isClicked = false;
    }
  }

  void display() {
    if (!isClicked) { 
      imageMode(CENTER);
      image(l, x, y, leafSize, leafSize);
    }
  }

  void collisionCheck(float mX, float mY) {// this if-staementis for checking the mouse position is on(in) the leaf or not
    if (mX > x -leafSize/2 && mX < x + leafSize/2 && mY < y + leafSize/2 && mY > y -leafSize/2) {
      isClicked = true;
    }
  }
}
