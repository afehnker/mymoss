class ShopWindow {
  int x;
  int y;
  int tint;

  boolean open = false;
  boolean lightUp = false;

  float yfence = height;

  PImage streetSign;
  PImage logo;
  PImage opened;
  PImage closed;

  Decoration decoration1;
  Products products1;

  ShopWindow(int xPos, int yPos) {
    this.x = xPos;
    this.y = yPos;

    //load all the images and resize them
    logo = loadImage("Logo.png");
    streetSign = loadImage("streetsign.png");
    closed = loadImage("closed.png");
    opened = loadImage("open.png");

    streetSign.resize(250, 100);
    opened.resize(200, 200);
    closed.resize(200, 200);

    //create the decoration an the products in the shop
    decoration1 = new Decoration(width/2, height/2);
    products1 = new Products(width/2, height/2);
  }

  void display () {
    background(186, 77, 50);

    //draws all the white horizontal lines of the brickwall
    strokeWeight(2);
    for (int yline=30; yline<height; yline=yline+30) {
      int xlineleft = 0;
      int xlineright = width;
      stroke(255, 255, 255);
      line(xlineleft, yline, xlineright, yline);
    }

    //draws the first half of the white vertical lines of the brickwall
    for (int xline=100; xline<width; xline=xline+100) {
      int ylinetop = 0;
      int ylinebottom = 30;
      while (ylinebottom<=height+30) {
        stroke(255, 255, 255);
        line(xline, ylinetop, xline, ylinebottom);
        ylinetop = ylinetop+60;
        ylinebottom = ylinebottom+60;
      }
    }

    //draws the second half of the white vertical lines of the brickwall
    for (int xline=50; xline<width; xline=xline+100) {
      int ylinetop = 30;
      int ylinebottom = 60;
      while (ylinebottom<=height+30) {
        stroke(255, 255, 255);
        line(xline, ylinetop, xline, ylinebottom);
        ylinetop = ylinetop+60;
        ylinebottom = ylinebottom+60;
      }

      //the streetsign
      image(streetSign, 30, 750);

      //creates the white tint shop window background
      strokeWeight(1);
      stroke(0, 0, 0);
      fill (255, 244, 224);
      rect(300, 250, 2100, 1350);

      //the oblique line of the wall
      stroke(0, 0, 0);
      strokeWeight(2);
      line(2400, 1550, 2220, 1200);

      //the horizontal line of the wall
      line(300, 1160, 2220, 1160);

      //the vertical line of the wall
      line(2220, 1200, 2220, 250);

      //displays the products and decoration in the shop
      products1.display();
      decoration1.display(tint);
      decoration1.update();

      fill(130, 130, 130);
      stroke(130, 130, 130);
      //horizontal framework of the shop
      rect(300, 700, 2100, 20);
      //middle left vertical framework of the shop
      rect(1000, 250, 60, height-250);
      //middle right vertical framework of the shop
      rect(1670, 250, 60, height-250);
      //middle vertical framework of the shop
      rect(1340, 250, 60, height-250);
      //the framework above the logo
      rect(1000, 270, 700, 30);
      //the most left vertical framework of the shop
      rect(300, 250, 20, height-250);
      //the most right vertical framework of the shop
      rect(2380, 250, 20, height-250);

      //the vertical framework above the door
      rect(1000, 720, 670, 30);
      stroke(0, 0, 0);
      strokeWeight(3);
      fill(0, 0, 0, 1);
      //left black lines around the door
      rect(1030, 720, 340, height);
      //right black lines around the door
      rect(1370, 720, 330, height);

      //the door handle
      fill(170, 170, 170);
      noStroke();
      rect(1377, 1160, 15, 80);
      fill(190, 190, 190);
      rect(1380, 1180, 30, 16);

      //the left window logo
      image(logo, 450, 1350);
      //the right window logo
      image(logo, 1870, 1350);

      //the black ractangle for the logo
      fill(0, 0, 0);
      rect(1030, 290, 670, 410);
      //the logo itself
      tint(255, tint);
      image(logo, 1150, 350);
      tint(255, 255);

      //the open and close signs
      if (lightUp == true) {
        image(opened, 1100, 740);
      } else {
        image(closed, 1100, 740);
      }

      //the big grey shopwindow door that opens and closes the shop
      stroke(0, 0, 0);
      strokeWeight(1);
      fill (200, 200, 200);
      rect(300, 250, 2100, yfence-250);

      //draws all the horizontal lines of this door
      for (int yline=250; yline<yfence; yline=yline+40) {
        int xlineleft = 300;
        int xlineright = 2400;
        fill(0, 0, 0);
        line(xlineleft, yline, xlineright, yline);
      }

      //the black rectangle above the grey door
      fill(0, 0, 0);
      rect(280, 230, 2140, 40);
    }
  }

  void update() {
    //moves the grey shopwindow door up and down depending on the value of open
    if (open == true) {
      if (yfence>250) {
        yfence= yfence-2;
      }
    } else {
      if (yfence<height) {
        yfence= yfence+2;
      }
    }

    //lights up and turns off the shop lights and logos
    if (lightUp == true) {
      if (tint<255) {
        tint = tint+10;
      }
    } else if (tint>0) {
      tint = tint-10;
    }
  }

  void open() {
    //opens and closes the big grey door by changing open to true or false
    if (open == false) {
      open = true;
    } else if (lightUp == false) {
      open = false;
    }
  }

  void changeDisplayAtoB() {
    decoration1.changeDisplayAtoB();
  }

  void changeDisplayBtoA() {
    decoration1.changeDisplayBtoA();
  }

  void lightUp() {
    //lights up and turns off the shop lights and logos by changing lightUp to true or false
    if (open==true) {
      if (lightUp == true) {
        lightUp = false;
      } else {
        lightUp = true;
      }
      decoration1.lightUp(lightUp);
    }
  }
}
