//Welcome to the biggest class: class Tim. There is a lot of code for this little mouse. 

class Tim {
  float xTim;
  float yTim;
  float radius;
  float ySpeed;
  float xSpeed;
  float jump;
  float resist;
  float acceleration;
  Block ground;
  Block cheese1;
  Block cheeseStand1;
  Block cheeseStand2;
  Block table1;
  Block cupboardPlank1;
  Block cupboardPlank2;
  Block cupboardCheese;
  Game timer;
  boolean controlPressed;
  boolean IsOnBlock;
  boolean isEaten1 = false;
  boolean isEaten2 = false;
  boolean isEaten3 = false;
  boolean youMayEat = false;
  boolean lost = false;
  boolean won = false;


  Tim() {
    xTim = 0.6*width;
    yTim = 0.8*height;
    radius = 25;
    xSpeed = 10;
    ySpeed = 0;
    jump = 16;
    resist = 0.8;
    acceleration = .981;
    ground = new Block();
    cheese1 = new Block();
    cheeseStand1 = new Block();
    cheeseStand2 = new Block();
    table1 = new Block();
    cupboardPlank1 = new Block();
    cupboardPlank2 = new Block();
    cupboardCheese = new Block();
    timer = new Game();
    controlPressed = false;
    IsOnBlock = false;
  }

//this part of the code checks if Tim is on a block. 
  void update() {
    ySpeed = ySpeed + acceleration;
    IsOnBlock = false;
    yTim = yTim + ySpeed;
    if (ySpeed >= 0) { //the first thing it does is check whether Tim is falling down, so that he doesn't "fall up" on the block.
      if (yTim > ground.yBlock - ground.yThickness -radius && (yTim< ground.yBlock) && xTim >= ground.xBlock - ground.xThickness/2 && xTim <= ground.xBlock + ground.xThickness/2) {
        yTim = ground.yBlock - ground.yThickness - radius;
        IsOnBlock = true;
        ySpeed = 0;
      }
      if (yTim > cheese1.yBlock - cheese1.yThickness -radius  && (yTim < cheese1.yBlock) && xTim >= cheese1.xBlock - cheese1.xThickness/2 && xTim <= cheese1.xBlock + cheese1.xThickness/2) {
        yTim = cheese1.yBlock - cheese1.yThickness/2 - radius;
        IsOnBlock = true;
        ySpeed = 0;
      }
      if (yTim > cheeseStand1.yBlock - cheeseStand1.yThickness -radius  && (yTim < cheeseStand1.yBlock) && xTim >= cheeseStand1.xBlock - cheeseStand1.xThickness/2 && xTim <= cheeseStand1.xBlock + cheeseStand1.xThickness/2) {
        yTim = cheeseStand1.yBlock - cheeseStand1.yThickness/2 - radius;
        IsOnBlock = true;
        ySpeed = 0;
      }
      if (yTim > cheeseStand2.yBlock - cheeseStand2.yThickness -radius  && (yTim < cheeseStand2.yBlock) && xTim >= cheeseStand2.xBlock - cheeseStand2.xThickness/2 && xTim <= cheeseStand2.xBlock + cheeseStand2.xThickness/2) {
        yTim = cheeseStand2.yBlock - cheeseStand2.yThickness/2 - radius;
        IsOnBlock = true;
        ySpeed = 0;
      }
      if (yTim > table1.yBlock - table1.yThickness -radius  && (yTim < table1.yBlock) && xTim >= table1.xBlock - table1.xThickness/2 && xTim <= table1.xBlock + table1.xThickness/2) {
        yTim = table1.yBlock - table1.yThickness/2 - radius;
        IsOnBlock = true;
        ySpeed = 0;
      }
      if (yTim > cupboardPlank1.yBlock - cupboardPlank1.yThickness -radius  && (yTim < cupboardPlank1.yBlock) && xTim >= cupboardPlank1.xBlock - cupboardPlank1.xThickness/2 && xTim <= cupboardPlank1.xBlock + cupboardPlank1.xThickness/2) {
        yTim = cupboardPlank1.yBlock - cupboardPlank1.yThickness/2 - radius;
        IsOnBlock = true;
        ySpeed = 0;
      }
      if (yTim > cupboardPlank2.yBlock - cupboardPlank2.yThickness -radius  && (yTim < cupboardPlank2.yBlock) && xTim >= cupboardPlank2.xBlock - cupboardPlank2.xThickness/2 && xTim <= cupboardPlank2.xBlock + cupboardPlank2.xThickness/2) {
        yTim = cupboardPlank2.yBlock - cupboardPlank2.yThickness/2 - radius;
        IsOnBlock = true;
        ySpeed = 0;
      }
      if (yTim > cupboardCheese.yBlock - cupboardCheese.yThickness -radius  && (yTim < cupboardCheese.yBlock) && xTim >= cupboardCheese.xBlock - cupboardCheese.xThickness/2 && xTim <= cupboardCheese.xBlock + cupboardCheese.xThickness/2) {
        yTim = cupboardCheese.yBlock - cupboardCheese.yThickness/2 - radius;
        IsOnBlock = true;
        ySpeed = 0;
      }
    }
  }

//Tim is a free mouse! So he is able to move. However, this is only allowed if the game is not over yet. 
  void move() {
    if (controlPressed && keyPressed) {
      if (keyCode == RIGHT && xTim<width && timer.gameOver == false) {
        xTim = xTim + xSpeed;
      } else if (keyCode == LEFT && xTim>0 && timer.gameOver == false) {
        xTim = xTim - xSpeed;
      } else if (keyCode == UP && (IsOnBlock == true) && ySpeed == 0 && timer.gameOver == false) {
        acceleration = 0.981;
        ySpeed = -jump;
        ySpeed = ySpeed + acceleration;
        yTim = yTim + ySpeed;
      }
    }
  }

//Of course Tim needs a body. This is all made from the middle point of his body.
  void timDisplay() {
    stroke(0);
    strokeWeight(4);
    fill(200, 200, 200);
    circle(xTim-0.8*radius, yTim-1.2*radius, radius);
    circle(xTim+0.8*radius, yTim-1.2*radius, radius);
    fill(#FFCBEA);
    noStroke();
    circle(xTim-0.7*radius, yTim-1.1*radius, 0.5*radius);
    circle(xTim+0.7*radius, yTim-1.1*radius, 0.5*radius);
    fill(200, 200, 200);
    strokeWeight(4);
    stroke(3);
    circle(xTim, yTim - 0.2*radius, radius*2);
    circle(xTim, yTim, radius/5);
    strokeWeight(1);
    line(xTim-0.5*radius, yTim, xTim+0.5*radius, yTim);
    line(xTim-0.3*radius, yTim-0.2*radius, xTim+0.3*radius, yTim+0.2*radius);
    line(xTim-0.3*radius, yTim+0.2*radius, xTim+0.3*radius, yTim-0.2*radius);
    strokeWeight(4);
    ellipse(xTim-0.5*radius, yTim+radius - 0.15*radius, radius, 0.3*radius);
    ellipse(xTim+0.5*radius, yTim+radius - 0.15*radius, radius, 0.3*radius);
    stroke(255);
    fill(0);
    circle(xTim-0.3*radius, yTim - 0.4*radius, 10);
    circle(xTim+0.3*radius, yTim - 0.4*radius, 10);
  }

//Here we see all the blocks. 
  void blockDisplay() {
    ground.ground();
    cheese1.cheese1();
    cheeseStand1.cheeseStand1();
    cheeseStand2.cheeseStand2();
    table1.table1();
    cupboardPlank1.cupboardPlank1();
    cupboardPlank2.cupboardPlank2();
    cupboardCheese.cupboardCheese();
  }

//These check if Tim is being healty and eats his cheeses. 
  void eat1() { 
    float xBit1 = width/2;
    float yBit1 = 540;
    float xWidth = 40;
    float yHeight = 30;

    if (isEaten1 == false) {
      fill(#fada00);
      stroke(#ffc400);
      rect(xBit1, yBit1, xWidth, yHeight);
      circle(xBit1 + 10, yBit1 - 3, 10);
      noFill();
      arc(xBit1 - xWidth/2, yBit1 + yHeight/2, 20, 20, 1.5*PI, 2*PI);
    }   
    if (abs(xTim - xBit1) < xWidth/2 && abs(yTim - yBit1) < yHeight/2 && youMayEat) {
      isEaten1 = true;
    }
  }
  void eat2() { //Every cheese has it's own name, so that only that one dissappears when being eaten. 
    float xBit2 =  0.82*width;
    float yBit2 = 496;
    float xWidth = 40;
    float yHeight = 30;
    if (isEaten2 == false) {
      fill(#fada00);
      stroke(#ffc400);
      rect(xBit2, yBit2, xWidth, yHeight);
      circle(xBit2 + 10, yBit2 - 3, 10);
      noFill();
      arc(xBit2 - xWidth/2, yBit2 + yHeight/2, 20, 20, 1.5*PI, 2*PI);
    }   
    if (abs(xTim - xBit2) < xWidth/2 && abs(yTim - yBit2) < yHeight/2 && youMayEat) {
      isEaten2 = true;

    }
  }
  void eat3() {
    float xBit3 = width/3;
    float yBit3 = 650;
    float xWidth = 40;
    float yHeight = 30;
    if (isEaten3 == false) {
      fill(#fada00);
      stroke(#ffc400);
      rect(xBit3, yBit3, xWidth, yHeight);
      circle(xBit3 + 10, yBit3 - 3, 10);
      noFill();
      arc(xBit3 - xWidth/2, yBit3 + yHeight/2, 20, 20, 1.5*PI, 2*PI);
    }   
    if (abs(xTim - xBit3) < xWidth/2 && abs(yTim - yBit3) < yHeight/2 && youMayEat) {
      isEaten3 = true;

    }
  }

//This checks if you ate all the cheeses. If so, set the boolean 'won' to true!
  void hasWon() {
    youMayEat = true;
    if (isEaten1 && isEaten2 && isEaten3){
    won = true;
            timer.gameOver = true;

    }
  }
  void winScreen(){
    if (won == true){ //Congrats, the 'won' boolean is set to true. The program wil now display a green screen saying Congratulations!
      rectMode(CENTER);
     stroke(#9efc3f);
      fill(#9efc3f);
      rect(width/2, height/2, width, height); 
      fill(255);
      textSize(69);
      textAlign(CENTER);
      text("congratulations!", width/2, height/2); 
    }
  }

//When the time is up, this will check if one of the cheeses is not eaten. 
  void hasLost() {
    if (!isEaten1 || !isEaten2 || !isEaten3) {
      lost = true; //now, the boolean 'lost' is set to true. 
      failScreen();
      timer.gameOver = true;
    }
  }
  
  
  void failScreen(){
    if (lost == true){ //Oh no! It appears that you didn't succeed to eat the three cheeses! The program will now display a red screen.
   rectMode(CENTER);
      fill(255, 0, 0);
      stroke(255, 0, 0);
      rect(width/2, height/2, width, height);
      fill(255);

      textSize(69);
      textAlign(CENTER);
      text("Better luck next time.", width/2, height/2); 
    }
  }
}
