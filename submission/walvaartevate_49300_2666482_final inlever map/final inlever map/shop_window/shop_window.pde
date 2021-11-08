/* ShopWindow final project - Eva te Walvaart
 This program displays the shop window from "electro BV Breuker", Haaksbergen.
 This program has diffrent features:
- the tv can be turned on by clicking on the black ‘on’ button. If the television is turned on, the television can be turned 
off as well by clicking on the black ‘off’ button. 
- the radio can play 2 different songs. By clicking on the play button (rectangle with triangle inside), the first song will
be played. To stop the song, click on the stop button (rectangle with a square inside). By clicking the play button again, 
the second song will play. By clicking on the stop button and the play button (in the this specific order), the first song 
will sound again, and so on.
- the lights on the top of the screen together with the lamp located on the television can be turned on and off with the light
switch on the right side of the screen.  By clicking the left red ellipse, the lights will turn on. If the light is turned on,
the light can be turned off by clicking the green ellipse on the right side.
- all the lights in the program can go into disco mode,  if  the lights are tuned on (by clicking on the red ellipse on the right 
side of the light switch) and the radio is playing a song(start playing a song by clicking on the play button) at the same time. 
The lights (and its beams), then will get random colors. */

import processing.sound.*;
Radio radio01;
Television television01;
LightBulb[] lightBulb01= new LightBulb[20];
LampOnTv lampOnTv01;
LightSwitch lightSwitchBulbs;
TelevisionScreenOn televisionScreenOn01;
SoundFile file1;
SoundFile file2;


void setup() {
  size(950, 800);
  rectMode(CENTER);
  frameRate(30);

  radio01 = new Radio(600, 800-320+55, 300, 200);
  televisionScreenOn01 = new TelevisionScreenOn();
  television01 = new Television(200, 800-325+55);
  lightSwitchBulbs = new LightSwitch(60, 400);
  file1 = new SoundFile(this, "song1.wav");
  file2= new SoundFile(this, "song2.wav");
  for (int i=0; i<lightBulb01.length; i++) {
    lightBulb01[i] = new LightBulb();
  }
  lampOnTv01 = new LampOnTv();
}

void draw() {
  background(255, 180, 246);
  fill(110, 110, 110);
  rect(width/2, height-80, width, 160); // grey table/bar with tv on it

  radio01.display();
  television01.display();
  lampOnTv01.display();
  televisionScreenOn01.display();
  lightSwitchBulbs.display();
  for (int i=0; i<lightBulb01.length; i++) {
    lightBulb01[i].display();
  }
  televisionScreenOn01.moveCreature();
}

void mouseClicked() {
  lightSwitchBulbs.update(mouseX, mouseY);
  television01.update(mouseX, mouseY);
  radio01.updateAudio(mouseX, mouseY);
}
