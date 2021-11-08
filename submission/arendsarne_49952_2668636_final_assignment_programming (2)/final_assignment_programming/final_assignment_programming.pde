// created by Tim Schulpen and Arne Arends
// semester 1, 2021 programming project
//University of Twente - CreaTe
//SO to Sterre

//Our program consists of a window shop, where you can look through.
//The different classes are about the shop itself, the moving door,
//the mannequins standing in the shop aswell as the suits and signs.


showCase shop;      //neerzetten elke class
Mannequin[] mannequin = new Mannequin[5];
Door door;
Sign sign;
Suits[] suits = new Suits[5];

PImage supply;  //name of brand: suitsupply
PImage manneq;    //mannequin
PImage suit1;
PImage suit2;
PImage suit3;
PImage suit4;
PImage suit5;

float manX1, manX2, manX3, manX4, manX5;    // positions of the mannequins
float manY1, manY2, manY3, manY4, manY5;


void setup()
{
  size(1800, 800, P2D);
  imageMode(CENTER);
  rectMode(CENTER);
  shop = new showCase();
  door = new Door();
  manneq = loadImage("mannequinMale.png"); // image of a mannequin: https://www.vhv.rs/viewpic/hoxhRJR_transparent-mannequin-male-transparent-male-mannequin-png-png/
  manneq.resize(100, 300);
  suit1 = loadImage("suitExperiment1.png"); // image of suit: https://www.pngitem.com/middle/xmJJm_transparent-coat-clipart-png-suit-icon-png-png/
  suit1.resize(130, 130);
  suit2 = loadImage("suitExperiment2.png"); // image of suit: https://www.pngitem.com/middle/oomiwh_tuxedo-clipart-grey-suit-tux-clipart-hd-png/
  suit2.resize(100, 140);
  suit3 = loadImage("suitExperiment3.png"); // image of suit: https://www.pngitem.com/middle/Twxmbh_suit-business-icon-man-white-black-tie-design/
  suit3.resize(110, 135);
  suit4 = loadImage("suitExperiment4.png"); // image of suit: https://www.pngitem.com/middle/hTRRRih_suit-formal-wear-tuxedo-hd-png-download/
  suit4.resize(100, 125);
  suit5 = loadImage("suitExperiment5.png"); // image of suit: https://www.pngitem.com/middle/hJhix_suit-transparent-png-png-download/
  suit5.resize(100, 130);
  sign = new Sign();

  manX1 = random(100, 250);
  manY1 = random(400, 500);
  manX2 = random(280, 400);
  manY2 = random(400, 500);
  manX3 = random(450, 750);
  manY3 = random(400, 500);
  manX4 = random(1450, 1600);
  manY4 = random(400, 500);
  manX5 = random(1350, 1430);
  manY5 = random(400, 500);

  suits[0] = new Suits(suit1, suit2, manX1, manY1);
  suits[1] = new Suits(suit2, suit1, manX2, manY2);
  suits[2] = new Suits(suit4, suit3, manX3, manY3);
  suits[3] = new Suits(suit5, suit4, manX4, manY4);
  suits[4] = new Suits(suit3, suit5, manX5, manY5);

  mannequin[0] = new Mannequin(manneq, manX1, manY1+81);
  mannequin[1] = new Mannequin(manneq, manX2, manY2+81);
  mannequin[2] = new Mannequin(manneq, manX3, manY3+81);
  mannequin[3] = new Mannequin(manneq, manX4, manY4+86);
  mannequin[4] = new Mannequin(manneq, manX5, manY5+85);
}


void draw() {

  background(#56835E);
  shop.display();
  for (int i = 0; i < mannequin.length; i++) {      //loop for calling the mannequin
    mannequin[i].display();
  }
  for (int i = 0; i < suits.length; i++) {
    suits[i].display();
  }
  door.update();
  door.display();
  sign.update();
  sign.display();
}

void keyPressed () {

  if (key == CODED) {      //boolean for opening and closing of the doors
    if (keyCode == UP) {
      door.upPressed();
      sign.doorOpen();
    }
    if (keyCode == DOWN) {
      door.downPressed();
      sign.doorClosed();
    }
  }
}
void mouseMoved() {

  for (int i = 0; i < suits.length; i++) {
    suits[i].isOverSuit(mouseX, mouseY);
  }
}
