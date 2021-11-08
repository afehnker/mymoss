/* This is the class TelevisionScreenOn.
 When the tv is turned on, this screen will cover the blackscreen of the television (from when the television is turned off).
 This screen has the exact same size of the television screen so it looks like that the television screen changes but it is
 just another layer on top of it. In addition, over the background layer of the screen, a creature is displayed,
 that moves and bounces of the walls. When the creature bounced of the wall, the word "Biem!" will be displayed for a seccond.  */

class TelevisionScreenOn {
  int x;
  int y;
  int dx = 2;
  int red = 255;
  int green = 255;
  int blue = 225;
  int redBackground = 255;
  int greenBackground = 255;
  int blueBackground = 255;
  int touchCounter= 0;

  void display() {
    if (television01.tvOn == true) {
      pushMatrix();
      translate(television01.xTelevision, television01.yTelevision);

      //television screen if television is turned on
      fill(redBackground, greenBackground, blueBackground);
      rect(0, -8, 180, 135, 30);

      //creature
      fill(red, green, blue);
      stroke(0);
      strokeWeight(3);
      triangle(x-20, y+12, x+20, y+12, x, y);//wings
      ellipse(x, y+10, 20, 40);//body
      ellipse(x, y-10, 40, 20);//head
      arc(x, y-8, 7, 5, 0, PI, OPEN); //mouth
      fill(0);
      ellipse(x+5, y-12, 3, 3); //eye left
      ellipse(x-5, y-12, 3, 3); //eye right
      if ((x<=-50 && dx==2)|| (x>=50 && dx==-2)) { // if creature touched border --> "Biem!" will be displayed for a seccond
        textSize(20);
        textAlign(CENTER);
        text("BIEM!", 0, 50);
      }
      popMatrix();
    }
  }

  void moveCreature() {
    if (television01.tvOn==true) {
      x = x + dx;
      if (x==70 ) {
        dx = -2;
        red = int(random(0, 255));
        green = int (random(0, 255));
        blue = int(random(0, 255));
        redBackground=int (random(150, 255));
        greenBackground=int (random(150, 255));
        blueBackground= int (random(150, 255));
        touchCounter = touchCounter + 1;
      }
      if (x==(-70)) {
        dx= 2;
        fill(random(0, 255), random(0, 255), random(0, 255));
        red = int(random(0, 255));
        green = int(random(0, 255));
        blue = int(random(0, 255));
        redBackground=int (random(150, 255));
        greenBackground=int (random(150, 255));
        blueBackground= int (random(150, 255));
        touchCounter = touchCounter + 1;
      }
    }
  }
}
