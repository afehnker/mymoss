//this is the alpaca class: this manages the display of the alpacas (should the animation be playing, which way is the alpaca supposed to face) and finaly applies the code from the movement class to the display. It also check's if an alpaca is selected. 

class alpaca {
  boolean active; //states if the alpaca is selected (and therefor is allowed to move when buttons are pressed)
  boolean frame1; //states the current frame of animation for the alpacas (I used a boolean because there are only 2 frames :))
  boolean direction; // stats if the alpaca should be facing left or right
  boolean walking; // states if the alpaca is walking (needs to be active), which is used in deciding if the walking animation should be played
  boolean inBox; // states if an alpaca is in a box, because then they can't move (only turn around)
  int frame1Counter; //is used in delaying time between frame 1 and frame 2
  PVector pos;// the position of the alpacas
  PImage one; // the first animation frame 
  PImage two; // the second animation frame

  alpaca(float initX, float initY, String first, String second, boolean Left, boolean InBox) {
    active = false;
    walking = false;
    frame1 = true;
    inBox = InBox;
    direction = Left;
    frame1Counter = 0;
    pos = new PVector(initX, initY);
    one = loadImage(first);
    two = loadImage(second);
  }

// manages the display of the alpacas (facing left/right, are they walking if so should the frame switch)
  void display() {
    imageMode(CENTER);
    if (frame1) {
      if (!direction) {
        pushMatrix();
        scale(-1, 1);
        image(one, -pos.x, pos.y, width/7, height/7);
        popMatrix();
      } else {
        image(one, pos.x, pos.y, width/7, height/7);
      }
      if (walking) {
        frame1Counter = frame1Counter + 1;
      }
      if (frame1Counter == 10) {
        frame1 = false;
      }
    } else {
      if (!direction) {
        pushMatrix();
        scale(-1, 1);
        image(two, -pos.x, pos.y, width/7, height/7);
        popMatrix();
      } else {
        image(two, pos.x, pos.y, width/7, height/7);
      }
      if (walking) {
        frame1Counter = frame1Counter -1;
      }
      if (frame1Counter == 0) {
        frame1 = true;
      }
    }
    walking = false;
    if (pos.y == height-260 && inBox) {
      background.midground();
    }
  }

// the movement.move function is actually used in changing the pos vector. the if statements are used in dictating if an alpaca is walking and what direction they are facing
  void update() {
    movement.move(active, inBox, pos);
    if (active && (keys[0] || keys[1])) {
      walking = true;
    }
    if (keys[0] && active) {
      direction = true;
    }
    if (keys[1] && active) {
      direction = false;
    }
    pos.add(movement.move);
    (movement.move).mult(0);
  }


// checks the position of the passed mouse coordinates with the pos vectors of all the alpacas and decides if they should be activated
  void activate(float mX, float mY) {
    active = false;
    PVector mousePos = new PVector(mX, mY);
    if (pos.dist(mousePos) < 80) {
      active = true;
    }
  }
}
