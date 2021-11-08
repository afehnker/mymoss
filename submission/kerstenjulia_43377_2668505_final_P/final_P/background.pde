/*
This class makes the background image. 

*/
class Background {
  //attributes
  float backgroundX;
  float backgroundY;
  color accentColor;
  PImage sign;


  Background(float initX, float initY) {
    backgroundX = initX;
    backgroundY = initY;
    accentColor = color(93, 102, 111);
    imageMode(CENTER);
    sign = loadImage("sjaak.JPG");
  }

  void display() {
    //white frames parts
    fill(#e7e7e9);
    rect(backgroundX, backgroundY-400, 900, 100);
    rect(backgroundX+180, backgroundY-100, 20, 500); 
    
    
    //sign
    image(sign, 500, 105);
    //door
    fill(accentColor);
    noStroke();
    rect(backgroundX+300, backgroundY-175, 225, 25); 
    rect(backgroundX+200, backgroundY, 25, 350);
    rect(backgroundX+400, backgroundY, 25, 350);
    rect(backgroundX+300, backgroundY+200, 225, 200);
    //the top part, left wall, etc
    rect(backgroundX, backgroundY-450, 950, 25);
    
    
  }
}
