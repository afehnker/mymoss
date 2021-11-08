/*
Project name: interactiveComicasa
 Author: Tobias Brouwers and Lucas Leijzer Vis, Group 5
 */
import processing.sound.*; //import the processing sound library
SoundFile peaceful;
SoundFile boom;
SoundFile avengers;
PImage bg;
PImage crew;
PImage pillar;
boolean exploding;
ExplodingMinion minion;
Mariposa mariposas;
Marvel marvelPoster;


void setup() {
  size(2000, 880);
  peaceful = new SoundFile(this, "sounds/butterfly.mp3");
  boom = new SoundFile(this, "sounds/explode.mp3");
  avengers = new SoundFile(this, "sounds/avengers.mp3");
  imageMode(CENTER);
  loadImages();
  minion = new ExplodingMinion(507, 604);
  mariposas = new Mariposa(536, 329);
  marvelPoster = new Marvel(106, 346);
  exploding = false;
}

void loadImages() {
  bg = loadImage("img/background.png"); // 0, 0
  crew = loadImage("img/decrew.png");// 712, 209
  pillar = loadImage("img/pillar.png"); // 889, 441
}

void draw() {
  background(bg);
  if (!exploding) { // Put the minions on the back layer unless exploding
    minion.display();
  }
  mariposas.display(mouseX, mouseY);
  image(pillar, 900, 441); // Added the pillar for a bit more of a 3d effect when flying the butterfly
  image(crew, 712, 209); // Again, because the poster is over the game in the picture.
  marvelPoster.display();
  if (exploding) {
    minion.display();
  }
}

void mouseClicked() {
  exploding = minion.explode();
  mariposas.fly();
  marvelPoster.intro();
}

void mouseMoved() {
  minion.isSelected(mouseX, mouseY);
  mariposas.isSelected(mouseX, mouseY);
  marvelPoster.isSelected(mouseX, mouseY);
}
