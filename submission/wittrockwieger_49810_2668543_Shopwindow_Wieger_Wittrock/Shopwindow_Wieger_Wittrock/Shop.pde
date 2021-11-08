/*
Shopwindow by Wieger Wittrock, group 1.
 31-10-2021
 This interactive shopwindow has elements of the real shop "By Jan Marc" in Hengelo
 */
class Shop { //THE class of this program, it is the only class that is called in the main tab, and it connects all the other classes!

  Background shopBackground; //we make objects of the classes
  Window glass;
  Locker locker;
  Lights lights;


  Shop() { //constructor
    shopBackground = new Background(); //we initialise the objects
    glass = new Window();
    locker = new Locker();
    lights = new Lights();
  }

  void display() {
    shopBackground.display(); //we display the objects in the correct order
    lights.display();
    locker.display();    


    //darkness
    if (!lights.lightsOn) { //this is not placed in the lights class, because this darkness filter needs
      //to be drawn last from inside the shop (so not the glass outside), otherwise the tshirt are able to go
      //behind the lamps and lightswitch. Or the shirts and closet are not affected by the lights.
      fill(0, 200); //darkness with a opacity.
    } else {
      noFill(); //no darkness when the lights are on.
    }
    noStroke();
    rect(width/2, height/2, width, height); //darkness fill the entire screen

    if (!glass.isBroken) { //if the glass in not yet broken, it will display, if it is broken it will not display and that is good for the program
      glass.display();
    }
  }

  void update() {
    glass.update(); //update the objects
    locker.update();
  }

  void moveCrowbar(float mouseXParameter, float mouseYParameter) {//called in the mouseMoved, parameters for the mouseX and mouseY
    glass.crowbarMove( mouseXParameter, mouseYParameter); //crowbare gets moved
  }

  void dragMouse(float mouseXParameter, float mouseYParameter) { //called in the mouseDragged, parameters for the mouseX and mouseY
    if (glass.isBroken) { //you can not interact with the locker when there is still glass outside
      locker.dragMouseLocker(mouseXParameter, mouseYParameter); //calls all the methods that use mouseDragged in the Locker class
    }
  }
  void pressMouse(float mouseXParameter, float mouseYParameter) {//called in the mousePressed, parameters for the mouseX and mouseY        
    if (glass.isBroken) { //you can not interact with the locker when there is still glass outside
      locker.pressMouseLocker(mouseXParameter, mouseYParameter); //select a tshirt to drag
      lights.lightSwitch(mouseXParameter, mouseYParameter);//turn on/off the lights when you press the switch
    }
    glass.crack(mouseXParameter, mouseYParameter); //place a crack on the window if you press it
  }
  void releaseMouse(float mouseXParameter, float mouseYParameter, float previousMouseXParameter, float previousMouseYParameter) {
    if (glass.isBroken) { //you can not interact with the locker when there is still glass outside
      locker.releaseMouseLocker( mouseXParameter, mouseYParameter, previousMouseXParameter, previousMouseYParameter);
      //this will set a boolean in the Clothes class to false, and the selected tshirt is let go!
      //this also makes it so the shirt will get the speed of the mouse, thats why we have mouseX,mouseY,pmouseX,pmouseY as parameters. With these we calculate
      //the speed the shirt gets, in the Clothes class
    }
    glass.rotateCrowbarBack(); //the crowbar rotates back when you release the mouse
  }

  void resetTshirtPosition() {
    if (glass.isBroken) { //you can not interact with the locker when there is still glass outside
      locker.resetShirtPosition(); //reset the position of the shirts, called when you press a key
    }
  }
}
