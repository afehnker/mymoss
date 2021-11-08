//Welcome to the class game! In here, most of the aspects of the game are displayed. 

class Game {
  float lock;
  float xLock;
  float yLock;
  float yGate;
  float speed;
  boolean lockPressed; 
  boolean TimeUp;
  boolean StartTimer;
  boolean gameOver = false;
  int t;

  Game() {
    yGate = height * 0.9;
    lock = 40;
    xLock = width/2 - 30;
    yLock = height/2 + 120;
    lockPressed = false;
    TimeUp = false;
    StartTimer = false;
  }

  //The security gate was made by using a for-loop.
  void gate() {
    for (int i = 0; i < 2*width; i+=60) {
      strokeWeight(4);
      stroke(160);
      line(i + 4, yGate-height, i + 4, yGate);
      line(-height +i- height/100 + 4, yGate, i- height/100 + 4, (yGate-height)); 
      line(i- height/100 + 4, yGate, -height + i- height/100 + 4, (yGate-height));
      stroke(80);
      line(i, yGate-height, i, yGate);
      line(-height +i- height/100, yGate, i- height/100, (yGate-height)); 
      line(i- height/100, yGate, -height + i- height/100, (yGate-height)); 
      line(0, yGate, width, yGate);

      //This code creates the lock. 
      stroke(#D3D3D3);
      noFill();
      strokeWeight(8);
      arc(xLock, yLock - lock/2, lock/1.3, lock, PI, 2*PI);
      strokeWeight(4);
      stroke(0);
      arc(xLock, yLock - lock/2, lock*0.9, lock*1.1, PI, 2*PI);
      arc(xLock, yLock - lock/2, lock*0.5, lock*0.7, PI, 2*PI);
      strokeWeight(4);
      fill(#D3D3D3);
      rectMode(CENTER);
      rect(xLock, yLock, lock*1.2, lock, lock/6);
      rectMode(CORNER);
    }
  }

//This part will make the lock fall down.
  void update() {
    if (lockPressed) {
      yLock = yLock + speed;
      speed = speed + 9.81;
      if (yLock > height + 100 && yGate >= height/3.4 && TimeUp == false) { //This part will make the gate go up when the lock has fallen. 
        yGate = yGate - 5;
        if (yGate <= height/3.4) { //When the gate is at it's highes, the timer starts!
          StartTimer = true;
        }
      } else if (TimeUp == true) { //If the time is up...

        if (yGate<0.9*height) { //... and the gate is still not completely down...
          yGate = yGate + 15; //...the gate goes down.
        } else {
          shop.fail(); //Otherwise we check if the player has failed. 
        }
      }
    }
  }

  void openLock(float initX, float initY) { //This checks whether the conditions for clicking the lock are true. 
    if ((initX <= xLock + 1.2*lock/2 && initX >= xLock - 1.2*lock/2) && (initY <= yLock + lock && initY >= yLock - lock)) {
      lockPressed = true; //When so, we set the boolean lockPressed to true.
    }
  }
  void timer() {
    if (StartTimer && gameOver == false) { //When the timer is allowed to start and the game is over, the timer starts.
      shop.eataway();
      rectMode(CORNER);
      noStroke();
      fill(230, 0, 0);
      rect(0, height-69, t, height); 
      t = t + width/100; //This makes the red bar move.
      if (t == width) { //When the bar is full...
        TimeUp = true; //...the time is up...
        t = width; //...and the bar stops growing.
      }
    }
  }
}
