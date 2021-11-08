//this class is used for the movement of the alpacas (both the actual displacement and making sure they dont leave the screen)

class movement {
  boolean jump; // states if the alpaca is jumping
  boolean falling; // staes if the alpaca is falling
  boolean box; // staes if an alpaca is in a box
  int airTime = 0; // is used for jumping a max height
  PVector move = new PVector(0, 0); //stacks all the move 'orders' and in teh alpaca class applies them
  PVector pos; // is used for the position


//manages basicmovement (left and right)
  void move(boolean active, boolean Box, PVector position) {
    box = Box;
    pos = position;
    if (active && !box) {
      if (keys[0]) {
        move.add(-5, 0);
      }
      if (keys[1]) {
        move.add(5, 0);
      }
      if (keys[2] || pos.y < height-150) {
        jump = true;
      }
      if (jump) {
        movement.jump();
      }
      movement.outOfBounds();
    }
  }

//manages the jumping (and falling)
  void jump() {
    if (airTime > 0 && (!keys[2] || airTime > 20)) {
      falling = true;
    } else if ((pos.y == height-150 && pos. x < width-100) || (pos.y == height - 280 && pos.x > width-100)) {
      airTime = 0;
      falling = false;
    }
    
    if (keys[2] && !falling){
      move.add(0,-10);
      airTime = airTime +1;
    }
    
    if (pos.x < width-100 && !box) {
      if (pos.y < height-150 && falling) {
        move.add(0, 10);
        airTime = airTime -1;
      }
    } else if (pos.x > width -100 && !box) {
      if (pos.y < height - 280 && falling) {
        move.add(0, 10);
        airTime = airTime -1;
      }
    }
  }

// manages the bounds of the shopping window
  void outOfBounds() {
    if (pos.x < 50){
     move.add((50-pos.x),0);
    }
    if (pos.x > width-50){
     move.add((width-50-pos.x),0); 
    }
    if (pos.y > height-280 && pos.x > width-140){
     move.add((width-140-pos.x),0);
    }
    if(pos.y == height-280 && pos.x < width-75 && pos.x > width-90){
     move.add((width-75-pos.x),0);
    }
  }
}
