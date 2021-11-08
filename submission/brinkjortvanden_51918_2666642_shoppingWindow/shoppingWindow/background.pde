//this is the background class it is used for displaying the back-, mid- and for-ground.

class background {
  PImage backdrop = loadImage("IMG_20211013_175832.png");
  PImage crate = loadImage("crateWhole.png");
  PImage front = loadImage("cateFront.png"); // is used in the froground to partially cover the alpacas in boxes. 
  PImage fence = loadImage("fence.png");


// look it's the background
  void display() {
    rectMode(CENTER);
    imageMode(CORNERS);
    image(backdrop, 25, 0, width, height);
    noStroke();
    fill(100);    
    rect(12, height/2, 25, height);
    rect(width-12, height/2, 25, height);
    fill(200);
    rect(width-112, height-100, 25, 400);
    fill(220);
    quad(width-100, height-200, width, height-200, width-25, height-300, width-125, height-300);
    fill(0, 1, 71);
    rect(width/2, height-50, width, 100);
    fill(150);
    rect(width-50, height-100, 100, 200);
    fill(40, 60, 150);
    quad(25, height-200, 0, height-100, width-100, height-100, width-125, height-200);
    imageMode(CENTER);
    image(crate, width-200, height-200, width/4, height/4);
    image(crate, width-200, height-240, width/4, height/4);
    pushMatrix();
    scale(-1, 1);
    image(crate, -100, height-190, width/4, height/4);
    image(crate, -100, height-230, width/4, height/4);
    image(crate, -100, height-270, width/4, height/4);
    popMatrix();
  }
  
  // is used fro the leaves and the boxfronts
  void midground() {
    for (leaf leaves : leaves) {
      leaves.display();
    }
    image(front, width-200, height-240, width/4, height/4);
    pushMatrix();
    scale(-1, 1);
    image(front, -100, height-270, width/4, height/4);
    popMatrix();
  }

// is used for the final fence (right side of the screen)
  void forground() {
    image(fence, width-70, height-250, width/4, height/4);
  }
}
