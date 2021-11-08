//Class made by Rita Youssif s2615444 for the final project for the subject programming. 
//Purpose: Shows people walking from the left to the right. 
//Disclaimer: all images used are from Google images and used for educational purposes. 

class WalkerR {
  PImage WalkerR1; 
  PImage WalkerR2; 
  float WalkerX = 0; 
  boolean borderReached = false;
  float speed = 1; 

  WalkerR() {
    WalkerR1 = loadImage("WalkRight1.png");             // Loads in the images of the variables.
    WalkerR2 = loadImage("WalkRight2.png"); 
  }

  void display() {
    image(WalkerR1, WalkerX+300, height/3);            // Default picture that displays. 
    if (borderReached) {
      image(WalkerR2, WalkerX-1000, height/3); 
      image(WalkerR1, WalkerX-2000, height/3);         // Pictures that get displayed when the if-statement of the borderReached boolean being true has been met.
      image(WalkerR2, WalkerX-3400, height/3);
    }
  }

  void move() {                                        // This method allows the image to move to the right. 
    WalkerX += speed;

    if (WalkerX > 1050) {                               // When the image has reached this point the if-statement has been met and the boolean borderReached will become true. 
      borderReached =true;
    }
  }
}
