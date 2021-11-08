/*
Programed By: Matthew and Apurv
 Sprites and Designs: Matthew AND aPURV
 Music: All music is taken from ..... The songs are royalty free
 */

//Imports the sound library made by processing into the game
import processing.sound.*;

//This holds a boolean array of which keys are currently being pressed
//This is done because the 'key' value can only hold 1 value at at time and makes movement rigid, this allows for smother input
boolean[] keys = new boolean[4];

//This is the central GameManager object that controls the entire game, thus allowing for few global variables
GameManager gm;

void setup() {
  //Sets the screen size to 1200 x 800 pixels
  size(1200, 800);
  //Begins a new game immediately when the program is started
  startNewGame();
}

void startNewGame() {
  //Creates an array of the Song object, that will be given to the SoundManager
  //This has to be done in main
  //To avoid keeping the SoundManager and Songs array as global variables, this is redone at the beginning of evrey new game and 'fed' to the GameManager
  Song[] songs = {
    new Song("song1", new SoundFile(this, sketchPath("JamNight.wav")), 430), 
    new Song("song2", new SoundFile(this, "LoboLoco.wav"), 380), 
    new Song("song3", new SoundFile(this, "ForgettheWhale.wav"), 500)
  };
  //Creates a new SoundManager and gives it the songs array
  SoundManager sm = new SoundManager(songs);
  //Sets the gamemanager to a new GameManager
  //This gets rid of the old GameManager and so a new Cowboy and all of it's other variables are 'reset'
  //This effectively restarts the game
  gm  = new GameManager(sm);
}

void draw() {
  //This tells the gamemanager to play every cycle
  gm.playGame();
}

void keyPressed() {
  //Switch statement is used to determine what to do with the 'key'. This is better than using several if statements because the switch statement works more effectively.
  switch(key) {
    //The WASD keys each have a correlating index in the boolan array keys, if a WASD key is pressed their value in the keys array is set to true
  case 'w':
    keys[0] = true;
    break;
  case 'a':
    keys[1] = true;
    break;
  case 's':
    keys[2] = true;
    break;
  case 'd':
    keys[3] = true;
    break;
  case 'e':
    //If 'e' is pressed, the gameManager is told to use a cactus attack
    gm.cactusAttack();
  }
  //If a coded key is pressed, this switch checks what to do with it
  switch(keyCode) {
  //Each of the arrow keys relates to an attack type, which the gamemanager is told to attack with when they are pressed
  case UP:
    gm.attack(AttackType.ONESHOT);
    break;
  case LEFT:
    gm.attack(AttackType.LASER);
    break;
  case DOWN:
    gm.attack(AttackType.SPRAY);
    break;
  case RIGHT:
    gm.attack(AttackType.WAVE);
    break;
  }
}

void keyReleased() {
  //The same applies for WASD keys here as in keyPressed, however their value in keys is set to false if they are released
  switch(key) {
  case 'w':
    keys[0] = false;
    break;
  case 'a':
    keys[1] = false;
    break;
  case 's':
    keys[2] = false;
    break;
  case 'd':
    keys[3] = false;
    break;
  }
}

void mouseClicked() {
  //When the mouse is clicked, it's position is fed to the gamemanager that decides what to do with it
  gm.handleMouse(mouseX, mouseY);
}
