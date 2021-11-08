class Penalty {
  String message;

  //Variables for left pole
  float leftpoleX1 = 190;
  float leftpoleX2 = 205;
  float leftpoleYbottom = 200;
  float leftpoleYtop = 8;

  //Variables for right pole
  float rightpoleX1 = 595;
  float rightpoleX2 = 610;
  float rightpoleYbottom = 200;
  float rightpoleYtop = 8;

  //Variables for crossbar
  float crossbarYtop = 8;
  float crossbarYbottom = 16;

  //Variables for the direction and speed of the ball
  float accuracy;
  float speed;

  // Check if ball hits a pole, then shot is saved and you get a new chance
  boolean isPoleHit() {
    boolean isHit = (ballX<leftpoleX2 && ballX>leftpoleX1 && ballY<leftpoleYbottom && ballY>leftpoleYtop) || (ballX<rightpoleX2 && ballX>rightpoleX1 && ballY<rightpoleYbottom && ballY>rightpoleYtop) || (ballX<rightpoleX2 && ballX>leftpoleX1 && ballY<crossbarYbottom && ballY>crossbarYtop);

    if (isHit) System.out.println("isHit? = " + isHit);
    return isHit;
  }

  // Check if ball hits keeper, then ball got saved
  boolean isKeeperSave() {
    boolean isSave = (ballX<handX2 && ballX>handX1 && ballY<handBottom && ballY>handTop) || (ballX<bodyX2 && ballX>bodyX1 && ballY<bodyBottom && ballY>bodyTop);
    if (isSave) System.out.println("isSave? = " + isSave);
    return isSave;
  }

  // Check if ball not in goal, say miss
  boolean isGoalMiss() {
    return ballX>650 || ballX<150 && ballY<0;
  }

  // Check if ball in goal, reset and score
  boolean isGoal() {
    return ballX<595 && ballX>205 && ballY<130 && ballY>16;
  }

  boolean kick = false;
  boolean stop = false;

  void startGame() { //Used to start the loop to start the game
    kick = true;
    stop = false;
    message = "";
    loop();
  }  

  void resetGame(String msg) {  //Used to reset the game when the ball reachted his end destination
    kick = false;
    stop = true;
    message = msg;
    ball = new Ball(400, 595);
    xKeeper=400;
    xShoe = 300;
    yShoe = 695;
  }

  void showMessage() { //Used to show the message of what happens when the ball reached his end destination
    textSize(50);
    fill(255);
    text(message, 300, 300);
  }

  void shot() { //The entire thing used to shoot the ball
    if (stop == true) {
      System.out.println("STOP");
      showMessage();
      noLoop();
    } 

    if (kick == true) {
      if (xShoe!=400 && yShoe!=595) { //If the shoe doesn't hit the ball it will move to the ball
        xShoe+=5;
        yShoe-=5;
        accuracy=random(-5, 5);
        speed=random(5, 25);
      } else if (xShoe<=ballX || yShoe>=ballY) { // else if so the ball only moves when the ball is hit by the shoe
        ballX+=accuracy;
        ballY-=speed;
      }
      if (ballX >=200 && ballX <= 600 && ballY <= 130) { //To make the keeper move
        if (xMovement >= 0 && xMovement <= 9) {
          xMovement+=1;
        }
        if (xMovement<0 && xMovement>=-9) {
          xMovement-=1;
        }
      }

      if (isPoleHit() ) { //Here we add text files to show what happens with the ball and to update the scoreboard
        resetGame("oh no!you hit a pole!");
        scoreboard.addSave();
      } else if (isKeeperSave()) {
        resetGame("Saved!");
        scoreboard.addSave();
      } else if (isGoalMiss()) {
        resetGame("Whoops, missed!");
        scoreboard.addMiss();
      } else if (isGoal()) {
        resetGame("GOOOOAAAALLLLL");
        scoreboard.addScore();
      }
    }
  }
}
