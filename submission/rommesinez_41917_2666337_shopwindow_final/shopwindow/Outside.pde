class Outside { 

  int outsideX, outsideY; 

  Outside(int initX, int initY) {         
    outsideX = initX;
    outsideY = initY;
  }

  void display() {
 
    noStroke();
    fill(64, 64, 64);
    rect(0, 300, 50, 600);
    rect(300, 600, 600, 50);
    
  }
}
