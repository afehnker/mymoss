/*
The purpose of this class is displaying the minion in its different states
 -Display the minion on the poster when not hovering on the poster
 -Display the minion on the poster when hovering on the poster
 -Display the minion in the game
 -Let the minion jump in the game
 -Let the minion collide with the box in the game
 */

class Minion {

  //X and y positions
  float xPosMinion;
  float yPosMinion;
  float xMainPos;
  float yMainPos;

  //All the colors used
  color yellow = color(255, 255, 31);
  color gray = color(199, 199, 199);
  color strap = color(117, 77, 77);
  color eye = color(132, 60, 28);
  color clothes = color(71, 107, 141);
  color shoes = color(50, 46, 43);

  //Mouse positions
  float xCursor;
  float yCursor;

  //Booleans
  boolean hoverOnPoster = false;
  boolean start = false;
  boolean overlap = false;
  boolean gameOver = false;
  boolean jump = false;

  //Widths
  float screenWidth = 1200;
  float playerWidth = 40;
  float enemyWidth = 30;

  //Ground of the minion
  float groundY = 510;

  //X and y position for the minion in the game
  float playerX = (screenWidth/2) + 400;
  float playerY = groundY - playerWidth;

  //Variables for jumping
  float yVelocity = 0;
  float gravity = 0.5;

  //Initializing the box and the minionposter
  Box box;
  PosterMinion posterMinion;


  Minion(float x, float y) {
    xPosMinion = x;
    yPosMinion = y;
    xMainPos = x;
    yMainPos = y;

    posterMinion = new PosterMinion(0, 0);
    box = new Box(30, color(160, 82, 45));
  }

  void display() {

    //Display background and box

    if (start == true) {
      if (gameOver == false) {
        posterMinion.displayBackground();
        box.display();
        box.boxFall(gameOver);
      }


      //Display minion ingame
      if (gameOver == true) {
        //GameOverScreen
        background(0);
        textSize(150);
        fill(255);
        text("Game Over", (screenWidth/2)-200, 450);
      } else if (gameOver == false) {    
        //Player minion
        //Face Body
        stroke(yellow);
        fill(yellow);
        rect(playerX, playerY-25, playerWidth, playerWidth);
        circle(playerX, playerY - 45, playerWidth);

        //Hair
        fill(0);
        stroke(0);
        line(playerX, playerY-65, playerX, playerY-70);


        //Clothes
        fill(clothes);
        stroke(clothes);
        rect(playerX, playerY-10, playerWidth, playerWidth/2);
        rect(playerX-15, playerY-18, playerWidth/4, playerWidth/2);
        rect(playerX+15, playerY-18, playerWidth/4, playerWidth/2);

        //Leg
        rect(playerX, playerY, playerWidth/2, playerWidth);

        //Arm
        fill(yellow);
        stroke(yellow);
        rect(playerX, playerY-20, 10, 20);

        //Pants Band
        fill(clothes);
        stroke(clothes);
        rect(playerX, playerY-25, playerWidth, playerWidth/7);

        //Strap Glasses
        fill(strap);
        stroke(strap);
        rect(playerX, playerY-45, playerWidth, playerWidth/6);

        //Glasses
        fill(gray);
        stroke(gray);
        rect(playerX+20, playerY-45, playerWidth/4, playerWidth/3);
      }
      //Display score and instructions
      box.score();
      textSize(20);
      fill(255);
      text("Press SPACE to jump", 1280, 40);
      //If the counter 20 or above the minion "rages",
      //and if the counter is reset, the minion is yellow again.
      if (box.counter >= 20) {
        yellow = color(169, 6, 201);
      } else if (box.counter == 0) {
        yellow = color(255, 255, 31);
      }
    }
    pushMatrix();
    translate(250, 250);
    rotate(radians(20));
    pushMatrix();
    translate(0, -50);

    //Display minion on poster
    if (start == false) {
      posterMinion.displayPoster();
      if (hoverOnPoster == false) {

        //Minion static
        //Body
        fill(yellow);
        arc(xPosMinion, yPosMinion+200, 150, 150, PI, TWO_PI);

        //Hair
        fill(0);
        stroke(0);
        line(xPosMinion+30, yPosMinion+110, xPosMinion+20, yPosMinion+130);
        line(xPosMinion-30, yPosMinion+110, xPosMinion-20, yPosMinion+130);
        line(xPosMinion, yPosMinion+110, xPosMinion, yPosMinion+130);

        //Glasses strap
        noStroke();
        fill(strap);
        rect(xPosMinion, yPosMinion+195, 150, 10);

        //Eye
        fill(gray);
        arc(xPosMinion, yPosMinion+200, 80, 80, PI, TWO_PI);
        fill(255);
        arc(xPosMinion, yPosMinion+200, 60, 60, PI, TWO_PI);
        fill(eye);
        arc(xPosMinion, yPosMinion+200, 30, 30, PI, TWO_PI);
        fill(0);
        arc(xPosMinion, yPosMinion+200, 15, 15, PI, TWO_PI);
        fill(255);
        circle(xPosMinion-8, yPosMinion+195, 8);
        stroke(0);
      } else {

        //Minion Jump up
        //Body
        fill(yellow);
        circle(xPosMinion, yPosMinion, 150);
        rect(xPosMinion-75, yPosMinion+100, 50, 20);
        rect(xPosMinion+75, yPosMinion+100, 50, 20);
        rect(xPosMinion, yPosMinion+80, 150, 150);

        //Hair
        fill(0);
        stroke(0);
        line(xPosMinion+20, yPosMinion-70, xPosMinion+30, yPosMinion-90);
        line(xPosMinion-20, yPosMinion-70, xPosMinion-30, yPosMinion-90);
        line(xPosMinion, yPosMinion-70, xPosMinion, yPosMinion-90);

        //Mouth
        fill(0);
        stroke(0);
        arc(xPosMinion, yPosMinion+43, 78, 52, 0, PI);
        noStroke();
        fill(255);
        arc(xPosMinion, yPosMinion+45, 15, 10, 0, PI);
        arc(xPosMinion+15, yPosMinion+45, 15, 10, 0, PI);
        arc(xPosMinion-15, yPosMinion+45, 15, 10, 0, PI);
        arc(xPosMinion+30, yPosMinion+45, 15, 10, 0, PI);
        arc(xPosMinion-30, yPosMinion+45, 15, 10, 0, PI);

        //Clothing
        fill(clothes);
        rect(xPosMinion, yPosMinion+120, 130, 90);
        rect(xPosMinion, yPosMinion+140, 150, 30);
        ellipse(xPosMinion, yPosMinion+155, 150, 60);

        stroke(0);
        noFill();
        arc(xPosMinion, yPosMinion+100, 60, 70, 0, PI, CHORD);
        fill(clothes);
        noStroke();

        pushMatrix();
        translate(xPosMinion, yPosMinion);
        rotate(radians(30));
        rect(0-10, 0+100, 40, 20);
        popMatrix();

        pushMatrix();
        translate(xPosMinion, yPosMinion);
        rotate(radians(330));
        rect(0+10, 0+100, 40, 20);
        popMatrix();

        ellipse(xPosMinion-40, yPosMinion+158, 50, 80);
        ellipse(xPosMinion+40, yPosMinion+158, 50, 80);

        //Shoes
        fill(shoes);
        arc(xPosMinion-40, yPosMinion+200, 40, 30, PI, TWO_PI);
        arc(xPosMinion+40, yPosMinion+200, 40, 30, PI, TWO_PI);

        //Glasses strap
        fill(strap);
        rect(xPosMinion, yPosMinion, 150, 20);

        //Eye
        fill(gray);
        circle(xPosMinion, yPosMinion, 80);
        fill(255);
        circle(xPosMinion, yPosMinion, 60);
        fill(eye);
        circle(xPosMinion, yPosMinion, 30);
        fill(0);
        circle(xPosMinion, yPosMinion, 15);
        fill(255);
        circle(xPosMinion-8, yPosMinion-5, 8);
        stroke(0);
      }
    }

    popMatrix();
    popMatrix();
  }

  //Check for mouse position on poster
  void hover(float x, float y) {
    xCursor = x;
    yCursor = y;
    if (xCursor < xMainPos + 250 + 100 && xCursor > xMainPos + 250 - 100 && yCursor < yMainPos + 250 + 150 && yCursor > yMainPos + 250 - 150) {
      hoverOnPoster = true;
    } else {
      hoverOnPoster = false;
    }
  }

  //Checks for mouse clicking on poster
  void clickOnPoster(float x, float y, boolean ninjaValue) {
    xCursor = x;
    yCursor = y;
    //If the mouse is inside of the poster when clicking start the game
    if (!ninjaValue) {
      if (xCursor < xPosMinion+ 250 + 100 && xCursor > xPosMinion + 250 - 100 && yCursor < yPosMinion + 250 + 150 && yCursor > yPosMinion + 250 - 150) {
        start = true;
      }
    }
  }

  //Go back to main screen from the game
  void goBack(boolean pressed) {
    if (pressed == true) {
      start = false;
      gameOver = false;
    }
  }

  //Lets the minion jump
  void jump() {
    if (start == true) {
      if (gameOver == false) {
        //If the spacebar is pressed, jump.
        //Set a negative speed and add a plus value (gravity).
        //After this set the jump back to false.
        if (jump == true) {
          yVelocity = -10;
          gravity = 0.5;
          jump = false;
        }
        //Add the velocity to the player and add the gravity to the velocity
        playerY += yVelocity;
        yVelocity += gravity;
        //If the player is on the ground set the negative speed and the gravity back to zero
        if (playerY > groundY - playerWidth) {
          playerY = groundY - playerWidth;
          yVelocity = 0;
          gravity = 0;
        }
      }
    }
  }

  //Checks for collision between the minion and boc
  void collide() {
    if (start == true) {
      if (gameOver == false) {
        //If the player touches the box set boolean true
        if (dist(playerX, playerY, box.xBox, box.yBox) < 40) {
          overlap = true;
        }
        //If overlap, the game is over
        if (overlap == true) {
          gameOver = true;
          box.counter = 0;
        }
      }
    }
  }

  //Checks if player is on ground
  void jumpCheck(boolean update) {
    if (start == true) {
      if (gameOver == false) {
        if (playerY == groundY - playerWidth) {          
          jump = update;
        }
      }
    }
  }

  boolean getStart() {
    return start;
  }
}
