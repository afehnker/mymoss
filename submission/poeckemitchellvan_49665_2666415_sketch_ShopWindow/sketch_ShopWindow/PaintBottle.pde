/*
this class if for displaying a bottle with a random color and giving this color to the paintboard.
the void display() displays the bottle at a given position by the paintboard in a random color.
the void pressedBottle() assigned the random color to the variable selectedColor from the class paintboard
*/
class PaintBottle{
  //initialising variables and colors
  int bottleXPos;
  int bottleYPos;
  color randomColor;
  color bottleAccentColor;
  
   PaintBottle(int overX, int overY){
     //assinging value to variables and colors
     bottleXPos = overX;
     bottleYPos = overY;
     randomColor = color(random(0,255),random(0,255),random(0,255));
     bottleAccentColor = color(255);
   }
   
   void display(){
      fill(randomColor);// give bottle a random color
      rect(bottleXPos + 10, bottleYPos, 20, 40);    
      fill(bottleAccentColor);
      rect(bottleXPos + 10, bottleYPos + 40, 20, 5);//bottle end
      ellipse(bottleXPos + 20, bottleYPos, 20, 10);//lid
      ellipse(bottleXPos + 20, bottleYPos, 4, 2); //lid
   }
   
   void bottlePressed(){
     if (mouseX >= bottleXPos + 10 && mouseX <= bottleXPos + 30 && mouseY >= bottleYPos - 10 && mouseY <= bottleYPos + 40){
       fill(randomColor);
       paintboard.selectedColor = randomColor; // assign the color of the bottle to var selectedColor if pressed.
     }
   }
}
