// Planets of Sounds
// made by Nick van Koeverden, Matthijs Berkhout
// Final Project Programming

// import library for implementing sounds
import processing.sound.*;

// declare 7 planets, 500 stars, recordPlayer
Planet [] planets = new Planet [7];
Star [] stars = new Star [500];
RecordPlayer recordPlayer;

void setup() {
  size(1600, 900, P3D);

  // construct and initialize recordPlayer
  recordPlayer = new RecordPlayer(width/2, height-300);

  // initialize arrays of sounds
  SoundFile ThrowMyBones = new SoundFile(this, "ThrowMyBones.mp3");
  SoundFile [] songs = {ThrowMyBones, ThrowMyBones, ThrowMyBones, ThrowMyBones, ThrowMyBones, ThrowMyBones, ThrowMyBones}; //old-fashioned array to put all the seperate songs in

  // construct 7 planets with initialisation
  for (int i = 0; i < planets.length; i++) {
    planets[i] = new Planet(random(width*0.1, width*0.9), random(0, height/2-100), random(20, 30), color (random(0, 255), random(0, 255), random(0, 255)), songs[i] );
  }

  // construct 500 planets with initialisation
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(random(0, width), random(0, height));
  }
}

void draw() {
  background(0);

  // display and update every star
  for (int i = 0; i < stars.length; i++) {
    stars[i].display();
    stars[i].update();
  }

  // display, rotate, scale and move every planet
  for (int i = 0; i < planets.length; i++) {
    planets[i].display();
    planets[i].rotatePlanet(recordPlayer.onDisk(planets[i]));  //only rotate if boolean (parameter) is true
    planets[i].scalePlanet();  //if drag then the planet will always scale
    planets[i].moveAutomatic(recordPlayer.inDiskArea(planets[i]), recordPlayer);  //planets will lerp automaticly to initial position or recordplayer position if boolean(parameter) is true.
  }
  
  // display recordPlayer
  recordPlayer.display();
}

void mousePressed() {
  // if pause pressed, for every planet:
  for (int i = 0; i < planets.length; i++) {
    planets[i].select(mouseX, mouseY);  //select method in planet will get the attributes and determines if planet attribute isSelected
    recordPlayer.pauseButtonClicked(mouseX, mouseY, planets[i]);  //uses mouse positions to look if mouse on button, and uses each planet to turn off their song
    recordPlayer.playButtonClicked(mouseX, mouseY, planets[i]);  //uses mouse positions to look if mouse on button, and uses each planet to turn on their song
  }
}

void mouseDragged() {
  // for every planet method drag is called, to connect the mouseX and the mouseY to the x and y positions of the selected planet
  for (int i = 0; i < planets.length; i++) {
    planets[i].drag(mouseX, mouseY);
  }
}

void mouseReleased() {
  // method deselect sets isSelected for every planet
  for (int i = 0; i < planets.length; i++) {
    planets[i].deselect();
  }
}
