// Programm of Oscar Spuij and Maya Schuurmans (s........, s2773589).
// Some kind of replica from the real Mario Bros game.

//variables
boolean newletter;
boolean direction;
boolean start;
boolean jump;
boolean mouseClicked;
float velocity;
float velocityconst;

//constructors
Mario Mario1;
Background Background1;
Tube Tube1;
Attributes Attributes1;
Shoppingwindow Shoppingwindow1;
Score Score1;

//size of canvas and place of images indicated.
void setup() {
  frameRate(600);
  size(800, 800);
  velocityconst = -8.5;
  velocity = velocityconst;
  Background1 = new Background(0, 0);
  Mario1 = new Mario(300, 570, 290);
  Tube1 = new Tube(300, 550);
  Attributes1 = new Attributes(215, 515);
  Shoppingwindow1 = new Shoppingwindow();
  Score1 = new Score(500,100);
}


//displays all the classes and introduces the programm to the jump option of Mario.
void draw() {
  Background1.display();
  Background1.update();
  Attributes1.display();
  Attributes1.update();
  Attributes1.checkCollision();
  Tube1.display();
  Tube1.update();
  Mario1.display();
  Score1.display();
  newletter = false;
  if (newletter == true) {
    Mario1.drive(direction);
  }
  if (jump == true) {
    Mario1.jump();
  }
}


//makes Mario move with the arrowkeys.
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      Mario1.moveLeft();
    } else if (keyCode == RIGHT) {
      Mario1.moveRight();
    } else if (keyCode == UP) {
      jump = true;
    }
  }

  if (key == 's') {
    Shoppingwindow1.display();
  }
}
