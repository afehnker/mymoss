/*
======================================================================================================================================================
Requires
Video library from Processing
Changing line 49 to the location of the video.avi file in this folder since processing can't do relative paths for video

Final Project of Alyson Benthem and Arthur Wijnen

The Program displays the shopwindow of Comicasa in Enschede. It displays a little video, made in blender, when clicking on the left window
a bike passes by the front while changing colour, speed, and height to appear as if it is different bikes.
Pressing the spacebar starts a spaceship flying by the right window, clicking on that will start a minigame!


======================================================================================================================================================
*/


//declaring all global variables
PImage Storefront;
PImage Right_window;
PImage Left_window;
PImage Ship;

//ship position, necessary to start the minigame
float shipX = 1730;
float shipY = 200;

//the variables for the minigame
ArrayList enemies = new ArrayList();
ArrayList bullets = new ArrayList();
int direction = 1;
boolean incy = false;
int score = 0;
boolean gameOver;
boolean playing = false;

//importing video player
import processing.video.*;

//constructing objects
Movie movie;
Bike bike;
Ship airship;
Game game;
Player player;

void setup() {
  //preparing the classes, you need to change the line below for the video to work, as Processing doesn't seem to allow videos to be played via relative path
  movie = new Movie(this, "C:/Users/arthu/Documents/Processing/programming/video.avi");
  bike = new Bike();
  airship = new Ship();
  game = new Game();
  player = new Player();

  //setting shapes up
  rectMode(CORNER);
  ellipseMode(CENTER);
  fullScreen();

  //preparing the images
  Storefront = loadImage("comicasa_store_front.png");
  Right_window = loadImage("rightsidecomicasa.jpg");
  Left_window = loadImage("leftsidecomicasa.png");
  Ship = loadImage("airship.png");
}

//reading all the frames of the movie out to properly draw them
void movieEvent(Movie movie) {
  movie.read();
}

void draw() {

  //if statement that sees if the minigame has been initialised
  if (playing) {
    background(0);

    //draws the player for the minigame
    player.display();

    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = (Bullet) bullets.get(i);
      bullet.display();
    }

    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = (Enemy) enemies.get(i);
      if (enemy.outside() == true) {
        direction *= (-1);
        incy = true;
        break;
      }
    }

    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = (Enemy) enemies.get(i);
      if (!enemy.alive()) {
        enemies.remove(i);
      } else {
        enemy.display();
      }
    }

    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = (Enemy) enemies.get(i);
      if ((enemy.getX() == player.locationX() && enemy.getY() == player.locationY()) || enemy.getY() == 0) {
        pushMatrix();
        translate(width/2, height/2);
        //box
        fill(255);
        rect(0, 0, 350, 300);
        //message
        textMode(CENTER);
        textSize(80);
        fill(0);
        text("Game Over", -150, 100);
        popMatrix();
        break;
      }

      if (enemies.size() == 0) {
        pushMatrix();
        translate(width/2, height/2);
        //box
        fill(255);
        rect(0, 0, 350, 300);
        //message
        textMode(CENTER);
        textSize(80);
        fill(0);
        text("You Won!", -150, 100);
        popMatrix();
        break;
      }
    }

    incy = false;

    //else that shows the normal storefront while the game isnt playing
  } else {
    //draw the background with the ship hiding behind the front layer
    image(Right_window, 1343, 358);
    image(Left_window, 10, 358);
    image(movie, 10, 358, 653, 612);
    airship.display();
    airship.update();
    image(Storefront, 0, 0);

    //draw the bike class
    bike.display();
    bike.update();
  }
}

//plays movie when mousepressed. Will be removed or changed
void mousePressed() {
  if (mousePressed == true && mouseX <= 663 && mouseX >= 10 && mouseY >= 358 && mouseY <= 970) {
    movie.jump(0);
    movie.play();
  }

  //changes the boolean playing to true when clicking on the ship so the minigame starts
  if (mousePressed == true && mouseX >= shipX && mouseX <= shipX+138 && mouseY >= shipY && mouseY <= shipY+84) {
    playing = true;
  }
}
