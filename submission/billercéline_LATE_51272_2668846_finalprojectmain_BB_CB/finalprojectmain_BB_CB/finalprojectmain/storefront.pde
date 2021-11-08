class StoreFront {
  float storeFrontX = 0;
  float storeFrontY = 0;

  //constructor
  StoreFront(float initX, float initY) {
    storeFrontX = initX;
    storeFrontY = initY;
  }
  void display() {
    //wall in the back of the store
    noStroke();
    fill(242, 230, 177);
    rect(storeFrontX+400, storeFrontY+250, 500, 200);
    //other walls in the store
    stroke(242, 230, 177);
    line(storeFrontX+400, storeFrontY+250, storeFrontX+150, storeFrontY+100); //left line above
    line(storeFrontX+900, storeFrontY+250, storeFrontX+1150, storeFrontY+100); //right line above
    line(storeFrontX+400, storeFrontY+450, storeFrontX+150, storeFrontY+600); //left line bottom
    line(storeFrontX+900, storeFrontY+450, storeFrontX+1150, storeFrontY+600);
    //black walls
    fill(0);
    stroke(255);
    rect(storeFrontX, storeFrontY, 150, 600); //left wall
    rect(storeFrontX+1150, storeFrontY, 150, 600); //right wall
    rect(storeFrontX, storeFrontY, 1300, 100); //wall above
    noFill();
    stroke(255);
    strokeWeight(3);
    rect(storeFrontX+150, storeFrontY+100, 1000, 497); //white outlines of the windows
    stroke(255);
    strokeWeight(10);
    rect(storeFrontX+500, storeFrontY+100, 150, 600); //left door
    rect(storeFrontX+650, storeFrontY+100, 150, 600); //right door
    strokeWeight(3);
    fill(0);
    rect(storeFrontX+650, storeFrontY+350, 50, 50); //doorknob
  }
}
