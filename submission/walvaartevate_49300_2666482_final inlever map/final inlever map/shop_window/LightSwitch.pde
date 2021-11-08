/* This is the LightSwicht class, this class ensures that the lightbulbs on top of the screen and the light bulb form the
 lamp located on the tv change collors by clicking the mouse on the red ellipse of the light switch, so that the lights turn on.
 The lights turn off when the mouse is clicked on the green ellipse of the light switch. It is also possible to give the light bulbs
 a disco mode, so the collors change randomly. The disco mode turns on when the radio is playing a song and the light switch
 is turned on at the same time. */

class LightSwitch {
  int buttonX;
  int buttonY;
  int ColorBeam; 
  boolean turnOn = false;
  boolean disco = false;
  int redYellowOrDisco = 233;
  int greenYellowOrDisco =223;
  int blueYellowOrDisco =0;

  LightSwitch(int initButtonX, int initButtonY) {
   buttonX = initButtonX;
   buttonY = initButtonY;
  }

  void display() {
    fill(255);
    stroke(0);
    strokeWeight(3);
    rect(buttonX, buttonY, 50, 30, 10); //backlayer of light switch

    if (turnOn==true) {
      fill(0,255,0);
      ellipse(buttonX +10, buttonY, 14, 14); //left green light switch button
      ColorBeam = color(redYellowOrDisco, greenYellowOrDisco, blueYellowOrDisco, 20);
    } else {
      fill(255,0,0);
      ellipse(buttonX - 10, buttonY, 14, 14); //right red light switch button
      ColorBeam = color(255, 255, 255, 1);
    }

    if (turnOn==true) {
      redYellowOrDisco = 223;
      greenYellowOrDisco = 223;
      blueYellowOrDisco = 0;
    }

    if (disco == true) {
      redYellowOrDisco = int(random(100, 220));
      greenYellowOrDisco =int(random(100, 220));
      blueYellowOrDisco = int(random(100, 220));
    }
    if (turnOn==true && radio01.radioOn ==true) {
      disco = true;
    }
    if ((radio01.radioOn == false&&turnOn==true)||( radio01.radioOn ==true && turnOn ==false)) {
      disco = false;
      redYellowOrDisco = 223;
      greenYellowOrDisco = 223;
      blueYellowOrDisco = 0;
    }
  }

  void update(int initMouseX, int initMouseY) {
    int  xMouse = initMouseX;
    int  yMouse = initMouseY;
    if (dist(xMouse, yMouse, buttonX-10, buttonY)<=30) {
      turnOn =true ;
    }
    if (dist(xMouse, yMouse, buttonX+10, buttonY)<=7 && turnOn ==true) {
      turnOn = false;
    }
  }
}
