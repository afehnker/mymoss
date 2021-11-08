/*
this class is for displaying wool and updating its position. 
when it is pressed it will start moving down and come back up like a yoyo.
the void display() is for displaying the wool, knot, string and rod.
the void update() is for decreasing the speed of the ball every frame.
the speed will keep decreasing it so it will move back up again. 
the size will also decrease when moving down and increase when moving up.
the void woolPressed is for starting to move the wool ball down at a high speed.
*/
class Wool{
  //initialising variables and colors
  int woolXPos;
  int woolYPos;
  int yoyoWoolYPos;
  float ySpeed;
  int startYPos;
  float woolSize;
  boolean woolClicked;
  boolean soundPlayed;
  color woolColor;
  color rodColor;
  color labelColor;
  
   Wool(int overX, int overY){
     //assinging value to variables and colors
     woolXPos = overX;
     woolYPos = overY;
     yoyoWoolYPos = overY; // only move the wool ball and not the entire rod and knot
     startYPos = yoyoWoolYPos; //remembering the startposition to stop the wool ball from going further up
     ySpeed = 0;
     woolSize = 50;
     woolClicked = false;
     soundPlayed = false;
     woolColor = color(random(0,255), random(0,255), random(0,255));
     rodColor = color(50);
     labelColor = color(0);
   }
   
   void display(){
     noStroke();
     fill (rodColor);
     rect(woolXPos - 100, woolYPos - 5, 200, 10); //display rod to which the wool ball is connected
     
     fill(woolColor);
     ellipse(woolXPos, woolYPos, 10,20); // the knot that is attached to the rod
     rect(woolXPos - 1, woolYPos, 2, yoyoWoolYPos - woolYPos); // the string that is attached to the knot and wool ball
     
     //wool ball
     ellipse(woolXPos - 25, yoyoWoolYPos, woolSize, woolSize);
     ellipse(woolXPos + 25, yoyoWoolYPos, woolSize, woolSize);
     fill(labelColor);
     rect(woolXPos - 10, yoyoWoolYPos - woolSize * 0.4, woolSize * 0.5, woolSize * 0.8);
     stroke(1);
   }
   
   void update(){
     // decrease the speed of the ball every frame if wool ball is pressed 
     if (woolClicked){
       ySpeed -= 0.2; // keep decreasing untill start position is reached
     }
     
     //if the wool is higher than the start position
     if (yoyoWoolYPos < startYPos){
       ySpeed = 0; //stop wool ball
       yoyoWoolYPos = startYPos; // reset position of the wool ball to start position
       woolClicked = false; //give the user the ability to click it again
       woolSize = 50; // reset the size of wool ball
     }
     
     yoyoWoolYPos += ySpeed; // change the position of woolball

     if (ySpeed > 0){
       woolSize -= 0.3; //decrease size if moving down
     }
     
     if (ySpeed < 0){
       woolSize += 0.3; //increase size if moving up
     } 
   }
   
   void woolPressed(){
     if (mouseX >= woolXPos - 100 && mouseX <= woolXPos + 100 && mouseY >= woolYPos - 50 && mouseY <= woolYPos + 150 && yoyoWoolYPos == startYPos){
       woolClicked = true; // start to decrease the speed
       ySpeed = 8; // set speed to value to start moving down
       yoyo.play(); // play sound
     }
   }
}
