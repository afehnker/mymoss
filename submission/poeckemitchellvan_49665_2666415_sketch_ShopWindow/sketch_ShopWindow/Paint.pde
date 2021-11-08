/*
the class paint is for displaying the paint at given position by paintBoard.
the void display() is for displaying the paint on canvas with a given color by paintBoard.
*/
class Paint{
  //initialising variables and colors
  float paintXPos;
  float paintYPos;
  color paintColor;
  
  Paint(float overX, float overY, color overColor){
    //assigning values to variables and colors
    paintXPos = overX;
    paintYPos = overY;
    paintColor = color(overColor);
  }
  
  void display(){
    fill(paintColor);
    noStroke();
    ellipse(paintXPos,paintYPos, 10,10);// display paint at a given point in given color
    stroke(1);
  }
}
