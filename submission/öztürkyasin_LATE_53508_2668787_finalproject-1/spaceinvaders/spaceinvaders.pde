//a game made by Yasin Öztürk and Kick Visser
//the objective is to destroy the objects that are slowly moving towards the bottom, and get a high score
//use the mouse to move the player object left and right
//use CTRL to shoot
//it takes 3 shots to destroy each object

//initialising some global variables and array lists
PImage bg; //stores the image for bg which we will use as background
PImage hartje;//stores the image for hartje as we will use a picture of a heart as our spaceship/player
PImage regenboog;//stores the image for our rainbow
PImage enemy;//stores the image for our enemies
PImage kogels;//stores the image for our bullets
int pixelsize = 4;
int gridsize  = pixelsize * 7 + 5;
Player player; // initialises object player
Rainbow rainbow; // initialises object rainbow
ArrayList enemies = new ArrayList(); //creates arraylist for the enemies
ArrayList bullets = new ArrayList(); //creates arraylist for our bullets
int direction = 1; //defines movement speed for the enemy grid
boolean incy = false; //dunno what this does
boolean gameOver = false; //sets standard gameOver state to false, because obviously we want to start the game before it ends
int score = 0; //sets initial score to 0
int c = 0; 
PFont f; //stores the font arial
boolean exists = true;

//the setup
void setup() {
  noStroke();// disables drawing the outline
  size(1000, 750); // sets the size of the game window to 1000 pixels wide and 750 pixels high
  colorMode(HSB); //sets color mode to HSB
  player = new Player(); //sets up object player
  rainbow = new Rainbow();//sets up object rainbow
  createEnemies();//creates enemies

  f = createFont("Arial", 36, true); //creates and sets font to arial
  bg = loadImage("regenboogwinkel1.jpeg");//loads image for the background which is the store we wanted to use
  hartje = loadImage("hartje.png");//loads the image for hartje which is used as our spaceship
  regenboog = loadImage("rainbow.png");//loads image for the rainbow
  enemy = loadImage("enemy.png");  //loads the image for our enemies
  kogels = loadImage("kogels.png"); //loads the image for our bullets
}

void draw() {
  background (bg); //draws the background

  //checks if the game state gameOver has been met and shows the end screen if it has
  if (gameOver == false) {
    drawPlaying();
  } else if (gameOver == true) {
    drawEndscreen();
  }
}


void drawPlaying() {
  background(bg);  //refreshing background

  drawScore();    //draws the scoreboard if the game state game over has been met
  if (score >= 3600) {
    gameOver = true;
  }

  player.draw();
  //drawing bullets
  for (int i = 0; i < bullets.size(); i++) {
    Bullet bullet = (Bullet) bullets.get(i);
    bullet.draw();
  }
     if(exists==true){
     
      rainbow.draw();//draws the rainbow
     } 

  //drawing enemies
  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = (Enemy) enemies.get(i);
    if (enemy.outside() == true) {
      direction *= (-1);  //turns the grid of enemies around when it's about to go out of bounds
      incy = true; //moves the grid of down
      break;
    }
  }
  //removing enemies when destroyed
  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = (Enemy) enemies.get(i);
    if (!enemy.alive()) {
      enemies.remove(i);
    } else {
      enemy.draw();
    }
  }

  incy = false;
}
//making of the scoreboard
void drawScore() {
  textFont(f);
  text("Score: " + String.valueOf(score), 300, 50); // shows your score and sets the size of the text on the endscreen
}
//creating the enemies
void createEnemies() {
  for (int i = 0; i < width/gridsize/2; i++) {
    for (int j = 0; j <= 5; j++) {
      enemies.add(new Enemy(i*gridsize, j*gridsize));
      //sets gridposition and size
    }
  }
}
void drawEndscreen() { //draws the endscreen when game state game over has been met
  background(c, 200, 200); //sets the background color
  textFont(f); //sets textfont
  text("Your Final Score: " + String.valueOf(score), 225, 200); //shows your final score
  fill(255);
  c++;
  if (c>255) {
    c=0; //sets and changes color
  }
}
