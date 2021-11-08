class Pepernoten {
  int pepRad;
  color pepColor;
  float xPos;
  float yPos;
  float ySpeed;
  PImage gameover;

  Pepernoten() {
    pepRad = 40;
    pepColor = color(181, 101, 29);
    xPos = random(width);
    yPos = random(-9000, -50);
    ySpeed = 2;
    gameover = loadImage("gameover.png");
  }


  void display() { //draw the cookies
    fill(pepColor);
    circle(xPos, yPos, pepRad);
  }

  void fall() {

    yPos = yPos + ySpeed;

    if (dist(ghost.ghostX, height-320, xPos, yPos)<=30) {
      yPos = random(-9000, -50);
      counter.counterNumber++;
    }
  }


  void gameOver() { //if the cookies toutch the bottom of the screen the game is over
    if (yPos >= 1000) {
      image(gameover, width/2, height/2, 1000, 1000);
      fill(0, 255, 100);
      textSize(20);
      text("Cookie count:" + counter.counterNumber, width/2, height/2); //it will tell you how many cookies you ate once game was over
    }
  }
}
