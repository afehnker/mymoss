//Made in its entirety by Olivier Donker in October 2021.

//Global vars
MenuScreen menu1;
ShopFront2 shopfront21;
Doner doner1;
Shaver shaver1;
DonerMan donerman1;
Scoreboard scoreboard1;

ArrayList<DonerPiece> donerPieceList;

boolean showMenu = true;
boolean showshopfront2 = false;
float mousex, mousey;
float startblinktimer = 0;
boolean mouseMode = false;
boolean showWiiMoteInstruction = false;
int wPressCounter = 0;
int pieceAddTimer = 0;

boolean rollHeadingStepAnticlockwiseIsGo = false;
boolean rollHeadingStepClockwiseIsGo = false;
boolean rollHeadingStepCentreIsGo = false;

boolean shaverVibrating = false;

void setup() {
  size(960, 720, P2D);     //P2D for enhanced performance
  menu1 = new MenuScreen();
  doner1 = new Doner(200, 50);
  shaver1 = new Shaver(0, 0, 100, 100);
  shopfront21 = new ShopFront2(width/2, height/2);
  donerman1 = new DonerMan(500, 100, 1.5);
  scoreboard1 = new Scoreboard();

  donerPieceList = new ArrayList<DonerPiece>(); //No elements yet at the start!
}

void draw() {
  if (showMenu == true || showWiiMoteInstruction == true) {  //background switcher
    background(0);    //black, or
  } else {
    background(170);  //grey
  }
  noCursor();      //nocursor throughout the whole program

  if (showMenu == true) {
    menu1.display();          //start off  by showing the menu (first thing you see)
  }


  if (showWiiMoteInstruction == true) {
    menu1.displayInstructions();              //WiiMote instr. if w is pressed in keyPressed
  }


  if (showshopfront2 == true) {                //to show the zoom sequence into the order window
    shopfront21.display();
  }

  if (showshopfront2 == false && showMenu == false && showWiiMoteInstruction == false) {    //actual start of the shaving game
    doner1.display();
    shaver1.display();
    shaver1.changePos();
    shaver1.velocityVector();    //has to do with the shaver "following" the mouse, heading changes with shaver velocity vector heading
    donerman1.display();
    shaver1.vibrate();
    scoreboard1.display();
    scoreboard1.runGameCountdown();      //to count down the game timer


    if (rollHeadingStepAnticlockwiseIsGo == true) {      //roll shaver anti-clockwise if wiimote exceeds certain anti-clockwise roll angle
      shaver1.wiiRollHeadingStepAnticlockwise();
    }

    if (rollHeadingStepClockwiseIsGo == true) {           //roll shaver clockwise if wiimote exceeds certain clockwise roll angle
      shaver1.wiiRollHeadingStepClockwise();
    }
    if (rollHeadingStepCentreIsGo == true) {              //roll shaver to centre if wiimote roll is around 0
      shaver1.wiiRollHeadingStepCentre();
    }


    donerPieceList.ensureCapacity(4);     //Make sure arraylist can hold at least 4 objects, this is for performance's sake.
    for (int i = donerPieceList.size()-1; i >= 0; i--) {   //go through list backwards
      DonerPiece donerpiecei = donerPieceList.get(i);
      donerpiecei.display();
      donerpiecei.changePos();  //to have pieces fall to the sides

      if (donerpiecei.yDonerPiece > height) {  //remove piece from arraylist if y is large enough to be off-screen
        donerPieceList.remove(i);
      }
    }

    if (scoreboard1.runTheCountdown == true) {    //only check collision and score if game is not over (i.e. if countdown is still running)
      if (pieceAddTimer > 10) {    //set a timer to spawn a piece ONLY after 10 frames have passed; Otherwise there are too many
        //add-condition                                    //deltay instead of velocityvector y, since deltay does not go through the jitterfix (only a visual thing). If you use vector-y, you get burnt doner spam on second round of game.
        if (shaver1.xShaver < doner1.xDoner + 291 && shaver1.xShaver > doner1.xDoner + 17) {    //shaver has to be INSIDE doner for pieces to come off. Approximation of the horizontal boundary of the doner by two vertical lines, in actuality it's more of a wedge. Could be done with a for loop over y maybe?
          if (shaver1.yShaver < 670 && shaver1.yShaver > 74) {      //similarly, vertical boundary of doner.
            if (shaver1.deltay < -1) {                      //check if shaver is moving up.
              if ((shaver1.deltasVector.mag() > 20)) {    //If velocity is too great, make blackened/charred doner pieces pop out.
                donerPieceList.add(new DonerPiece(shaver1.xShaver-100, shaver1.yShaver-100, random(-5, 5), random(-4, -10),  100, 100, 100));
                scoreboard1.scoreMinusUpdate();    //update the general score (amount of pieces shaved).
              } else if (shaver1.deltasVector.mag() > 10) {
                donerPieceList.add(new DonerPiece(shaver1.xShaver-100, shaver1.yShaver-100, random(-5, 5), random(-4, -10),  255, 255, 255));
                scoreboard1.scorePlusUpdate();
              }
            }
          }
        }
        pieceAddTimer = 3;    //increase this to increase the pieces shaved per shave, as the likelihood of there being 11 (> 10) increases.
      }

      pieceAddTimer += 1;
    }
  }

  if (startblinktimer < 10) {                  //Timer for the blinking of the man's eyes
    startblinktimer += 0.004*3.1416; //Not PI, since it's difficult about multiplication.
  } else {
    startblinktimer = 2;    //reset, or the value of this timer will grow to infinity.
  }

  if (abs(sin(startblinktimer)) < 0.07) {  //periodically blink!
    donerman1.makeBlinkTrue();            //Imagine it like this: One line goes around the unit circle. If the sine of the point where the line is on the circle is between some value and its negative (reason for the abs function), set blink true.
  } else {
    donerman1.makeBlinkFalse();
  }
}

void keyPressed() {
  if (key == 'r') {//reset game to start (i.e. reset appropriate menu/gamestate booleans).
    showMenu = true;
    mouseMode = false;
    showWiiMoteInstruction = false;
  }

  if (key == 'q') {
    rollHeadingStepAnticlockwiseIsGo = true;
    rollHeadingStepClockwiseIsGo = false;
    rollHeadingStepCentreIsGo = false;
  }

  if (key == 'e') {
    rollHeadingStepClockwiseIsGo = true;
    rollHeadingStepAnticlockwiseIsGo = false;
    rollHeadingStepCentreIsGo = false;
  }

  if (key == 'c') {
    rollHeadingStepCentreIsGo = true;
    rollHeadingStepClockwiseIsGo = false;
    rollHeadingStepAnticlockwiseIsGo = false;
  }

  if (key == 'm') {
    if (showMenu == true || scoreboard1.runTheCountdown == false) {  //for a second pass of the game (after a reset)
      mouseMode = true;     //mouseMode becomes active, changing what scripts run in the Shaver class (shaver rotation is different, working with the deltax/y, see the class for details)
    }
    showMenu = false;      //stop showing menu screen
    showshopfront2 = true;    //show shopfront with zoom sequence
  }

  if (key =='w') {
    wPressCounter += 1;
    if (wPressCounter == 1) {    //after first w press:
      showMenu = false;      //stop showing menu screen
      showWiiMoteInstruction = true; //show an instruction for starting glovePIE etc.
    }
    if (wPressCounter == 2) {  //after second w press:
      showWiiMoteInstruction = false;    //hide instruction screen
      showshopfront2 = true;    //show the shopfront sequence. Changing mouseMode is not required, since the default mode of the program is wii mode: mouseMode is a special case.
      wPressCounter = 0;   //reset counter for a second pass of game.
    }
  }
}

void mouseMoved() {
  mousex = lerp(mousex, mouseX, 0.2);          //For smooth mouse movement
  mousey = lerp(mousey, mouseY, 0.2);          // 0.3 & 0.2 & 0.1 are all nice. 0.2 Seems to be a good balance between performance and feel.
}

void mousePressed() {
  //set vibrate to true
  shaverVibrating = true;
}

void mouseDragged() {
  shaverVibrating = true;                //mouseDragged AND mouseMoved, since shaver has to moth both when button is held and when it's not.
  mousex = lerp(mousex, mouseX, 0.2);
  mousey = lerp(mousey, mouseY, 0.2);
}
void mouseReleased() {
  //set vibrate to false!
  shaverVibrating = false;
}
