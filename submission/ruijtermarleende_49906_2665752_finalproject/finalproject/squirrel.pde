class Squirrel {
  color bodyColor;
  color headColor;
  color pawColor;
  color eyeColor;
  boolean isFlipped;    
  float squirrelSize=10;  //variable used to scale
  float squirrelPos=10;    //variable used if you change the position the squirrel stays together
  int xPos = 0;
  int yPos = 0;
  boolean isSelected;
  int box = 70;  //invisible circle that is used to know if you are over the squirrel to select it
  float factorBox = 1;  //factor used to scale the invisible circle together with the squirrel itself


  Squirrel(int initX, int initY) {  //default positions
    bodyColor = color(230, 160, 0);
    headColor = color(230, 140, 0);
    pawColor = color(230, 140, 0);
    eyeColor = color(0);
    isFlipped=false;
    xPos = initX;
    yPos = initY;
  }

  void display() {

    noStroke();

    pushMatrix();
    translate(xPos, yPos);

    if (isFlipped) {      
      scale(-1, 1);    //if the squirrel is flipped the scale is -1 and if the squirrel is normal the scale is 1
    }

    //tail
    fill(bodyColor);

    ellipse(0, 0, squirrelSize*5, squirrelSize*5);
    ellipse(squirrelPos*1.5, squirrelPos*3.5, squirrelSize*4, squirrelSize*10);
    rect(squirrelPos, squirrelPos*6.5, squirrelSize*4, squirrelSize*2, squirrelSize*2);

    //ears
    fill(headColor);
    ellipse(squirrelPos*6.2, squirrelSize*2.5, squirrelSize, squirrelSize*4.5);
    ellipse(squirrelPos*7, squirrelPos*2.5, squirrelSize, squirrelSize*4.5);

    //body
    fill(bodyColor); 
    ellipse(squirrelPos*5, squirrelPos*5.5, squirrelSize*4.5, squirrelSize*4.5); 

    //paw
    fill(pawColor); 
    ellipse(squirrelPos*4, squirrelPos*6.3, squirrelSize*4, squirrelSize*4); 
    rect(squirrelPos*2, squirrelPos*7, squirrelSize*5.5, squirrelSize*1.5, squirrelSize*2); 

    //head
    fill(headColor); 
    ellipse(squirrelPos*7, squirrelPos*3, squirrelSize*3, squirrelSize*3); 

    //eye
    fill(eyeColor); 
    ellipse(squirrelPos*7.5, squirrelPos*2.8, squirrelSize*0.5, squirrelSize*0.5);

    popMatrix();
  }

  void select(float myMouseX, float myMouseY) {
    if (dist(myMouseX, myMouseY, xPos + (35 * factorBox), yPos + 35) <= box) {  //checks if the mouse is over the squirrel in a invisible 
      isSelected = true;
    }
  }

  void release() {
    isSelected = false;  //change the boolean when the squirrel is released

  }

  void move(int x, int y) {    //change the position of the squirrel
    if (isSelected) {
      xPos = x;     
      yPos = y;
    }
  }

  void resizeSquirrel(float factor) {    //resize the squirrel
    squirrelSize = squirrelSize*factor;  //update the size
    squirrelPos = squirrelPos*factor;    //update the position so the proportion of the squirrel stays the same
    factorBox = factor;
  }

  void flipSquirrel() {
    isFlipped=!isFlipped;    //flip the the squirrel
    factorBox = factorBox * -1;
  }

  void changeColorSquirrel() {
    bodyColor = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));    //make random colors
    pawColor = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    headColor = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  }

  void normalColorSquirrel() {  //reset the colors of the squirrel
    bodyColor = color(230, 160, 0);
    pawColor = color(230, 140, 0);
    headColor = color(230, 140, 0);
  }
}
