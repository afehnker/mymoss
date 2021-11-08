/*
Shopwindow by Wieger Wittrock, group 1.
 31-10-2021
 This interactive shopwindow has elements of the real shop "By Jan Marc" in Hengelo
 */
class LockerDoor { //this is called in the Locker class

  int doorX; //position for the door change, when you open it. so I made them into variables
  int doorY;
  boolean isOpen; //boolean used to know what the door is doing athe the moment
  boolean isOpening;
  boolean isClosing;

  LockerDoor() {
    doorX = 50; //give values in the constructor
    doorY = 0;
    isOpen = false;
    isOpening = false;
    isClosing = false;
  }

  void display() {
    fill(0, 30);
    quad(-50, -150, 50, -150, 50, 170, -50, 170);
    fill(170, 136, 115);    
    quad(-50, -150, doorX, -150 - doorY, doorX, 170 - doorY, -50, 170); //we draw the door with the variables, so it will change when the variables change
  }

  void update() {
    if (doorX > 0 && isOpening) { //opening the door until the x position is > 0
      doorX-=2; 
      doorY-=1;
    } 
    if (doorX == 0 && isOpening) { //when it is done moving, then the door is open
      isOpening = false;
      isOpen = true;
    }

    if (doorX >= 0 && isClosing) { //closing the door
      doorX+=2; 
      doorY+=1;
    }
    if (doorX == 50 && isClosing) { //when it is done closing, the door is closed
      isClosing = false;
      isOpen = false;
    }
  }

  void openAndCloseDoor(float mouseXParameter, float mouseYParameter) {//called eventaully in mousePressed, parameters for mouseX and mouseY
    if (mouseXParameter <= 450 && mouseXParameter >=350 && mouseYParameter <= 720 && mouseYParameter >= 400) { 
      //you only open the door by pressing on the door
      //activitad when the mouse is pressed on the door
      if (!isOpen) { //if you click the door when it is closed, then it will open       
        isOpening = true;
      } else {       
        isClosing = true; //otherwise it will close
      }
    }
  }
}
