/*
Hey! This program will NOT run without the external Sound Library

You can import the library in Sketch -> Import Library -> Add Library and look for "Sound" by The Processing Foundadtion.
You can also run a version of this program with no sound that doesn't require external libraries, located in the "Compatible - Without Sound" folder.
*/

import processing.sound.*;
SoundFile file;
PImage[] cone = new PImage[3];
PImage[] ui_element = new PImage[4];
PImage[] scoop_flavours = new PImage[3];
PImage background;
PImage dialog_box;
int scene = 1;
boolean mute;
boolean showDialog;
Dialog dialog = new Dialog();
VDPoel storeFront = new VDPoel();

ArrayList<Scoop> scoops = new ArrayList();

void setup() {
  size(1200, 900);
  cone[0] = loadImage("assets/cone1.png");
  cone[1] = loadImage("assets/cone2.png");
  cone[2] = loadImage("assets/cone3.png");

  scoop_flavours[0] = loadImage("assets/vanilla_scoop.png");
  scoop_flavours[1] = loadImage("assets/choco_scoop.png");
  scoop_flavours[2] = loadImage("assets/berry_scoop.png");

  ui_element[0] = loadImage("assets/check-mark.png");
  ui_element[1] = loadImage("assets/buttons/savebutton.png");
  ui_element[2] = loadImage("assets/up-arrow.png");
  ui_element[3] = loadImage("assets/biking.png");

  dialog_box = loadImage("assets/dialog.png");
  background = loadImage("assets/bg.png");
  file = new SoundFile(this, "assets/back.wav");
  file.loop();
}

void draw() {
  switch(scene) {
  case 1:
    storeFront.storeParallax();
    break;
  case 2:
    background(background);
    imageMode(CENTER);
    rectMode(CENTER);

    if (dialog.selectedCone >= 0) { // If a cone has been selected, display the cone and ice cream pots.
      textSize(32);
      fill(0);
      text("Grab a flavour\nfrom the pots:", 180, 125);
      textSize(32);
      textAlign(RIGHT);
      textSize(18);
      text("Change cone - [SPACE]\nRestart icecream - [X]\nMute music - [M]", 1190, 25);
      textAlign(CENTER);
      fill(233, 117, 155);
      rect(180, 750, 200, 150, 50);
      fill(151, 108, 72);
      rect(180, 550, 200, 150, 50);
      fill(234, 202, 156);
      rect(180, 350, 200, 150, 50);
      image(cone[dialog.selectedCone], 750, 780, 184, 320);
      for (int i = 0; i < scoops.size(); i++) { 
        Scoop scoop = scoops.get(i);
        scoop.display();
      }
    } else { // If a cone has not been selected yet, display the coneSelector dialog window.
      dialog.coneSelector();
    }
    if (showDialog) {
      dialog.coneSelector();
    }
    break;
  }
}
void keyPressed() {
  switch(key) {
  case ' ':
    showDialog = true;
    break;
  case 'm':
    if (!mute) {
      file.stop();
      mute = true;
    } else {
      file.loop();
      mute = false;
    }
    break;
  case 'b':
    scene = 1;
    break;
  }
}

void mousePressed() {
  if (dialog.selectedCone >= 0) {
    if (mouseX > 180-(200/2) && mouseX < 180+(200/2) && mouseY > 750-(150/2) && mouseY < 750+(150/2)) { // If mouse over Strawberry pot
      scoops.add(new Scoop(2, mouseX, mouseY));
    }
    if (mouseX > 180-(200/2) && mouseX < 180+(200/2) && mouseY > 550-(150/2) && mouseY < 550+(150/2)) { // If mouse over Chocolate pot 
      scoops.add(new Scoop(1, mouseX, mouseY));
    }
    if (mouseX > 180-(200/2) && mouseX < 180+(200/2) && mouseY > 350-(150/2) && mouseY < 350+(150/2)) { // If mouse over Vanilla pot  
      scoops.add(new Scoop(0, mouseX, mouseY));
    }
  }
}
