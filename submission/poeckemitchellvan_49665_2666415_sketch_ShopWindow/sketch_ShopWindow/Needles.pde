/*
this class is for displaying the needles, scarf and basket.
the scarf length will increase when the mouse is over the square. 
when the scarf has reached the basket it will drop in.
the void display() is for displaying the needles, the scarf and the basket
the void update() is for increasing the scarf length and dropping it in the basket when reached
it also reset the animation it can make more than 1 scarf.
*/
class Needles {
  //initialising variables and colors
  int needlesXPos;
  int needlesYPos;
  float scarfLength;  
  int moveNeedles;
  boolean reverseMovement;
  boolean cutScarf;
  float scarfYPos;
  color scarfColor;
  color basketAccentColor;
  color basketColor;
  
  Needles(int overX, int overY) {
    //assinging value to variables and colors
    needlesXPos = overX;
    needlesYPos = overY;
    scarfYPos = needlesYPos; //the scarf has a differentY position than the needles
    scarfLength = 1; //the length of the scarf
    cutScarf = false;
    moveNeedles = 0;
    reverseMovement = false;
    scarfColor = color( random(0,255),random(0,255),random(0,255));
    basketAccentColor = color(166, 133, 83);
    basketColor = color(255, 222, 150);
  }

  void display() {
    //displaying the needles
    fill(scarfColor);
    line(needlesXPos - moveNeedles, needlesYPos - 20 - moveNeedles, needlesXPos + 60 - moveNeedles, needlesYPos + 40 - moveNeedles);
    line(needlesXPos + 10 - moveNeedles, needlesYPos - 30 + moveNeedles, needlesXPos - 50 - moveNeedles, needlesYPos + 30 + moveNeedles);
    ellipse(needlesXPos + 60 - moveNeedles, needlesYPos + 40 - moveNeedles,5,5);
    ellipse(needlesXPos - 50 - moveNeedles, needlesYPos + 30 + moveNeedles,5,5);
 
    
    //displaying the scarf
    noStroke();  
    triangle(needlesXPos, needlesYPos - 20, needlesXPos - 20, needlesYPos, needlesXPos + 20, needlesYPos);  //the triangle doesn't move 
    rect(needlesXPos - 20,scarfYPos,40,scarfLength); // the scarf lenght and y position are variable so they can be changed
    stroke(1);
    
    //displaying the basket
    fill(basketColor);
    rect(needlesXPos - 40,needlesYPos + 115,80,35);
    fill(basketAccentColor);
    rect(needlesXPos - 45, needlesYPos + 110, 90,10);
  }

  void update() {
    if (mouseX >= needlesXPos - 100 && mouseX <= needlesXPos + 100 && mouseY >= needlesYPos - 50 && mouseY <= needlesYPos + 150){
      //move the needles up and down to simulate kniting
      if (!reverseMovement) {
        moveNeedles ++;
      }
      if (reverseMovement) {
        moveNeedles --;
      }
      if (moveNeedles >= 15) {
        reverseMovement = true;
      }
      if (moveNeedles <= -10) {
        reverseMovement = false;
      }
      
      //increase the scarf length untill basket is hit
      if (!cutScarf){
        scarfLength += 0.5;
      }
      
      //cut scarf is true when the basket is hit
      if (scarfLength >= 110){
        cutScarf = true;
      }
    }
    //drop the scarf if the basket is hit by decreasing the lenght and increasing the y position
    if (cutScarf){
      scarfYPos += 4;
      scarfLength -= 4;
    }
    
    //if the y position has caught up with the length  
    if (scarfYPos >= scarfYPos + scarfLength){
      scarfYPos = needlesYPos; //reset position to begin at the needles again
      scarfLength = 1; // make the length 1 so there isn't an unintended loop
      cutScarf = false; // make it so the scarf can increase in length again
      scarfColor = color( random(0,255),random(0,255),random(0,255)); // give new color to new scarf
    }
  }
}
