class Remote {
  float x;
  float y;

  Buttons[] button = new Buttons[6];

  boolean ledOn = false;

  PImage img=loadImage("off.png"); //background image starts with led off

  //button colors
  color  r = color(255, 0, 0);
  color b = color(0, 42, 255);
  color g = color(72, 255, 0);
  color p = color(255, 0, 217);
  color ye = color(255, 255, 0);
  color w = color(255);

  Remote(float remoteX, float remoteY) {
    x = remoteX;
    y = remoteY;
    button[0] = new Buttons(x+64, y+24, w);
    button[1] = new Buttons(x+24, y+24, r);
    button[2] = new Buttons(x+24, y+61, b);
    button[3] = new Buttons(x+24, y+98, g);
    button[4] = new Buttons(x+64, y+61, p);
    button[5] = new Buttons(x+64, y+98, ye);
  }


  void display() {
      //remote dispalys the backround so it can be changed
    background(img);

    //table
    stroke(0);
    strokeWeight(2);
    line(0, 400, 900, 400);

    //remote
    strokeWeight(1);
    rectMode(CORNER);
    fill(255, 255, 255);
    rect(x, y, 90, 140,8);
    strokeWeight(1.5);
    fill(100);
    rect(x+9, y+9, 73, 105,8);

    //buttons
    for (int i = 0; i < 6; i++) {
      button[i].display();
    }

    //on-off symbol
    fill(w);
    ellipse(x + 64, y + 24, 10, 10);
    noStroke();
    rect(x + 62, y + 18, 5, 5);
    strokeWeight(2);
    stroke(0);
    line(x + 64, y + 25, x + 64, y + 18);
  }


  void changeColor(int posX, int posY ) {
      //if you press on the on/off button the background image changes from led off to led on if led is off and viceversa
    if (dist(button[0].x, button[0].y, posX, posY) < 10) {
      if (ledOn) {
        img = loadImage("off.png");
        ledOn = false;
      } else {
        img = loadImage("on.png");
        ledOn = true;
      }
    }
    //if you press on the color buttons the background image changes to the color of the selected button and so the led is on
    if (dist(button[1].x, button[1].y, posX, posY) < 10) {
      img = loadImage("red.png");
      ledOn = true;
    }
    if (dist(button[2].x, button[2].y, posX, posY) < 10) {
      img = loadImage("blue.png");
      ledOn = true;
    }
    if (dist(button[3].x, button[3].y, posX, posY) < 10) {
      img = loadImage("green.png");
      ledOn = true;
    }
    if (dist(button[4].x, button[4].y, posX, posY) < 10) {
      img = loadImage("pink.png");
      ledOn=true;
    }
    if (dist(button[5].x, button[5].y, posX, posY) < 10) {
      img = loadImage("yellow.png");
      ledOn=true;
    }
  }
}
