/*
Bart Aarts, s2619776
 */

Ball ball;
Mario marioBros;
Games games;
Shop store;
SoundFile scream;
PImage mario, fifa, shop;
boolean playFifa;
PImage[] gameIcons = new PImage[3];


void setup() {
  fullScreen();
  ball = new Ball(100, 100);
  marioBros = new Mario();
  store = new Shop(gameIcons);
  mario = loadImage("mario.jpg");
  mario.resize(80, 100);
  gameIcons[0] = mario;
  fifa = loadImage("fifa.jpg");
  fifa.resize(80, 100);
  gameIcons[1] = fifa;
  games = new Games();
  scream = new SoundFile(this, "scream.mp3");
}


void draw() {
  store.display();
  games.display();
}


void mouseDragged() {
  ball.loadShot(mouseX, mouseY);
}


void keyPressed() {
  store.moveCharacters();

  if (keyCode == UP) {
    marioBros.moveUp();
  } else if (keyCode == DOWN) {
    marioBros.moveDown();
  }
}


void mousePressed() {
  games.choosegame(mouseX, mouseY);
  ball.pressMouse(mouseX, mouseY);
  store.jumpscare(mouseX, mouseY);
  ball.home(mouseX, mouseY);
  marioBros.home(mouseX, mouseY);
}

void mouseReleased() {
  ball.releaseMouse(mouseX, mouseY, pmouseX, pmouseY);
}

void mouseMoved() {
  if (true) {
    store.openDoors(mouseX, mouseY);
  }
}
