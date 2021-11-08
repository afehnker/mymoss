class Table { 

  int tableX, tableY; 
  PImage img;

  Table(int initX, int initY) {         
    tableX = initX;
    tableY = initY;
  }

  void display() {

    //table
    fill(0, 102, 204);                                 //blue
    noStroke();
    rect(300, 450, 400, 50, 30, 30, 0, 0);
    quad(100, 475, 175, 475, 175, 600, 125, 600);      //right

    quad(425, 475, 500, 475, 475, 600, 425, 600);      //left
  }
}
