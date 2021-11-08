class bird {
  float birdX;
  float birdY;
  int direction;
  int flap=1;
  boolean wink;

  //Initialize the bird at the correct location, the diraction so it turns around and the boolean wink
  bird(int dx, int dy, int dd, boolean dw) {
    birdX = dx;
    birdY = dy;
    direction = dd;
    wink = dw;
  }

  void display() {
    rectMode(CENTER);
    
    //draw the tail
    fill(206, 66, 245);
    quad(birdX + direction * width/45, birdY - height/200, birdX + direction * width/43, birdY + height/180, birdX + direction * width/16, birdY - height/100, birdX + direction * width/14, birdY - height/23);

    //draw the body and head
    fill(3, 207, 252);
    ellipse(birdX, birdY, width/15, height/25); //body
    ellipse(birdX - direction * width/40, birdY - height/50, width/25, height/30); //head

    //draw the wink and eye
    fill(0);
    if (wink == false) {
      ellipse(birdX - direction * width/30, birdY - height/41, width/200, height/220); //eye
    } else {
      rect(birdX - direction * width/30, birdY - height/41, width/150, height/800);
    }

    //draw the beak
    fill(252, 157, 3);
    triangle(birdX - direction * width/23, birdY - height/39, birdX - direction * width/23, birdY - height/45, birdX - direction * width/17, birdY - height/43);

    //draw the wings and the movement of the wings
    fill(206, 66, 245);
    //movement of wings according to the amount of flaps
    if (flap%10<5) {
      triangle(birdX - direction * width/300, birdY - height/70, birdX + direction * width/50, birdY - height/100, birdX + direction * width/60, birdY - height/18);
    } else {
      triangle(birdX - direction * width/300, birdY - height/70, birdX + direction * width/50, birdY - height/100, birdX + direction * width/480, birdY + height/35);
    }
    //flap + count
    flap += 1;
  }

  void move(int dxx, int dyy) {
    //turning around of the bird and position of the bird
    if (birdX < dxx) {
      direction = -1;
    } else {
      direction = 1;
    }
    birdX = dxx;
    birdY = dyy;
  }
  
  //wink boolean change
  void wink() {
    wink = true;
  }
  void noWink() {
    wink = false;
  }
}
