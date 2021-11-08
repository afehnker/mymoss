class Slot {

  //arguments
  int startYpos;
  float slotXpos;
  float slotYpos1;
  float slotYpos2;
  PImage icon1;
  PImage icon2;
  PImage icon3;
  PImage icon4;
  PImage icon5;
  PImage icon6;
  PImage icon7;
  PImage icon8;
  PImage icon9;
  float realYpos;
  int state;
  int iconWidth;
  int inc;
  float machinePosY;
  float machinePosX;

  //constructor
  Slot(float xpos, float ypos) {
    machinePosY =ypos;
    machinePosX = xpos;
    slotXpos = machinePosX+81;
    slotYpos1 = machinePosY+367;
    icon1 = loadImage("icon1.png");
    icon2 = loadImage("icon2.png");
    icon3 = loadImage("icon3.png");
    icon4 = loadImage("icon4.png");
    icon5 = loadImage("icon5.png");
    icon6 = loadImage("icon6.png");
    icon7 = loadImage("icon7.png");
    icon8 = loadImage("icon8.png");
    icon9 = loadImage("icon9.png");
    state = 1;
    iconWidth = 60;
    inc = 1;
  }

    /*method to display the icon images for each slot 
     split the icon row up in 2 to solve the problem
     with the icons appearing under the gambling machine*/
  void display() {
    image(icon5, slotXpos, slotYpos2-iconWidth, iconWidth, iconWidth);
    image(icon6, slotXpos, slotYpos2-2*iconWidth, iconWidth, iconWidth);
    image(icon7, slotXpos, slotYpos2-3*iconWidth, iconWidth, iconWidth);
    image(icon8, slotXpos, slotYpos2-4*iconWidth, iconWidth, iconWidth);  
    image(icon9, slotXpos, slotYpos2-5*iconWidth, iconWidth, iconWidth);
    image(icon1, slotXpos, slotYpos1, iconWidth, iconWidth);
    image(icon2, slotXpos, slotYpos1-iconWidth, iconWidth, iconWidth);
    image(icon3, slotXpos, slotYpos1-2*iconWidth, iconWidth, iconWidth);
    image(icon4, slotXpos, slotYpos1 - 3*iconWidth, iconWidth, iconWidth);
  }

  /*same thing to solve the problem with the icons appearing under the machine i split the icon image in 2,
   and used states to know where things are positioned and what to do next*/
  void state() {
    if ((state == 1) && (slotYpos1 > machinePosY + 440)) {
      slotYpos2 = machinePosY +270;
      state = 2;
    } else if ((state == 2) && (slotYpos2 > machinePosY + 500)) {
      slotYpos1 = machinePosY + 150;
      state = 1;
    }
  }


  /*boolean spinning from class Machine gets passed into this method and if it is true it will spin other wise it will not spin*/
  void update(boolean spin) {
    if (spin) {
      if (state ==1 || (state ==2 && slotYpos1 < machinePosY + 620 )) {
        slotYpos1 += inc;
      } 
      if (state == 2 || state == 1 && slotYpos2 > machinePosY + 320 && slotYpos2 < machinePosY + 710) {      
        slotYpos2 += inc;
      }
    }
  }
}
