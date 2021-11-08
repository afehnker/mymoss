class Shop {
  float shopX ;
  float shopY ; 
  color windowColor;
  int logoWidth;
  int logoHeight;
  PImage logo1;
  PImage deadpool;
  PImage wolverine;
  PImage spiderman;
  int charWidth;
  int charHeight;

  Shop(int initX, int initY) {
    shopX = initX;
    shopY = initY;
    windowColor = color(101, 225, 255);
    logoWidth = 200;
    logoHeight = 150;
    charWidth = 150;
    charHeight = 150;
    logo1 = loadImage("comicasa.png");
    logo1.resize(logoWidth, logoHeight);
    spiderman = loadImage("spiderman.png");
    spiderman.resize(charWidth+30, charHeight+30);
    deadpool = loadImage("deadpool.png");
    deadpool.resize(charWidth, charHeight);
    wolverine = loadImage("wolverine.png");
    wolverine.resize(charWidth+90, charHeight+40);
  }
  void display() {
    //draws the shop
    strokeWeight(2.5);
    color(255);
    rect(shopX, shopY, 1200, 700); // MAIN SQUARE OUTSIDE

    for (float i = shopX +20; i<=shopX + 260; i = i +240) {
      fill(windowColor);
      rect(i, shopY+20, 220, 190); //Window 1
      fill(255, 255, 255);
    }

    for (float i = shopX +720; i<=shopX + 970; i = i +250) {
      fill(windowColor);
      rect(i, shopY+20, 220, 190); //Window 1
      fill(255, 255, 255);
    }
    fill(windowColor);
    rect(shopX+505, shopY+20, 190, 170); //Window in the mid
    fill(255, 255, 255);

    for (float i = shopX+20; i<=shopX + 720; i = i + 700) {
      fill(windowColor);
      rect(i, shopY+230, 460, 430); // display window on the left
      fill(255, 255, 255);
    }

    for (float l = shopY+460; l<= shopY+610; l = l + 50) {
      rect(shopX+720, l, 300, 50);
    }
    for (float i = shopX+150; i <= shopX+850; i = i + 700) {
      image(logo1, i, shopY+300);
    }
  }
  void update(int whichAction) {
    // according to which action is initiated it draws a certain character
    if (whichAction ==1 ) {
      image(deadpool, shopX+525, shopY+40);
    } else if (whichAction == 2) {
      image(wolverine, shopX+965, shopY+25);
    } else if (whichAction == 3) {
      image(spiderman, shopX+62, shopY+25);
    }
  }
  float originalX() {
    // returns the shopX
    return shopX;
  }
  float originalY() {
    // returns the shopY
    return shopY;
  }
 
}
