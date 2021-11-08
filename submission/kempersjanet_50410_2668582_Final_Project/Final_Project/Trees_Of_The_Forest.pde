class Trees

{
  //setting variables for the trees
  float treeX;
  float treeY;  
  float diameter;
  color treeColor;
  color leavesColor;

  Trees(float initX, float initY) {
    treeX = initX;
    treeY = initY;
    treeColor = color (136, 95, 69);
    leavesColor = color (11, 102, 35);
    diameter = 50;
    rectMode(CENTER);
  }

  void display() {
    noStroke();

    //tree 1 (left)
    fill(treeColor);
    rect(treeX + 200, treeY + 650, 150, 800);

    //leaves of tree 1
    fill(leavesColor);
    ellipse(treeX+200, treeY + 400, diameter*7, diameter*7); 

    //tree 2 (right)
    fill(treeColor);
    rect(treeX+1250, treeY + 600, 200, 750);

    //leaves of tree 2
    fill(leavesColor);
    ellipse(treeX+1250, treeY + 350, diameter * 9, diameter * 9);
  }
}
