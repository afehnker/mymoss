/*
 Angel class.
 Important Functions: display(), startTracking(), update()
 Important Variables: angelX, angelY, trackingChecker, trackX, trackY, timer, rotation, picker
 Author: Byron
 */

class Angel {

  float angelX; //x-Position
  float angelY; //y-Position

  float trackX; //x-coordinate for the position that should be tracked
  float trackY; //y-position for the position that should be tracked

  boolean trackingChecker; //event handler for tracking

  int timer; //frame counteer needed for blinking
  
  int picker; //picker to choose a random eye to blink, needs to be global so it isnt reset with every frame.
  
  float angelSize; //sets how big the angel is
  
  Eye[] eyeArray = new Eye[10]; //array to store the eyes inside
  Wing[] wingArray = new Wing[6]; //array to store the wings inside

  Angel (int xPos, int yPos, float size) {

    angelX = xPos;
    angelY = yPos;
    angelSize = size;
    trackingChecker = false;

    int rotation = 45;

    //Array to define all 9 eyes, and rotate them around the circle, the big middle eye is entered outside of the for loop
    for (int i = 0; i < 9; i++) {
      eyeArray[i] = new Eye(0, -70, 20, radians(rotation));
      rotation += 45;
    }
    eyeArray[9] = new Eye(0, 0, 40, 0); //middle big eye


    //lots of wings
    //right side wings
    wingArray[0] = new Wing(50, -50, radians(345), 1); //top right
    wingArray[1] = new Wing(50, 0, radians(15), 1); //middle right
    wingArray[2] = new Wing(50, 50, radians(55), 1); //bottom right

    //left side wings
    wingArray[3] = new Wing(-50, -50, radians(345), -1); //top left
    wingArray[4] = new Wing(-50, 0, radians(15), -1); //middle left
    wingArray[5] = new Wing(-50, 50, radians(55), -1); //bottom left
  }  

  //The angel cosists of one big circle as body, with one big center eye in the middle and 8 additional eyes placed around the edge of the center circle. 
  //To each side of the body are three wings.
  void display() {
    stroke(0);
    pushMatrix();
    translate(angelX, angelY);
    scale(angelSize);

    //lots of wings
    for (int i = 0; i <wingArray.length; i++) {
      wingArray[i].display();
    }

    //body
    stroke(#ffb300);
    fill(#ffd000);
    strokeWeight(5);
    ellipse(0, 0, 140, 140);

    //display all the eyes in the array
    for (int i = 0; i <eyeArray.length; i++) {
      eyeArray[i].display();
    }

    popMatrix();
  }

  //update function to let the angel move towards a clicked position and letting the eyes blink randomly
  void update() {
    
    timer++;

    //once the angel is told to track a location, this method lets the angel move until it reached the targeted position or the angel was told to stop moving by a second click
    //due to lerping the path, I am checking if the angel is inside a range of smaller than 1 to the tracked position, if it is, the tracking is done.
    //due to the nature of lerp, the last few steps take a while till the second if condition is met.
    if (trackingChecker) {
      angelX = lerp(angelX, trackX, 0.05);
      angelY = lerp(angelY, trackY, 0.05);
    }
    if (trackingChecker && dist(trackX, trackY, angelX, angelY) < 1.0) {
      trackingChecker = false;
    }

    //update the eyes to blink randomly
    pushMatrix();
    translate(angelX, angelY);
    scale(angelSize);
    //display all the eyes in the array
    //a timer to wait 2 seconds before a random eye is picked to blink. this way the eyes dont blink during every frame but only every 2 seconds
    if (timer == 120) {
      picker = (int)random(0, 9);
      
    }
    if (timer > 120) {
      eyeArray[picker].blink();
      
    }
    popMatrix();
    
    //resets the blink timer one second after an eye blinked
    if (timer >= 180) {
      timer = 0;
    }
  }

  //sets a location for the angel to move towards, if clicked again while tracking, the angel stops at its current location
  void startTracking(float xClick, float yClick) {

    if (!trackingChecker) {
      trackX = xClick;
      trackY = yClick;

      trackingChecker = true;
    } else {
      trackingChecker = false;
    } //made so if you press on a spot twice, the angel will stop moving.
  }  
 
}
