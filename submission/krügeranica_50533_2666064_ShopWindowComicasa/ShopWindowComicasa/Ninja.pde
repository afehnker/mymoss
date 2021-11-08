/*
  The class Ninja is used for the main character of the Ninja-Poster
 The Ninja has different red tones and golden accessories
 If the user moves the mouse over the poster, the Ninja makes an attack move
 If the user clicks on the poster, the screen turns in the scene of the poster. 
 In the "game Mode," the user can see stars, a moon, and buildings in the background, which is realized through an object of the class PosterNinja
 If the user presses a or d, the Ninja moves from to the left or right if the user presses the space bar, the ninja jumps. 
 To start the start, the user has to press g. 
 After that, there are throwing stars displayed randomly, and one heart passes the screen. 
 If the Ninja dies, the game is over and can get restarted through pressing n. 
 If the user wants to go back to the main page, he has to press ENTER. 
 */

class Ninja {
  //position
  float xPosNinja;
  float yPosNinja;
  
  //speed of the jump
  float speed; 
  //gravity to jump down 
  float gravity;
  
  //lives of the Ninja
  int lives;

  //keeps track of the mouse actions
  boolean mouseClickedNinja;
  boolean mouseOverNinja;
  
  //if the game is playing 
  boolean isGamePlaying;
  
  //if the Ninja is still alive
  boolean isAlive;
  
  //if the Ninja jumped up
  boolean jumpStatus;

  //heart in the game
  Heart myHeart;
  
  //enemys in the game 
  ThrowingStar[] enemys;
  
  //background
  PosterNinja background;

  //constructor
  Ninja (float newXPos, float newYPos) {
    xPosNinja = newXPos;
    yPosNinja = newYPos;
    speed = 0;
    gravity = 0;
    lives = 3;  //start level of the lives is always 3
    myHeart = new Heart(random(0, width), height/2);
    background = new PosterNinja(int(xPosNinja), int(yPosNinja));
    enemys = new ThrowingStar[3];
    for (int i=0; i< enemys.length; i++)
    {
      enemys[i] = new ThrowingStar(random(0, 100), random(300, 600));
    }
    mouseClickedNinja = false;
    mouseOverNinja = false;
    isGamePlaying = false;
    isAlive = true;
    jumpStatus = false;
  }

  void display(boolean minionValue) {
    if (!mouseClickedNinja && !minionValue) {
      //Ninja in the poster -> rotation added
      pushMatrix();
      translate(1000, 650);
      rotate(radians(-20));
      background.display(mouseClickedNinja, lives, isAlive, isGamePlaying);
      drawWholeNinja();
      if (mouseOverNinja && !mouseClickedNinja) {
        //attack movement if the mouse if over the poster and if the user is still on the main page
        drawArmUpWithSword();
      } else {
        drawNormalArmWithSword();
      }
      popMatrix();
    } else if (!minionValue) {
      //Ninja scence of the whole screen
      background.display(mouseClickedNinja, lives, isAlive, isGamePlaying);
      drawWholeNinja();
      drawNormalArmWithSword();
      jump();
      if (isGamePlaying) {
        //display the enemys and the heart if the user starts the game
        for (int i=0; i<enemys.length; i++) {
          enemys[i].display();
          enemys[i].movement();
          checkCollisionWithThrowingStar(enemys[i]);
        }
        myHeart.display();
        checkCollisionWithHeart();
      }
    }
  }

  //keeps track if the user clicked on the poster
  void clickedNinja(int x, int y) {
    if (x>xPosNinja+900 && x<xPosNinja+1100 && y>xPosNinja+500 && y<xPosNinja+800 && !mouseClickedNinja) {
      mouseClickedNinja = true;
      xPosNinja = width/2;
      yPosNinja = 725;
    }
  }

  //keeps track if the user is with the mouse over the poster
  void hoverNinja(int x, int y) {
    if (x>xPosNinja+900 && x<xPosNinja+1100 && y>xPosNinja+500 && y<xPosNinja+800) {
      mouseOverNinja = true;
    } else {
      mouseOverNinja = false;
    }
  }

  /*
  deals with different key values
   if the key is d: the Ninja moves to the right 
   if the key is a: the Ninja moves to the left 
   if the key is g: the game starts
   if the key if n: the game restarts
   if the key if ENTER: 
   - the user gets back to the main page and the scence of the Ninja gets reset
   - the game stops playing
   - position of the Ninja gets back to the position of the poster 
   - enemys and heart get reset
   if the key is space: the Ninja jumps
   */
  void ninjaEventHandling(char keyValue) {
    if (keyValue == 'd' && mouseClickedNinja && xPosNinja<width) {
      xPosNinja = xPosNinja+10;
    } else if (keyValue == 'a' && mouseClickedNinja && xPosNinja>0) {
      xPosNinja = xPosNinja-10;
    } else if (keyValue == 'g' && lives == 3 && mouseClickedNinja) {
      isGamePlaying = true;
    } else if (keyValue == 'n' && lives == 0 && mouseClickedNinja) {
      isGamePlaying = true; 
      isAlive = true;
      for (int i=0; i<enemys.length; i++) {
        enemys[i].reset();
      }
      myHeart.reset();
      lives = 3;
    } else if (key == ENTER) {
      isGamePlaying = false;
      isAlive = true;
      lives = 3;
      mouseClickedNinja = false;
      xPosNinja = 0;
      yPosNinja = 0;
      for (int i=0; i<enemys.length; i++) {
        enemys[i].reset();
      }
      myHeart.reset();
    } else if (keyValue == ' ') {
      jumpStatus = true;
    }
  }


  void jump() {
    if (yPosNinja == 725) {
      if (jumpStatus) {
        speed = -12;
        gravity = 0.3;
        jumpStatus = false;
      }
    }
    yPosNinja += speed;
    speed += gravity;
    if (yPosNinja > 725) {
      yPosNinja = 725; 
      speed = 0; 
      gravity = 0;
    }
  }

  /*
  checks if the throwing star is too close to the Ninja and if this is the case one live gets subtracted 
   if the ninja has no more lives the game stops playing 
   if the throwing star is not close enough nothing changes
   */
  void checkCollisionWithThrowingStar(ThrowingStar enemy) {
    if (enemy.xPosThrowingStar>xPosNinja-50 && enemy.xPosThrowingStar < xPosNinja+50 && enemy.yPosThrowingStar>yPosNinja-120 && enemy.yPosThrowingStar<yPosNinja+80) {
      enemy.setExist(false);
      if (isGamePlaying) {
        lives = lives-1;
        if (lives == 0) {
          isGamePlaying = false;
          isAlive = false;
        }
      }
    } else {
      enemy.setExist(true);
    }
  }

  /*
  checks if the heart is close enough to the Ninja and if this is the case one live gets added
   if the heart is not close enough nothing changes
   */
  void checkCollisionWithHeart() {
    if (myHeart.xPosHeart>xPosNinja-50 && myHeart.xPosHeart < xPosNinja+50 && myHeart.yPosHeart>yPosNinja-120 && myHeart.yPosHeart<yPosNinja+80) {
      myHeart.setExist(false); 
      if (isGamePlaying) {
        if (lives<5) {
          lives = lives+1;
        }
      }
    } else {
      myHeart.setExist(true);
    }
  }




  //Ninja

  void drawWholeNinja() {
    drawLegs();
    drawLeftArmAndHand();
    drawHead();
    drawBody();
    drawFace();
  }

  void drawLegs() {
    //Legs
    fill(146, 40, 40);
    noStroke();
    rect(xPosNinja-20, yPosNinja+75, 30, 10);
    rect(xPosNinja+20, yPosNinja+75, 30, 10);
    fill(100, 19, 19);
    rect(xPosNinja-20, yPosNinja+45, 30, 50);
    rect(xPosNinja+20, yPosNinja+45, 30, 50);
    //knees
    fill(218, 165, 32);
    rect(xPosNinja-20, yPosNinja+50, 30, 5);
    rect(xPosNinja+20, yPosNinja+50, 30, 5);
    quad(xPosNinja-20, yPosNinja+40, xPosNinja-5, yPosNinja+50, xPosNinja-20, yPosNinja+60, xPosNinja-35, yPosNinja+50);
    quad(xPosNinja+20, yPosNinja+40, xPosNinja+35, yPosNinja+50, xPosNinja+20, yPosNinja+60, xPosNinja+5, yPosNinja+50);
  }

  void drawLeftArmAndHand() {
    //left hand
    fill(229, 197, 173);
    pushMatrix();
    translate(xPosNinja-55, yPosNinja+15);
    rotate(radians(100));
    rect(0, 0, 15, 10);
    popMatrix();
    circle(xPosNinja-56, yPosNinja+24, 12);
    //Left arm
    fill(146, 40, 40);
    pushMatrix();
    translate(xPosNinja-42, yPosNinja-40);
    rotate(radians(-75));
    ellipse(0, 0, 60, 20);
    popMatrix();
    pushMatrix();
    translate(xPosNinja-49, yPosNinja-15);
    rotate(radians(105));
    ellipse(0, 0, 60, 20);
    popMatrix();
    pushMatrix();
    translate(xPosNinja-55, yPosNinja+10);
    rotate(radians(100));
    rect(0, 0, 10, 15);
    popMatrix();
  }
  void drawHead() {
    //head
    fill(78, 4, 4);
    rect(xPosNinja, yPosNinja-72, 35, 5);
    ellipse(xPosNinja+20, yPosNinja-90, 15, 33);
    ellipse(xPosNinja-20, yPosNinja-90, 15, 33);
    ellipse(xPosNinja, yPosNinja-105, 45, 15);
    rect(xPosNinja, yPosNinja-90, 40, 35);
  }

  void drawBody() {
    //body
    fill(100, 19, 19);
    quad(xPosNinja-35, yPosNinja+20, xPosNinja+35, yPosNinja+20, xPosNinja+30, yPosNinja-70, xPosNinja-30, yPosNinja-70);
    //belt
    fill(146, 40, 40);
    rect(xPosNinja, yPosNinja+15, 70, 10);
    //band
    fill(218, 165, 32);
    triangle(xPosNinja+30, yPosNinja-70, xPosNinja+17, yPosNinja-70, xPosNinja+30, yPosNinja-60);
    triangle(xPosNinja-35, yPosNinja+10, xPosNinja-35, yPosNinja, xPosNinja-22, yPosNinja+10);
    quad(xPosNinja+17, yPosNinja-70, xPosNinja+30, yPosNinja-61, xPosNinja-22, yPosNinja+11, xPosNinja-35, yPosNinja);
  }

  void drawFace() {
    //face
    fill(78, 4, 4);
    quad(xPosNinja-27, yPosNinja-85, xPosNinja+24, yPosNinja-85, xPosNinja+5, yPosNinja-47, xPosNinja, yPosNinja-50);
    fill(229, 197, 173);
    rect(xPosNinja, yPosNinja-95, 25, 10);
    //eyes
    fill(0, 0, 0);
    ellipse(xPosNinja-7, yPosNinja-94, 4, 4);
    ellipse(xPosNinja+7, yPosNinja-94, 4, 4);
    //eyebrows
    pushMatrix();
    translate(xPosNinja-7, yPosNinja-98);
    rotate(radians(10));
    rect(0, 0, 7, 2);
    popMatrix();
    pushMatrix();
    translate(xPosNinja+7, yPosNinja-98);
    rotate(radians(-10));
    rect(0, 0, 7, 2);
    popMatrix();
  }

  void drawNormalArmWithSword() {
    //right arm
    fill(146, 40, 40);
    pushMatrix();
    translate(xPosNinja+45, yPosNinja-48);
    rotate(radians(50));
    ellipse(0, 0, 50, 20);
    popMatrix();
    //sword
    fill(0, 0, 0);
    pushMatrix();
    translate(xPosNinja+32, yPosNinja+20);
    rotate(radians(-50));
    rect(0, 0, 8, 30);
    popMatrix();
    fill(209, 208, 208);
    pushMatrix();
    translate(xPosNinja-14, yPosNinja-19);
    rotate(radians(-50));
    rect(0, 0, 6, 90);
    popMatrix();
    triangle(xPosNinja-43, yPosNinja-48, xPosNinja-50, yPosNinja-45, xPosNinja-56, yPosNinja-57);
    //right hand
    fill(229, 197, 173);
    pushMatrix();
    translate(xPosNinja+35, yPosNinja+15);
    rotate(radians(-50));
    rect(0, 0, 15, 10);
    popMatrix();
    circle(xPosNinja+32, yPosNinja+20, 13);
    //right underarm
    fill(146, 40, 40);
    pushMatrix();
    translate(xPosNinja+51, yPosNinja-11);
    rotate(radians(-63));
    ellipse(0, 0, 50, 20);
    popMatrix();
    pushMatrix();
    translate(xPosNinja+40, yPosNinja+7);
    rotate(radians(-58));
    rect(0, 0, 15, 15);
    popMatrix();
  }

  void drawArmUpWithSword() {
    //sword
    fill(209, 208, 208);
    pushMatrix();
    translate(xPosNinja-14, yPosNinja-138);
    rotate(radians(100));
    rect(0, 0, 6, 90);
    popMatrix();
    triangle(xPosNinja-70, yPosNinja-150, xPosNinja-54, yPosNinja-148, xPosNinja-56, yPosNinja-142);
    fill(0, 0, 0);
    pushMatrix();
    translate(xPosNinja+28, yPosNinja-130);
    rotate(radians(100));
    rect(0, 0, 8, 30);
    popMatrix();
    //right hand
    fill(229, 197, 173);
    pushMatrix();
    translate(xPosNinja+35, yPosNinja-125);
    rotate(radians(50));
    rect(0, 0, 15, 10);
    popMatrix();
    circle(xPosNinja+28, yPosNinja-132, 13);
    //right arm
    fill(146, 40, 40);
    pushMatrix();
    translate(xPosNinja+45, yPosNinja-68);
    rotate(radians(-50));
    ellipse(0, 0, 50, 20);
    popMatrix();
    //right underarm
    fill(146, 40, 40);
    pushMatrix();
    translate(xPosNinja+51, yPosNinja-101);
    rotate(radians(63));
    ellipse(0, 0, 50, 20);
    popMatrix();
    pushMatrix();
    translate(xPosNinja+40, yPosNinja-120);
    rotate(radians(50));
    rect(0, 0, 15, 15);
    popMatrix();
  }
  
  boolean getIsGamePlaying() {
    return isGamePlaying;
  }
}
