// Final project of Adieb Hanifi and Thijs Rolleman (Programming)
// We decided to build a Planet Of Sound animated window

//classes
letters letters01;
posters posters01;
window window01;
banner banner01;
background background01;
plate plate01;
plate plate02;

//import the sound
import processing.sound.*;
SoundFile song;

void setup() {
  size(600, 900);
  letters01 = new letters();
  posters01 = new posters();
  window01 = new window();
  banner01 = new banner();
  background01 = new background();
  plate01 = new plate(150, 450);
  plate02 = new plate(450, 450);
  song  = new SoundFile(this, "music.wav");
  song.loop();
}

//draw the  classes
void draw() {
  window01.display();
  background01.display();
  letters01.display();
  posters01.display();
  posters01.move();
  banner01.display();
  plate01.display();
  plate02.display();
}
