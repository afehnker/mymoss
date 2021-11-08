import processing.video.*;
Remote remote;
Button[] buttons;
Tv tv;

PImage televisionBackground;

PFont malgun;

void setup() {
  size(1500, 924, P3D); //using the 3D engine ' P3D' 

  malgun = loadFont("MalgunGothicBold-48.vlw"); //Load in new font
  remote = new Remote();
  buttons = new Button[14]; 
  tv = new Tv();

  televisionBackground = loadImage("img/tvshelf.jpg"); //Load the tv background image


  for (int i = 0; i < buttons.length; i ++) {
    buttons[i] = new Button(i); //Setting the buttons array
  }

  rectMode(CENTER); 
}

void draw() {

  background(televisionBackground); //using the loaded background image
  camera(0, 300, 200, 0, 0, 100, 0, 0, -1); //Setting the camera position
  lights();
  ambientLight(100, 100, 100); //Setting the lighting 

  println(tv.tvOn, remote.remoteUse);

  tv.display(); //Update TV

  remote.display(); //Update remote

  for (int i = 0; i < 3; i ++) {
    float xStep = -40;
    for (int m = i*3; m < 3*(i+1); m ++) {
      xStep += 40;
      buttons[m].display(xStep, 40*i, 30, 12, 20, #FFFFD3); //Displaying all the button using for loops
    }
  }
  buttons[9].display(40, -40, 30, 13, 20, #FF2200);
  buttons[10].display(0, 110, 30, 10, 20, #FF2200);
  buttons[11].display(80/3, 110, 30, 10, 20, #00E018);
  buttons[12].display(80/3*2, 110, 30, 10, 20, #E0D900);
  buttons[13].display(80/3*3, 110, 30, 10, 20, #00C8E0); //Displaying the color buttons and the on/off button
}

void keyPressed() {
  remote.remoteGrab(key); //If key is pressed, is it the BACKSPACE to raise remote?
  for (int i = 0; i < buttons.length; i ++) { 
    buttons[i].buttonPress(i, key); //If key is pressed, send the key value to buttons class
  }
}

void keyReleased() {
  for (int i = 0; i < buttons.length; i ++) {
    buttons[i].buttonUp(i, key); //If key is released, send the key value to buttons class
  }
}

void mouseMoved() {
  remote.rotateRemote(mouseX, mouseY); //The mouse values are sent to remoteMove
}
