class birdHouse {
  float birdHouseX;
  float birdHouseY;
  float scale;

  //Initialize the bird house at the required coordinates with the required scale
  birdHouse(float x, float y, float s) {
    birdHouseX = x;
    birdHouseY = y;
    scale = s;
  }

  void display() {
    // Draw the birdhouse at the coordiantes, with the required scale
    rectMode(CENTER);
    // pushMartix is needed to start the object, so the scale will only be used for this object
    pushMatrix();
    // Set the required scale
    scale(scale);
    // Draw the birdhouse
    fill(160, 82, 45);
    fill(242, 231, 179);
    rect(birdHouseX + width/2, birdHouseY + height/2, width/9, height/9);
    rect(birdHouseX + width/2, birdHouseY + height/1.77, width/7, height/50);

    fill(187, 189, 191);
    triangle(birdHouseX + width*0.42, birdHouseY + height/2.2, birdHouseX + width*0.58, birdHouseY + height/2.2, birdHouseX + width/2, birdHouseY + height/2.8);

    fill(0);
    ellipse(birdHouseX + width/2, birdHouseY + height/2, width/40, height/40);
    // Pop the Matrix, so next objects will not use the scaling factor
    popMatrix();
  }
}
