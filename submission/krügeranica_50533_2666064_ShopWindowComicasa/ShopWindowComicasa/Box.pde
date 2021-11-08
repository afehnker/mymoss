/*
The purpose of this class is displaying the box, letting the box fall
 and add points to the score when the box falls of the screen
 */



class Box {

  //Box width and color
  float boxWidth;
  color boxColor;
  
  //Minion color change
  color minionColor;

  //The coordinate of the conveyorbelt
  float groundY = 475;

  //The coordinates of the box
  float xBox = 1250;
  float yBox;
  float yBoxMain = -30;
  float yBoxGround = groundY - boxWidth;

  //Speeds of the box
  float xBoxSpeed = -5;
  float yBoxSpeed;
  float factor = 1;

  //The counter
  int counter = 0;

  //Boolean for if the box falls
  boolean fall = false;


  Box(float x, color y) {
    boxWidth = x;
    boxColor = y;
  }

  void display() {
    //If the game started display the box
    if (minion.start == true) {
      fill(boxColor);
      stroke(0);
      rect(xBox, yBox, boxWidth, boxWidth);
    }
  }


  void boxFall(boolean gameOver) {
    //If the game started and is not over, let the box fall on the conveyorbelt
    if (minion.start == true && gameOver == false) {
      if (xBox == 1250) {
        yBoxSpeed = 10 * factor;
        yBox += yBoxSpeed;
      }
      //If the box is on the conveyorbelt, stop falling and start moving left
      if (fall == false) {
        if (yBox >= yBoxGround) {
          yBox = yBoxGround;
          yBoxSpeed = 0;
          xBox += xBoxSpeed;
        }
      }
      //If the box is below the screen, set it back to starting point and add 1 to score
      if (yBox > 1200) {
        counter++;
        xBox = 1250;
        yBox = yBoxMain;        
        fall = false;
        //Every 3 points increase the speed of the box
        if (counter%3 == 0) {
          xBoxSpeed = xBoxSpeed * 1.2;
          factor += 0.3;
        }
      }
      //If the box is off the conveyorbelt let it fall again
      if (xBox < 580) {
        fall = true;
        yBoxSpeed = 10 * factor;
        yBox += yBoxSpeed;
        xBox += xBoxSpeed;
      }
      //If the game is over display the box offscreen
    } else if (minion.overlap) {
      xBox = width;
      xBoxSpeed = 0;
    }
  }


  void score() {
    //Display the score if the game starts
    if (minion.start == true) {
      textSize(20);
      fill(255);
      text("Score: "+ counter, 1400, 20);
    }
  }
}
