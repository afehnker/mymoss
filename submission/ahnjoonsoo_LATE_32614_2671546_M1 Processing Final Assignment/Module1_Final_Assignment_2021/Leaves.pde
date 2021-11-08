// this Leaves class for controlling and generate multiple leaves
class Leaves {
  PImage r;
  PImage y;
  int leafAmount = 15;
  Leaf [] leaf = new Leaf[leafAmount];

  Leaves() {
    r = loadImage("Red.png");
    y = loadImage("Yellow.png");
    for (int i = 0; i < leafAmount; i++) {
      if (i%2 == 0) {// this statement for generating two different leaves
        leaf[i] = new Leaf(r);//if it is even number it is red
      } else {
        leaf[i] = new Leaf(y);// otherwise it is yellow
      }
    }
  }

//below two functions make every leaves do functions from class Leaf
  void display() {
    for (int i = 0; i < leafAmount; i++) {
      leaf[i].display();  
      leaf[i].fall();
    }
  }

  void interaction(float initX, float initY) {// these two parameters for mouse positions.
    for (int i = 0; i < leafAmount; i++) {
      leaf[i].collisionCheck(initX, initY);
    }
  }
}
