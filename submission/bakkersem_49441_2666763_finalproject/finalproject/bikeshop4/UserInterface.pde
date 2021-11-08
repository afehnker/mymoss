class UserInterface { // displays UI and handles buttons being clicked

  String currentMenu = "startMenu"; // used to keep track of which menu to display
  String currentPart;

  float buttonWidth = 0.152*width; // width of purple buttons
  float buttonHeight = 0.14*height; // height of purple buttons
  
  // x positions of the buttons
  float xButtonA; 
  float xButtonB;
  float xButtonC;
  float xButtonD = 0.7*width;

  void display() { //displays the UI for the different menus
     if (currentMenu != "wheelMenu" || currentMenu != "handleMenu") { // 
      xButtonA = 0.25*width; 
      xButtonB = 0.426*width;
      xButtonC = 0.5975*width;
    }
    
    if (currentMenu == "startMenu") { //display start menu, where you pick your starting bike
      displayConfirmButton();

      text("Choose bike to customize", 0.35*width, 0.75*height);
      displayRegularButton(xButtonA, "Race bike", color(255, 0, 255));
      displayRegularButton(xButtonB, "Regular bike", color(255, 0, 255));
      displayRegularButton(xButtonC, "Mountain bike", color(255, 0, 255));
    } else if (currentMenu == "mainMenu") {
      textSize(50);
      text("Choose part to customize", 0.35*width, 0.75*height);
      displayRegularButton(xButtonA, "Wheels", color(200, 0, 200));
      displayRegularButton(xButtonB, "Frame", color(200, 0, 200));
      displayRegularButton(xButtonC, "Handlebars", color(200, 0, 200));
    } else if (currentMenu == "wheelMenu" || currentMenu == "frameMenu" || currentMenu == "handleMenu") {
      displayConfirmButton();

      text("Choose what style of "+currentPart +" you want to use", 0.2*width, 0.75*height);
      if (currentMenu == "wheelMenu" || currentMenu == "handleMenu") {
        displayRegularButton(xButtonD, "Car", color(100, 100, 250));
        xButtonA = 0.1*width;
        xButtonB = 0.3*width;
        xButtonC = 0.5*width;
      }
      displayRegularButton(xButtonA, "Race", color(100, 100, 250));
      displayRegularButton(xButtonB, "Regular", color(100, 100, 250));
      displayRegularButton(xButtonC, "Mountain bike", color(100, 100, 250));
    }
  }

  void displayRegularButton(float xButton, String buttonText, color colour) { //function used to make and display regular buttons
    fill(colour);
    rect(xButton, height/1.2625, buttonWidth, buttonHeight, 28);
    fill(0);
    textSize(25);
    text(buttonText, xButton+width/25, height/1.15);
  }

  void displayConfirmButton() {
    //displays confirm button, I put the code in a seperate function to make the code more readable
    fill(0, 255, 0);
    rect(width/2.4, height/6.5, width/6, height/13);
    fill (0);
    textSize(50);
    text("Confirm", width/2.3, height/4.75);
  }

  void buttonCheck() { // checks for every menu if you pressed a button 
    // start menu code
    if (currentMenu == "startMenu") { // check if buttons are clicked when on start menu (choose bike to customize)
      if (overButton(xButtonA, height/1.2625, buttonWidth, buttonHeight)) { // race bike button
        customizer.changePart("wheels", "race");
        customizer.changePart("frame", "race");
        customizer.changeOffset("race");
        customizer.changePart("handlebars", "race");
      } 
      if (overButton(xButtonB, height/1.2625, buttonWidth, buttonHeight)) { // regular bike button
        customizer.changePart("wheels", "regular");
        customizer.changePart("frame", "regular");
        customizer.changeOffset("regular");
        customizer.changePart("handlebars", "regular");
      }
      if (overButton(xButtonC, height/1.2625, buttonWidth, buttonHeight)) { // MTB button
        customizer.changePart("wheels", "mtb");
        customizer.changePart("frame", "mtb");
        customizer.changeOffset("mtb");
        customizer.changePart("handlebars", "mtb");
      }
    }
    //main menu code
    if (currentMenu == "mainMenu") { // buttons when on main menu (choose part to customize)
      if (overButton(xButtonA, height/1.2625, buttonWidth, buttonHeight)) { // click on wheels menu
        currentMenu = "wheelMenu";
        currentPart = "wheels";
      } 
      if (overButton(xButtonB, height/1.2625, buttonWidth, buttonHeight)) { // click on frame menu
        currentMenu = "frameMenu";
        currentPart = "frame";
      }
      if (overButton(xButtonC, height/1.2625, buttonWidth, buttonHeight)) { // click on handle menu
        currentMenu = "handleMenu";
        currentPart = "handlebars";
      }
    }
    // part menu code
    if (currentMenu == "wheelMenu" || currentMenu == "frameMenu" || currentMenu == "handleMenu") {
      if (overButton(xButtonA, height/1.2625, buttonWidth, buttonHeight)) { // click on race style
        customizer.changePart(currentPart, "race");
      } 
      if (overButton(xButtonB, height/1.2625, buttonWidth, buttonHeight)) { // click on regular style
        customizer.changePart(currentPart, "regular");
      }
      if (overButton(xButtonC, height/1.2625, buttonWidth, buttonHeight)) { // click on mtb style
        customizer.changePart(currentPart, "mtb");
      }
      if (currentMenu == "wheelMenu"|| currentMenu == "handleMenu") {
        if (overButton(xButtonD, height/1.2625, buttonWidth, buttonHeight)) { // click on car tire
          customizer.changePart(currentPart, "car");
        }
      }
    }
    // confirm button code
    if (currentMenu == "startMenu" || currentMenu == "wheelMenu" || currentMenu == "frameMenu" || currentMenu == "handleMenu") {
      if (overButton(width/2.4, height/6.5, width/6, height/13)) {
        currentMenu = "mainMenu";
      }
    }
  }
  boolean overButton(float x, float y, float width, float height) { // check if mouse is on button and returns true if that's the case
    // this code is based on https://processing.org/examples/button.html
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
}
