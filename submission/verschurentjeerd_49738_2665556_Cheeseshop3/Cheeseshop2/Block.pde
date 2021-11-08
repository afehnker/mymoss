//There are objects that Tim can jump on, and objects he can not. I called the objects he can jump on "Blocks". 
//All the blocks are shown here.


class Block {
  float xBlock;
  float yBlock;
  float yThickness;
  float xThickness;

//First of all, we have the ground. always nice to have the mouse not fall through the floor...
  void ground() {
    xBlock = width/2;
    yBlock = 9*height/10;
    xThickness = width;
    yThickness = 10;
    rectMode(CENTER);
    fill(0, 0, 0, 1);
    stroke(0, 0, 0, 1);
    rect(xBlock, yBlock, xThickness, yThickness);
  }

//The cheese on the cheesestand in the middle. 
  void cheese1() {
    xBlock = width/2;
    yBlock = 8.23*height/10;
    xThickness = width/12;
    yThickness = xThickness/4;
    stroke(0);
    rectMode(CENTER);
    fill(#FFE940);
    rect(xBlock, yBlock, xThickness, yThickness, yThickness/2);
  }

//The first plank of the cheesestand.
  void cheeseStand1() {
    xBlock = width/2;
    yBlock = 719;
    xThickness = 216;
    yThickness = 162/10;

    fill(#BC9059);
    rect(xBlock, yBlock, xThickness, yThickness);
  }

//The second plank of the cheesestand. 
  void cheeseStand2() {
    xBlock = width/2;
    yBlock = 800 - 1.2*162;
    xThickness = 108;
    yThickness = 162/10;
    fill(#BC9059);
    rect(xBlock, yBlock, xThickness, yThickness);
  }

  void table1() {
    xBlock = width/4;
    yBlock = 3.1 * height/4 - 100;
    xThickness = 360;
    yThickness = 20;
    fill(#BC9059);
    rect(xBlock, yBlock, xThickness, yThickness);
  }

//the first plank of the cupboard. 
  void cupboardPlank1() {
    xBlock = 0.82*width;
    yBlock = 0.7*height;
    xThickness = 290;
    yThickness = 30;
    fill(#BC9059);
    rect(xBlock, yBlock, xThickness, yThickness);
  }
  
//The second plank of the cupboard. 
  void cupboardPlank2() {
    xBlock = 0.82*width;
    yBlock = 0.53*height;
    xThickness = 290;
    yThickness = 30;
    fill(#BC9059);
    rect(xBlock, yBlock, xThickness, yThickness);
  }
  
//The cheese in the cupboard.
  void cupboardCheese() {
    xBlock = 0.8*width;
    yBlock = 0.7*height - 40;
    xThickness = 150;
    yThickness = 50;
    fill(#FFE940);
    rect(xBlock, yBlock, xThickness, yThickness, yThickness/2);
  }
}
