/*
  LeftSymbol Class
 Left Montblanc Symbol. 
 This symbol has 6 buttons that can be pressed to use a bunch of different tools on the screen. 
 Button 0 opens a pen tool which lets you draw on the canvas.
 Button 1 lets the stars shine brigther
 Button 2 changes the colour of the circle around the symbol
 Button 3 lets you change the time from day to night.
 Button 4 spawns angels and lets them emerge from the portal. 
 Button 5 lets you reset the everything you did on the screen.
 Author: Byron
 */


class LeftSymbol {

  float symbolX;
  float symbolY;

  float starRotation;

  int lastPressedButton;

  boolean buttonIsPressed = false;

  boolean activePen = false;

  Surroundings sur;

  Storefront store;

  Drawing pen;

  Circle circle;

  Star[] stars;

  Button[] buttons;

  LeftSymbol(float xPos, float yPos, Surroundings sceneBackground, Storefront sceneStore) {

    symbolX = xPos;
    symbolY = yPos;

    starRotation = 0;

    stars = new Star[2];

    buttons = new Button[6];

    sur = sceneBackground;

    circle = new Circle(-width*0.32, 0, 0);

    store = sceneStore;

    lastPressedButton = -1;

    pen = new Drawing(activePen);

    //draws the stars and initilises the buttons on the first star point
    stars[0] = new Star(-width*0.32, 0, 1, #C2B886, starRotation);
    stars[1] = new Star(-width*0.32, 0, 0.6, #98917F, starRotation);

    for (int i = 0; i < 6; i++) {
      buttons[i] = new Button(0, -65, 30);
    }
  }

  void display() {
    pushMatrix();
    translate(symbolX, symbolY);
    circle.display();
    stars[0].display();
    stars[1].display();

    popMatrix();

    pushMatrix();
    translate(symbolX-width*0.32, symbolY);

    //rotates the buttons in 60 degree intervalls, so they are spread across each point of the star
    for (int i = 0; i < 6; i++) {
      rotate(PI/3);
      buttons[i].display();
    }
    popMatrix();
  }

  void update() {

    //cehcks which buttons are pressed, and makes class calls based on the integer lastPressedButton and the boolean buttonIsPressed.
    //lastPressedButton = index of the button pressed set by clicked()
    //buttonIsPressed = boolean set by clicked()

    //calls the display() function of the Drawing class
    if (buttonIsPressed && lastPressedButton == 0) {
      pen.display();
    }

    //calls the update() function of the Circle class, letting the stars inside blink
    if (buttonIsPressed && lastPressedButton == 1) {
      circle.update();
    }

    //calls the changeColour() function of the Circle class, changing the colours of the ring to a random colour hue
    if (buttonIsPressed && lastPressedButton == 2) {
      circle.changeColour();
      buttonIsPressed = false;
      lastPressedButton = -1;
    }

    //changes the background colour of the sceneBackground, by calling the dayToNight() function of the Surroundings class
    if (buttonIsPressed && lastPressedButton == 3) {
      int dayNight = sur.update();
      if (dayNight < 0) {
        buttonIsPressed = false;
        lastPressedButton = -1;
        println("DONE CHANGING THE DAY");
      }
    }

    //calls the activateAngels() function of the Storefront class, spawning angles on the screen
    if (buttonIsPressed && lastPressedButton == 4) {
      store.activateAngels();
    }

    //resets everything that was pressed and made, making the scene normal again by calling the various reset functions of all classes used by the buttons
    if (buttonIsPressed && lastPressedButton == 5) {
      store.resetAngels();
      sur.resetDay();
      circle.resetColour();
    }
  }


  void clicked(float mouseX, float mouseY) {
    /*
      loops through the button array and sends a translated mouse position to the button, to check if the mouse was clicked inside the button.
     if the button returns true, then the loop stops and the buttinIsPressed boolean becomes true, as well as lasPressedButton is set to the index of the button that was pressedn
     in order to decide which funciton should happen.
     */

    for (int i = 0; i < 6; i++) {
      buttonIsPressed = buttons[i].isPressed(mouseX-symbolX+width*0.32, mouseY-symbolY, i);

      if (buttonIsPressed) {
        lastPressedButton = i;
        break;
      }
    }
  }

  void activatePen() {
    pen.activated();
  }
}
