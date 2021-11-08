class Machine {
  //arguments
  PFont buttontext;
  float machineXPos;
  float machineYPos;
  int machineNumber;
  PImage machineImg;
  boolean spinning;
  boolean win;
  Slot slot1;
  Slot slot2;
  Slot slot3;

  //constructor
  Machine(float initxPos, float inityPos) {
    machineXPos = initxPos;
    machineYPos = inityPos;
    machineImg = loadImage("slotmachine.png");
    buttontext = createFont("Arial", 16, true);
    slot1 = new Slot(machineXPos, machineYPos);
    slot2 = new Slot(machineXPos+72, machineYPos);
    slot3 = new Slot(machineXPos+143, machineYPos);
    spinning = false; /*initial state of spinning = false*/
    win = false;
  }

  //methods

  //this method displays 1 gambling machine
  void displaymachine() {
    image(machineImg, machineXPos, machineYPos, 374, 720);
    fill(255);
    rect(machineXPos+55, machineYPos+263, 253, 27);
    //startbutton
    noStroke();
    fill(#30AF0E);
    ellipse(machineXPos+160, machineYPos+502, 30, 30);  
    //stopbutton
    fill(#E83D3D);
    ellipse(machineXPos+210, machineYPos+502, 30, 30);
    //text
    fill(0);
    textAlign(CENTER);
    textFont(buttontext, 9); 
    text("START", machineXPos+159, machineYPos+504);
    text("STOP", machineXPos+210, machineYPos+504);
  }

  // this calls the slots from the class Slot
  void slots() {
    slot1.state();
    slot2.state();
    slot3.state();
    slot1.update(spinning);
    slot2.update(spinning);
    slot3.update(spinning);
    slot1.display();
    slot2.display();
    slot3.display();
  }

  //this checks whether mouse is over start or stop and changes boolean spinning to trure or false
  void mouseOver(int mousex, int mousey) {
    //start button
    if (dist(mousex, mousey, machineXPos+160, machineYPos+504)<=17) {
      spinning = true;
    }
    //stop button
    if (dist(mousex, mousey, machineXPos+210, machineYPos+504)<=17) {
      spinning = false;
    }
  }

  /*increment update method only works if boolean spinning = false 
   so it doens't change the increment value while it's still spinning,
   so not unneccesary updates of the increment value*/
  void incUpdate(int mousex, int mousey) {
    if (!spinning && (dist(mousex, mousey, machineXPos+160, machineYPos+504)<=17)) {
      slot1.inc = int(random(3, 8));
      slot2.inc = int(random(3, 8));
      slot3.inc = int(random(3, 8));
    }
  }

  void changewin(int mousex, int mousey) {
    if (spinning && (dist(mousex, mousey, machineXPos+210, machineYPos+504)<=17)) {
      if ((abs(slot1.slotYpos1 - slot2.slotYpos1 - slot3.slotYpos1)> slot1.slotYpos1 - 30 && abs(slot1.slotYpos1 - slot2.slotYpos1 - slot3.slotYpos1) < slot1.slotYpos1 + 30)) {
        println("you won");
        win = true;
      }
    }
    if(!spinning && (dist(mousex, mousey, machineXPos+160, machineYPos+504)<=17)){
    win = false;
    
    }
  }
}
