class Spook { // atributes
  float xPosition;
  float yPosition;
  int transparency;
  int transparencyCounter;
  float yMovementArm; // for arms
  float moveX; // for spook movement
  float moveY; // for spook movement
  boolean moveLeft = true;
  boolean moveUp = true;

  // .................... constructor...............................................
  Spook() {
    xPosition = 1000;
    yPosition = 500;
    transparency = 100;
    transparencyCounter = 101;
  }

  // ..................... methods: creating the monsters .........................
  void displaySpook() {
    drawSpook();
    moveSpookHorizontally();
    moveSpookVertically();
  }

  void drawSpook() {
    stroke(255, 255, 255, RandomTransparency()); // white color from line(hands)
    strokeWeight(15); //weight from line(hands)
    randomArmMovement();
    makeSpook();
  }

  void makeSpook() {
    line(xPosition + 30, yPosition, xPosition + 60, yPosition + yMovementArm);
    line(xPosition - 30, yPosition, xPosition - 60, yPosition + yMovementArm);
    fill(255, 255, 255, RandomTransparency()); //white color from ellipse(body)
    strokeWeight(2); // weight from line(body)
    noStroke();
    bezier(xPosition, yPosition - 60, xPosition - 60, yPosition, xPosition - 60, yPosition + 60, xPosition - 30, yPosition + 120); 
    bezier(xPosition - 0.1, yPosition - 60, xPosition + 60, yPosition, xPosition + 60, yPosition + 60, xPosition - 30.1, yPosition + 120); 
    //ellipse(xPosition, yPosition, 60, 60); // body
    //ellipse(xPosition + widthCircle/2, yPosition + widthCircle/2, widthCircle, widthCircle); // body
    fill(0); //black color (eyes)
    stroke(1);
    arc(xPosition - 15, yPosition - 15, 15, 15, 0, PI+QUARTER_PI, CHORD);
    ellipse(xPosition + 15, yPosition - 15, 15, 15);
    fill(0); //black color (mouth)
    arc(xPosition, yPosition, 15, 30, 0, PI+QUARTER_PI, CHORD);
  }

  // ..................... methods: movement monster ..............................

  void randomArmMovement() {
    // yMovementArm is how much arm should go up and down every time the monster
    // gets drawn
    if (yMovementArm > 30) { // y arm not above 30
      yMovementArm -= random(6);
    } else if (yMovementArm < -30) { // y arm not below -30
      yMovementArm += random(6);
    } else {
      yMovementArm += random(-6, 6);
    }
  }

  void moveSpookHorizontally() {
    float xSpeed = 0;

    if ((xPosition < 10) && (moveLeft == true)) { // if on left side by border
      moveLeft = false;
    }
    if ((xPosition > width-10) && (moveLeft==false)) { // if on right side by border
      moveLeft = true;
    }

    // movement with random speed
    if (moveLeft == true) { // move to left
      xSpeed = +random(-3, 1);
    } else {  // move to right
      xSpeed = +random(-1, 3);
    }
    // change cordinates of monster
    xPosition += xSpeed;
  }

  void moveSpookVertically() {
    float ySpeed = 0;
    if ((yPosition < 10) && (moveUp == true)) { // if on left side by border
      moveUp = false;
    }
    if ((yPosition > height-10) && (moveUp==false)) { // if on right side by border
      moveUp = true;
    }

    // movement with random speed
    if (moveUp == true) { // move up
      ySpeed = +random(-3, 1);
    } else {  // move down
      ySpeed = +random(-1, 3);
    }
    // change cordinates of monster
    yPosition += ySpeed;
  }
  
  //.................method: random transparency..................................
  
  int RandomTransparency(){
    if ( transparency < transparencyCounter ){
      transparency += 1;
    } else if ( transparency > transparencyCounter ){
      transparency -= 1;
    } else {
      transparencyCounter = int(random (50,150));
    }
    return transparency;
  }

}
