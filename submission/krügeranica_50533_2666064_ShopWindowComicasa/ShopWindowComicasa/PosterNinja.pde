/*
  This class is used for the different backgrounds in addition to the Ninja game. 
 */

class PosterNinja {
  //position
  int xPosPosterNinja;
  int yPosPosterNinja;
  
  //stars in the background
  Star[] stars;

  PosterNinja (int newX, int newY) {
    rectMode(CENTER);
    xPosPosterNinja = newX; 
    yPosPosterNinja= newY;  
    stars = new Star[50];
    for (int n=0; n< stars.length; n++)
    {
      stars[n] = new Star(random(0, width), random(0, 700), random(3, 8));
    }
  }

  //different Backgrounds for Poster and whole Screen 
  void display(boolean posterClicked, int number, boolean stillAlive, boolean isGamePlaying) {
    if (posterClicked) {
      //game Background
      background(16, 54, 104);
      for (int n=0; n<stars.length; n++)
      {
        stars[n].display();
      }
      drawGameBackground(number, stillAlive, isGamePlaying);
    } else {
      //poster Background 
      drawPosterBackground();
    }
  }

  //draw the whole background for the poster 
  void drawPosterBackground() {
    fill(16, 54, 104);
    rect(xPosPosterNinja, yPosPosterNinja, 200, 300);
    posterStreet();
  }

  //combines all methods used for the game background
  void drawGameBackground(int number, boolean stillAlive, boolean isGamePlaying) {
    gameHouses();
    gameStreet();
    drawMoon();
    drawInformation(number, stillAlive, isGamePlaying);
  }


  //draw street only in the poster 
  void posterStreet() {
    //street
    fill(64, 72, 82);
    rect(xPosPosterNinja, yPosPosterNinja+105, 200, 90);
    fill(255, 255, 255);
    rect(xPosPosterNinja-70, yPosPosterNinja+105, 20, 5);
    rect(xPosPosterNinja-20, yPosPosterNinja+105, 20, 5);
    rect(xPosPosterNinja+30, yPosPosterNinja+105, 20, 5);
    rect(xPosPosterNinja+80, yPosPosterNinja+105, 20, 5);
  }

  //draw street which goes over the whole screen
  void gameStreet() {
    //street
    fill(64, 72, 82);
    rect(xPosPosterNinja+width/2, yPosPosterNinja+835, width, 175);
    fill(255, 255, 255);
    for (int i = xPosPosterNinja-width/2; i<=width; i+=75) {
      rect(i, yPosPosterNinja+835, 20, 10);
    }
  }

  //draw 6 black houses with windows in the background 
  void gameHouses() {
    fill(0);
    //building 1
    circle(xPosPosterNinja+40, yPosPosterNinja+360, 300);
    rect(xPosPosterNinja+40, yPosPosterNinja+600, 300, 680);
    windows(xPosPosterNinja, xPosPosterNinja+190, yPosPosterNinja+300);

    //building 2
    rect(xPosPosterNinja+340, yPosPosterNinja+190, 50, 50);
    rect(xPosPosterNinja+340, yPosPosterNinja+230, 100, 100);
    rect(xPosPosterNinja+340, yPosPosterNinja+600, 200, 800);
    windows(xPosPosterNinja+280, xPosPosterNinja+440, yPosPosterNinja+240);

    //building 3
    triangle(xPosPosterNinja+415, yPosPosterNinja+250, xPosPosterNinja+645, yPosPosterNinja+250, xPosPosterNinja+520, yPosPosterNinja+200);
    rect(xPosPosterNinja+520, yPosPosterNinja+600, 250, 700);
    windows(xPosPosterNinja+435, xPosPosterNinja+605, yPosPosterNinja+290);

    //building 4
    triangle(xPosPosterNinja+835, yPosPosterNinja+115, xPosPosterNinja+845, yPosPosterNinja+115, xPosPosterNinja+840, yPosPosterNinja+100);
    rect(xPosPosterNinja+840, yPosPosterNinja+150, 10, 70);
    rect(xPosPosterNinja+840, yPosPosterNinja+200, 100, 75);
    rect(xPosPosterNinja+840, yPosPosterNinja+220, 150, 50);
    rect(xPosPosterNinja+840, yPosPosterNinja+220, 200, 10);
    rect(xPosPosterNinja+840, yPosPosterNinja+600, 180, 750);
    windows(xPosPosterNinja+780, xPosPosterNinja+910, yPosPosterNinja+265);

    //building 5
    triangle(xPosPosterNinja+1000, yPosPosterNinja+350, xPosPosterNinja+1100, yPosPosterNinja+350, xPosPosterNinja+1050, yPosPosterNinja+300);
    rect(xPosPosterNinja+1050, yPosPosterNinja+400, 100, 100);
    rect(xPosPosterNinja+1000, yPosPosterNinja+600, 230, 400);
    windows(xPosPosterNinja+925, xPosPosterNinja+1075, yPosPosterNinja+440);

    //builing 6
    circle(xPosPosterNinja+1340, yPosPosterNinja+275, 150);
    rect(xPosPosterNinja+1340, yPosPosterNinja+275, 200, 50);
    rect(xPosPosterNinja+1340, yPosPosterNinja+300, 230, 50);
    rect(xPosPosterNinja+1340, yPosPosterNinja+600, 250, 600);
    windows(xPosPosterNinja+1255, xPosPosterNinja+1425, yPosPosterNinja+340);
  }

  //draw windows between the different values, with a distance of 40 between the windows
  void windows(int xPosStart, int xPosStopp, int yPosStart) {
    for (int i = xPosStart; i<xPosStopp; i+=40) {
      for (int n = yPosStart; n<yPosPosterNinja+700; n+=40) {
        fill(252, 255, 190);
        rect(i, n, 20, 20);
        fill(0);
      }
    }
  }

  //draw Moon in the left upper corner 
  void drawMoon() {
    fill(220);
    circle(xPosPosterNinja+60, yPosPosterNinja+60, 75);
    fill(171);
    circle(xPosPosterNinja+70, yPosPosterNinja+80, 20);
    fill(144);
    pushMatrix();
    translate(xPosPosterNinja+40, yPosPosterNinja+50);
    rotate(radians(30));
    ellipse(0, 0, 20, 30);
    popMatrix();
    fill(238);
    circle(xPosPosterNinja+75, yPosPosterNinja+45, 15);
  }

  /* 
   draw game information in the right upper corner 
   If the Ninja died during the game, the information Game Over displays and hte instructions to restart the game
   If the game is playing the live chart is displayed to show how many lives are left 
   The game was not started yet the instructions for the game start are displayed
   */
  void drawInformation(int number, boolean stillAlive, boolean isGamePlaying) {
    if (!stillAlive) {
      textSize(20);
      text("Game Over", xPosPosterNinja+1350, yPosPosterNinja+30);
      text("Press n to try again ", xPosPosterNinja+1310, yPosPosterNinja+50);
    } else if (isGamePlaying) {
      textSize(20);
      text("Lives: " + number, xPosPosterNinja+1400, yPosPosterNinja+30);
    } else {
      textSize(20);
      text("Press g to start ", xPosPosterNinja+1330, yPosPosterNinja+30);
      text("Press a and d to move ", xPosPosterNinja+1265, yPosPosterNinja+60);
      text("Press space to jump ", xPosPosterNinja+1285, yPosPosterNinja+90);
    }
  }
}
