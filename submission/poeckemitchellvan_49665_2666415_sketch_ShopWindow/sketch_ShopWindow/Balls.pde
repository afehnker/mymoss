/*
This class generates the balls in the closet, and makes them fall down when clicked and appear again after that.
The function display() makes the balls appear in the closet when they are not moving.
The function update() makes the balls fall down once they are clicked by the user. 
The balls on top have a faster falling speed to simulate the tower falling forward.
The function pressedBalls() makes the tower only fall if the mouse is clicked in the right area.
*/
class Balls{
  //initialising variables and colors:
  boolean generated;
  boolean clicked;
  boolean startTimer;
  boolean soundPlayed;
  float dYBalls;
  float dXBalls;
  int ballsXPos;
  int ballsYPos;
  int ballsSize;
  int ballsXDistance;
  int ballsYDistance;
  color colorBallRow1;
  color colorBallRow2;
  color colorBallRow3;
  color colorBallRow4;
  color colorBallRow5;
  
  Balls(int overX,  int overY){
    //assigning values to variables:
    ballsXPos = overX;
    ballsYPos = overY;
    dXBalls = 0;
    dYBalls = 0; 
    ballsXDistance = 35;
    ballsYDistance = 35;
    ballsSize = 40;
    generated = false;
    clicked = false;
    startTimer = false;
    soundPlayed = false; //variable for not making the sound play multiple times.
  }
  
  void display(){
    //generates the first row of 5 balls.
    for (int i = 0; i < 5; i++) {
      if (!generated) {
        colorBallRow1 = color(random(0,255), random(0,255), random(0, 255));
      }
      fill(colorBallRow1);
      circle(ballsXPos + ballsXDistance * i + dXBalls, ballsYPos - dYBalls * 1.1, ballsSize);
    }
    
    //generates the second row of 4 balls.
    for (int i = 0; i < 4; i++) {
      if (!generated) {
        colorBallRow2 = color(random(0,255), random(0,255), random(0, 255));
      }
      fill(colorBallRow2);
      circle(ballsXPos + 20 + ballsXDistance * i + dXBalls, ballsYPos - 30 - dYBalls * 1.2, ballsSize);
    }
    
    //generates the third row of 3 balls.
    for (int i = 0; i < 3; i++) {
      if (!generated) {
        colorBallRow3 = color(random(0,255), random(0,255), random(0, 255));
      }
      fill(colorBallRow3);
      circle(ballsXPos + 40 + ballsXDistance * i + dXBalls, ballsYPos - 60 - dYBalls * 1.3, ballsSize);
    }
    
    //generates the forth row of 2 balls.
    for (int i = 0; i < 2; i++) {
      if (!generated) {
        colorBallRow4 = color(random(0,255), random(0,255), random(0, 255));
      }
      fill(colorBallRow4);
      circle(ballsXPos + 60 + ballsXDistance * i + dXBalls, ballsYPos - 90 - dYBalls * 1.4, ballsSize);
    }
    
    //generates the last ball on top:
    if (!generated) {
      colorBallRow5 = color(random(0,255), random(0,255), random(0, 255));
    }
    
    fill(colorBallRow5);circle(ballsXPos + 80 + dXBalls, ballsYPos - 120 - dYBalls * 1.5, ballsSize);
    generated = true;
   }
  
  void update(){
    if (clicked) {
      clicked = false;
      startTimer = true;
      if (!soundPlayed) {
        soundPlayed = true;
        ballsFall.play();
      }
    }
    
     if (startTimer) {
       dYBalls = dYBalls - 10;
       dXBalls = random(-2, 2);
        
       //makes the balls come back after falling after a certain period of time:
       if (dYBalls < -1500) {
         startTimer = false;
         dYBalls = 0;
         generated = false;
         soundPlayed = false; //makes the sound play once and not multiple times.
      }
    }
  }
  
  void ballsPressed() {
    //makes the balls fall if the mouse is pressed inside the area of the balls:
    if (mouseX >= ballsXPos - 30 && mouseX <= ballsXPos + 170 && mouseY >= ballsYPos - 180 && mouseY <= ballsYPos + 20){
      clicked= true;
    }
  }
}
