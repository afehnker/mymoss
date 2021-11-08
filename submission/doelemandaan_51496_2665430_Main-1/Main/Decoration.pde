class Decoration {
  int x;
  int y;

  float tintA;
  float tintB;

  boolean changeDisplayAtoB = false;
  boolean changeDisplayBtoA = false;
  boolean lightUp = false;

  PImage transparentLogo;
  PImage bag;
  PImage presents;
  PImage displayA;
  PImage displayB;
  PImage hat;
  PImage presentBlue;
  PImage presentWhite;
  PImage cashRegister;

  Fire leftFire;
  Fire rightFire;

  Decoration(int xPos, int yPos) {
    this.x = xPos;
    this.y = yPos;

    //load all the images
    bag = loadImage("cadeaus.png");
    presents = loadImage("zak.png");
    displayA = loadImage("display.jpg");
    displayB = loadImage("display2.jpg");
    hat = loadImage("hoed.png");
    presentBlue = loadImage("cadeau.png");
    presentWhite = loadImage("cadeau2.png");
    transparentLogo = loadImage("Logo.png");
    cashRegister = loadImage("kassa.png");

    displayA.resize(350, 530);
    displayB.resize(350, 530);
    presents.resize(490, 300);
    bag.resize(500, 300);
    cashRegister.resize(130, 130);
    presentBlue.resize(100, 100);
    presentWhite.resize(100, 100);
    hat.resize(80, 120);

    //create the two flames
    leftFire = new Fire(x-850, y+350, 15, random(0.001, 0.002), random(0.001, 0.002));
    rightFire = new Fire(x-330, y+350, 15, random(0.001, 0.002), random(0.001, 0.002));
  }

  void display(int tint) {

    //make everything relative to the center of the screen
    pushMatrix();
    translate(x, y);

    //creates the two black boxes, where the candles are in
    fill (0, 0, 0);
    rect(-870, +350, 50, 500);
    rect(-350, +350, 50, 500);

    //if you have pressed the S key, the candles will light up
    if (lightUp == true) {
      leftFire.display(-850, +350);
      rightFire.display(-330, +350);
    }

    //the logo on the desk
    tint(255, tint);
    image(transparentLogo, -50, +320);
    tint(255, 255);

    //the cash register on the desk
    image(cashRegister, +220, +210);

    //displays the sinterklaas decoration on the left bottom side of the shop
    image(bag, -630, +550);
    image(presents, -980, +550);

    //sinterklaas hat and present decoration. These are the window stickers on the top of the screen
    image(hat, -730, -420);
    image(hat, -900, -500);
    image(hat, -830, -310);
    image(hat, -380, -290);
    image(hat, -490, -420);
    image(hat, -590, -320);
    image(hat, -600, -500);

    image(hat, +830, -420);
    image(hat, +1000, -500);
    image(hat, +930, -310);
    image(hat, +480, -290);
    image(hat, +590, -420);
    image(hat, +690, -320);
    image(hat, +700, -500);

    image(presentBlue, +910, -400);
    image(presentBlue, -810, -480);
    image(presentBlue, +1000, -220);
    image(presentBlue, -380, -450);
    image(presentBlue, +490, -450);
    image(presentBlue, -490, -220);
    image(presentBlue, +800, -520);

    image(presentWhite, -930, -250);
    image(presentWhite, +1020, -320);
    image(presentWhite, -700, -270);
    image(presentWhite, +600, -210);
    image(presentWhite, -490, -520);
    image(presentWhite, +800, -240);
    image(presentWhite, -700, -550);

    //creates the display/screen with advertisements on it
    stroke(0, 0, 0);
    strokeWeight(2);
    line(-730, -80, -730, +10); //left line that hangs up the display
    line(-440, -80, -440, +10); //right line that hangs up the display
    strokeWeight(6);
    fill(0, 0, 0);
    rect(-760, +10, 350, 530); //the black rectangle for if the display is off
    tint(255, tintA);
    image(displayA, -760, +10); //display A
    tint(255, tintB);
    image(displayB, -760, +10); //display B
    tint(255, 255);
    popMatrix();
  }

  void update() {

    //if lightUp is true, it will make displayA visible, otherwise it will make both displayA and B invisible and the screen will be off
    if (lightUp == true) {
      if (tintA<255) {
        tintA = tintA+0.5;
      }
    } else {
      if (tintA>0) {
        tintA = tintA-0.5;
      }
      if (tintB>0) {
        tintB = tintB-0.5;
      }
    }

    //switches between displayA and B
    if (changeDisplayAtoB == true) {
      if (tintB<255) {
        tintB = tintB+0.5;
      } else {
        changeDisplayAtoB = false;
      }
    } else {
      if (changeDisplayBtoA==true) {
        if (tintB> 0) {
          tintB = tintB-0.5;
        } else {
          changeDisplayBtoA = false;
        }
      }
    }
  }

  void changeDisplayAtoB() {
    changeDisplayAtoB = true;
  }

  void changeDisplayBtoA() {
    changeDisplayBtoA = true;
  }

  //gets the boolean lightUp from the ShopWindow class
  void lightUp(boolean lightsOn) {
    lightUp = lightsOn;
  }
}
