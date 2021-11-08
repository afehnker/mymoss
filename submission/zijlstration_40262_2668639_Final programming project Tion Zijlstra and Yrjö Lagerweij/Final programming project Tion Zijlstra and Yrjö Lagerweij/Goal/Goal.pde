//Program for the final project of programming
//Programmed designed by Tion Zijlstra & Yrjö Lagerweij

//Defining the classes
Keeper goalie;
Shoes rightShoe;
Ball ball;
Scoreboard scoreboard;
Penalty penalty;

//Creating global variables
float ballX;
float ballY;

float xKeeper;
float yKeeper;


float xMovement;

float xShoe;
float yShoe;

float handX1;
float handX2;
float handTop;
float handBottom;

float bodyX1;
float bodyX2;
float bodyTop;
float bodyBottom;

PImage background;

void setup() {
  size(800, 800);
  goalie = new Keeper(400, 200);
  ball = new Ball(400, 595);
  rightShoe = new Shoes(300, 695);
  scoreboard = new Scoreboard();
  penalty= new Penalty();
  background = loadImage("background.png");
}


void draw() {
  background(background);

  //Calling all classes
  goalie.display();
  ball.display();
  rightShoe.display();
  goalie.movementKeeper();
  ball.update();
  scoreboard.display();
  penalty.shot();
}

void mousePressed() { //When mouse is pressed it will start the penalty shot
  penalty.startGame();
}
