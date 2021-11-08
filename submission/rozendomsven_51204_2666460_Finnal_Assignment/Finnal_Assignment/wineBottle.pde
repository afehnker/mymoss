//this class makes the wine bottle obstacles.

class wineBottle {
  int posX;
  int posY;
  int rotation;

  wineBottle(int initX, int initY, int initR) {
    posX = initX;
    posY = initY;
    rotation = initR;
  }
  void display() { //shows an intack wine bottle
    pushMatrix();
    translate(posX, posY);
    rotate(radians(rotation));
    noStroke();
    fill(150, 150, 75);
    rect(0, 0, 100, 50);
    triangle(50, 25, 50, -25, 60, 0);
    rect(70, 0, 25, 10);
    fill(0);
    stroke(0);
    popMatrix();
  }
  void broken(){ // shows some shards
    pushMatrix();
    translate(this.posX, this.posY);
    rotate(radians(rotation));
    fill(150, 150, 75);
    triangle(10,10,20,10,30,30);
    triangle(-10,-10,-20,-10,-30,-30);
    triangle(20,-10,-20, 10,-30,0);
    popMatrix();
}
}
