/*
Module 1 Final programming project
 
 Teckel maze created by:
 Janin Ruumpol s2779363
 Marije Rekker s2634678
 
 Finalised on 31/10/2021
 
 Ohno Teckel Longboy is lost!!
 Help him find his way out of the maze by pressing the WASD keys
 It might help if you eat some bones while your at it as it increases Longboys speed
 But remember time is ticking, you have two minutes to free Longboy, otherwhise he will be stuck forever...
 
 */

Dog teckel;
Time time;
Finish finish;

//Tell which fase of the game you are in.
int phase = 0;
int gameSetup = 0;

//Bones yes
Bone[] bones;
int numberBones  = 25;

//The height and width of the maze in cells, for calculating where the bones need to go.
float mazeWidth = 25;
float mazeHeight = 15;

//Sound of doggie eating
import processing.sound.*;
SoundFile eating;

//Sound of the gameSong
SoundFile gameSong;

//Images
PImage maze;
PImage start;
PImage endWon;
PImage endLost;

void setup() {

  size(1500, 900);
  ellipseMode(CENTER);
  noSmooth();

  time = new Time();
  finish = new Finish();
  bones = new Bone[numberBones];
  eating = new SoundFile(this, "eating.wav");
  gameSong = new SoundFile(this, "RoggeLiveThemeSong.mp3");

  //Loading images
  start = loadImage("longboy start.png");
  endWon = loadImage("endwon.png");
  endLost = loadImage("endlost.png");

  //Play gameSong in a loop
  gameSong.loop();
}

void draw() {

  //Count the time.
  time.count();
  time.timeIsUp();

  //Phase 0 --> Startscreen
  if (phase == 0) {
    image(start, 0, 0, width, height);
  }

  //Phase 1 --> Game starts!
  if (phase == 1) {

    //Game setup (Only setting this up once does not work because we want a new maze with different places bones every time we restart and the dog array needs to be reset)
    if (gameSetup == 0) {
      maze = loadImage("Maze" + int(random(12, 16)) + ".png"); //Maze of 25 cells by 15 cells

      //Decides where the bones go.
      for (int count= 0; count < numberBones; count++) {
        float xr = int(random(0, mazeWidth))*width/mazeWidth - (width/mazeWidth)/2 ;
        float yr = int(random(0, mazeHeight))*height/mazeHeight - (height/mazeHeight)/2 ;
        bones[count] = new Bone(xr, yr);
      }
      teckel = new Dog(width/2, 20);
      gameSetup ++;
    }

    //Actual game
    image(maze, 0, 0, width, height);
    //drawBones
    for (int i=0; i<bones.length; i++) {
      bones[i].displayBone();
      bones[i].pickBone(teckel.dogX, teckel.dogY, teckel);
    }

    //drawTeckel
    teckel.dogBack();
    teckel.wholeDog();
    teckel.dogFace();

    //drawFinish
    finish.display();
    finish.finito(teckel.dogX, teckel.dogY);
  }

  //Phase 2 --> Victory! You reached the finish before you ran out of time.
  if (phase == 2) {
    image(endWon, 0, 0, width, height);
    time.display();
  }

  //Phase 3 -- > You lost! :( You get this screen when you run out of time before you reach the finish.
  if (phase == 3) {
    image(endLost, 0, 0, width, height);
  }
}

//Change phase with a mouse click
void mousePressed() {
  if  (phase == 0) {
    phase++;
  }
}

//For moving the dog with WASD and & change the phase with SPACE
void keyPressed() {
  if (key == ' ' && (phase == 2 || phase == 3)) {
    phase = 1;
    time.resetTime();
    gameSetup = 0;
  }
  if (phase == 1) {
    teckel.moveDog(key);
  }
}
