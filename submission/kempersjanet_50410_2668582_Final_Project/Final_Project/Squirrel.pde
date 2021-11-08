class Squirrel

{
  float squirrelX;
  float squirrelY;

  float speedY;

  color squirrelColor;
  color bodyColor;

  boolean sneaking;

  Squirrel(float initX, float initY) {
    squirrelX = initX;
    squirrelY = initY;

    squirrelColor = color (160, 110, 79);
    bodyColor = color (149, 101, 72);

    speedY = 0.5;

    sneaking = true;
  }

  void display() {
    if (sneaking) {
      noStroke();
      fill(squirrelColor);
      //tail
      ellipse(squirrelX+50, squirrelY+30, 80, 60);
      ellipse(squirrelX+95, squirrelY-10, 60, 100);
      fill(bodyColor);
      pushMatrix();
      translate(squirrelX, squirrelY);

      //body
      ellipse(0, 0, 120, 150);

      //ears
      triangle(-50, -80, -50, -120, -15, -100);
      triangle(+15, -100, +50, -120, +50, -80);

      fill(squirrelColor);
      //head
      ellipse(0, -60, 110, 100);

      //hands or something like that
      ellipse(-20, +40, 30, 15);
      ellipse(+20, +40, 30, 15);

      //feet
      ellipse(-30, +70, 50, 30);
      ellipse(+30, +70, 50, 30);

      //eyes
      fill(255);
      ellipse(-25, -60, 30, 40);
      ellipse(+25, -60, 30, 40);

      fill(0);
      ellipse(-25, -50, 30, 20);
      ellipse(+25, -50, 30, 20);

      popMatrix();
    }
  }

//making the squirrel moving to the mushroom
  void update() {
    squirrelY = squirrelY - speedY;
    if (squirrelX < -25 || squirrelX > width + 5 || squirrelY < -5 || squirrelY > height+25) { 
      sneaking = false;
    }
  }

//make it possible to get the squirrel back to its start point
  void reset() {
    sneaking = true;
    squirrelY = height;
    squirrel.display();
  }

//letting the squirrel sneak again
  void correcting(float newX, float newY) {
    if (pow(newX - squirrelX, 2) + pow(newY - squirrelY, 2) <= pow(25, 2));
    sneaking = false;
  }

//make the game ends when the squirrel reachs the mushroom
  void resetScore() {
    String gameEnd = "GAME END";
    if (squirrelY <=  (height/6)*4) {
      score.scoreReset();
      fill(0);
      text(gameEnd, width/2, height/2);
      squirrel.correcting(squirrelX, squirrelY);
    }
  }
}
