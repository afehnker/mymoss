//This program is made by Tico Aartsen and Twan de Groot
class Game2 {
  int maxX;                        //declaring variables
  int maxY;
  int x;
  int y;
  int points = 0;
  int highScore = 0;
  int startTime;
  int gameState = 1;                //1=starting screen 2=active game 3=game done

  int posY;
  int posX;
  color col = color(255, 255, 0);
  float size = 0.6;

  float speedX;
  float speedY;
  float a = 0.8;
  float dt = 0.8;

  int amountOfStars = 3;
  int starX[] = new int[amountOfStars];
  int starY[] = new int[amountOfStars];
  int starSpeed[] = new int[amountOfStars];
  PImage star;

  Game2(int locX, int locY, int sizeX, int sizeY) {
    maxX = sizeX;
    maxY = sizeY;
    x = locX;
    y = locY;
    posY = int(locY + sizeY*0.95 - size*95-20);
    posX = int(locX + sizeX*0.5);
    star = loadImage("star.png");
    for (int i = 0; i<amountOfStars; i++) {
      starY[i] = int(random(y+35, y+maxY*0.9-35));
      starX[i] = x+maxX-50;
      starSpeed[i] = int(random(3, 10));
    }
  }

  void display() {
    if (gameState == 1) {                                            //starting screen
      textAlign(CENTER);
      fill(235, 216, 52);
      rect(x, y, maxX, maxY);
      fill(0);
      textSize(25);
      text("Get 20 points as fast as possible!", maxX/2+x, maxY/2+y);
      textSize(20);
      text("Click to start the game", maxX/2+x, maxY/2+y+30);
      textSize(15);
      textAlign(CORNER);
      text("highscore: " + highScore, x+20, y+20);
    } else if (gameState == 2) {                                      //screen when game active
      fill(141, 212, 242); 
      rect(x, y, maxX, maxY);
      fill(138, 102, 34);
      rect(x, y+maxY*0.9, maxX, maxY-maxY*0.9);
      locationUpdate();
      stars();
      character();
      textSize(15);
      textAlign(CORNER);
      text("stars left: " + (20-points), x+20, y+20);
    } else {                                                         //end screen
      textAlign(CENTER);
      fill(235, 216, 52);
      rect(x, y, maxX, maxY);
      fill(0);
      textSize(35);
      text("Your score was: " + points, maxX/2+x, maxY/2+y);
      text("Well done!", maxX/2+x, maxY/2+y+30);
      textSize(20);
      text("Click to restart the game", maxX/2+x, maxY/2+y+60);
      textSize(15);
      textAlign(CORNER);
      text("highscore: " + highScore, x+20, y+20);
    }
  }

  void locationUpdate() {
    posY = int(posY + speedY);                            // Y location update
    speedY = speedY + a *dt;
    if (posY > y + maxY*0.95 - size*95) {
      speedY = 0;
      posY = int(y + maxY*0.95 - size*95);
    } else if (posY < y+size*85) {
      speedY = 0;
      posY = int(y+size*85);
    }
    posX = int(posX + speedX);                            // X location update
    if (speedX <0) {
      if (speedX + 2 > 0) {
        speedX = 0;
      }
      speedX = speedX + 2;
    } else if (speedX > 0) {
      if (speedX - 2 < 0) {
        speedX = 0;
      }
      speedX = speedX - 2;
    }
    if (posX > x + maxX - size*50) {
      speedX = 0;
      posX = int(x + maxX - size*50);
    } else if (posX < x+size*50) {
      speedX = 0;
      posX = int(x+size*50);
    }
    for (int i =0; i<amountOfStars; i++) {                          //check if hitting star
      if (posX+size*50 > starX[i] && posX-size*50 < starX[i]+70 && 
        posY+size*85 > starY[i] && posY-size*95 < starY[i]+70) {
        starY[i] = int(random(y+35, y+maxY*0.9-35));
        starX[i] = x+maxX-50;
        starSpeed[i] = int(random(6, 20));
        points++;
        if (points == 20) {
          gameState = 3;
          points = (millis() - startTime)/100;
          if (points < highScore || highScore == 0) {
            highScore = points;
          }
        }
      }
    }
  }

  void stars() {                                          //display all the stars
    for (int i =0; i<amountOfStars; i++) {
      image(star, starX[i], starY[i]);
      starX[i] = starX[i] - starSpeed[i];
      if (starX[i] < x) {
        starY[i] = int(random(y, y+maxY*0.9-35)); 
        starX[i] = x + maxX - 35;
        starSpeed[i] = int(random(3, 10));
      }
    }
  }

  void buttonPressed(int b) {                               //change the speed when button input
    if (b == UP) {
      speedY = speedY -15;
      if (speedY<-20) {
        speedY = -20;
      }
    } else if (b == DOWN) {
      speedY = speedY +15;
    } else if (b == LEFT) {
      speedX = speedX - 12;
    } else if (b == RIGHT) {
      speedX = speedX + 12;
    }
  }

  void character() {                                              //display the minion
    //hitbox
    //rect(posX-size*50, posY-size*85, size*100, size*180);
    noStroke();
    //body
    fill(col);
    ellipse(posX, posY-size*40, size*100, size*90);
    rectMode(CENTER);
    rect(posX, posY, size*100, size*60);
    //legs and pants
    fill(93, 132, 194);
    ellipse(posX, posY+size*30, size*100, size*30);
    rect(posX, posY+size*15, size*100, size*35);
    rectMode(CORNER);
    rect(posX-size*25, posY+size*30, size*15, size*60);
    rect(posX+size*10, posY+size*30, size*15, size*60);
    //feet
    fill(0);
    ellipse(posX-size*25, posY+size*90, size*30, size*10);
    ellipse(posX+size*10, posY+size*90, size*30, size*10);
    //glasses & eyes
    fill(0);
    ellipse(posX, posY-size*50, size*12, size*12);
    rect(posX-size*50, posY-size*55, size*100, size*15);
    fill(128, 128, 128);
    ellipse(posX, posY-size*50, size*50, size*50);
    fill(255, 248, 230);
    ellipse(posX, posY-size*50, size*38, size*38);
    fill(87, 67, 29);
    ellipse(posX, posY-size*50, size*17, size*17);
  }

  void clicked() {                                       //start the game when clicked on screen
    if (gameState != 2) {
      gameState = 2;
      startTime = millis();
      points = 0;
    }
  }
}
