//Class made by Rita Youssif s2615444 for the final project for the subject programming. 
//Purpose: Shows people walking from the right to the left. This has to be activated by the user themselves.
//Disclaimer: all images used are from Google images and used for educational purposes. 

class WalkerL {
  PImage WalkerL1;
  PImage WalkerL2; 
  float WalkerX = 0; 
  boolean walkerActive = false;
  float speed = 1.3; 

  WalkerL() {
    WalkerL1 = loadImage("WalkLeft1.png");             // Loads in the images for the variables.
    WalkerL2 = loadImage("WalkLeft2.png");
  }

  void display() {
    image(WalkerL1, WalkerX+1000, height/3 *1.12);         // Default image that will be displayed.
    if (walkerActive) {
      image(WalkerL2, WalkerX+2300, height/4 *1.1); 
      image(WalkerL1, WalkerX+3600, height/3 * 1.14);     // Images that will displayed when the walkerActive boolean has become true. 
      image(WalkerL2, WalkerX+4900, height/3);
    }
  }

  void activateWalker() {                                                    // The function of this void is to turn the boolean walkerActive true when the if-statement is met. 
    if (mouseX > 1037 && mouseY> 311 && mouseX <1097 && mouseY <899) {
      walkerActive = true;
    }
  }

  void move() {                       // The people will start moving through this method. The walkerActive boolean has to be true. They will get a negative speed to go in reverse so from right to left.
    if (walkerActive) {
      WalkerX += -speed;
    }
  }
}
