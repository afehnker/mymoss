/*
This class is for drawing the closet on the screen.
The function display() draws the closet and everything inside it.
The function interactCloset() will trigger the 'pressed' functions of the objects in the closet. 
*/
class Closet {
  //initialising variables and colors:
  int closetXPos;
  int closetYPos;
  int closetWidth;
  int closetHeight;
  color closetColor;
  color backClosetColor;
  color backgroundColor;
  Doll doll;
  Balls balls;
  Wool wool;
  Needles needles;
  Drawer drawer;

  Closet() {
    //assigning values to variables:
    closetWidth = 480;
    closetHeight = 645;
    closetXPos = 350;
    closetYPos = height - closetHeight;
    closetColor = color(178, 149, 115);
    backClosetColor = color(135, 106, 86);
    backgroundColor = color(168, 212, 255);
    doll = new Doll(closetXPos + 355, closetYPos + 130);
    balls = new Balls(closetXPos + 55, closetYPos + 205);
    wool = new Wool(closetXPos + 125, closetYPos + 305);
    needles = new Needles(closetXPos + 355, closetYPos + 305);
    drawer = new Drawer(closetXPos + 35, closetYPos + 490);
  }

  void display() {
    fill(closetColor);
    rect(closetXPos, closetYPos, closetWidth, closetHeight); //draws rectangle for the base of the closet.
    fill(backgroundColor);
    rect(closetXPos + 40, closetYPos + 625, 400, 20);//draws a bar the colour of the background, this makes it look like the closet has legs.
    
    //draws the different sections of the closet:
    fill(backClosetColor);
    rect(closetXPos + 25, closetYPos + 25, 200, 200);
    rect(closetXPos + 255, closetYPos + 25, 200, 200);
    rect(closetXPos + 25, closetYPos + 255, 200, 200);
    rect(closetXPos + 255, closetYPos + 255, 200, 200);
    
    //draws and updates all the elements in the closet:
    doll.display();
    doll.update();
    wool.display();
    wool.update();
    needles.display();
    needles.update();
    balls.display();
    balls.update();
    drawer.display();
    drawer.update();
  }
  
  void interactCloset(){
    //allows interaction with closet
    balls.ballsPressed();
    wool.woolPressed();
    doll.dollPressed();
  }
}
