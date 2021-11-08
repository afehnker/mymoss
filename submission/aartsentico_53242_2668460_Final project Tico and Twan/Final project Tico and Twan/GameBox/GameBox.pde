//This program is made by Tico Aartsen and Twan de Groot
Game1 game1;
Game2 game2;
Game3 game3;

int widthGame = 460;
int heightGame = 567;
int gameX = 267;
int gameY = 385;
public int currentGame = 1;

public PImage shopping_front;

void setup() {
  size(1920, 1080);
  game1 = new Game1(gameX, gameY, widthGame, heightGame);
  game2 = new Game2(gameX, gameY, widthGame, heightGame);
  game3 = new Game3();
  shopping_front = loadImage("Shopping_front.jpg");
}

void draw() {
  image(shopping_front, 0, 0);    //background image
  if (currentGame == 1) {        //checking if game 1 or 2 is active and display it
    game1.display();
  } else if (currentGame == 2) {
    game2.display();
  }
  game3.display();
}

void mouseClicked() {
  if ((mouseX > gameX && mouseX < gameX+widthGame)        //checking if the click location is 
    && (mouseY > gameY && mouseY < gameY+heightGame)) {   //whitin the game window
    if (currentGame == 1) {
      game1.clicked();
    } else if (currentGame == 2) {
      game2.clicked();
    }
  } else if ((mouseX > 808 && mouseX < 966)               //checking if the click is on the
    && (mouseY > 29 && mouseY < 187)) {                   //rubix cube 
    game3.clicked();
  }
}

void keyPressed() {
  if (key == CODED && currentGame == 2) {                 //If game 2 is active,
    game2.buttonPressed(keyCode);                         //forward the keyCode to game2
  }
}
