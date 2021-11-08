import processing.sound.*;


class Shop {
  PImage steve, slenderman, jumpscare, sonic, shoppa, window;
  float doorX = width;
  float door2X = width;
  float doorY = height;
  float door2Y = height;
  float shopX =1600;
  float shopY = 50;
  int windowX = 700;
  int windowY = 750;
  int steveX = 200;
  int steveY = height - 400;
  int speedX = 5;
  int speedY = 5;
  boolean isOpen, jumpScare, steveSelect, sonicSelect;
  PImage[] gameIcons;
  int gamesAmount = 2;
  PVector[] gameLoc = new PVector[gamesAmount];
  boolean marioSelect, fifaSelect; 

  Shop(PImage[] gameIcons) {
    shop = loadImage("shop.png");
    steve = loadImage("steve.png");
    steve.resize(400, 320);
    slenderman = loadImage("slenderman.png");
    jumpscare = loadImage("jumpscare.jpg");
    sonic = loadImage("sonic.png");
    sonic.resize(400, 320);
    shoppa = loadImage("shoppa.jpg");
    shoppa.resize(1920, 1080);    
    window = loadImage("window.png");
    window.resize(windowX, windowY);
    this.gameIcons = gameIcons;
    gameLoc[0] = new PVector(180, height- 400); // mario
    gameLoc[1] = new PVector(180, height - 500); // fifa
  }

  void display() {
    image(shoppa, 0, 0); //brick background 
    image(window, 50, 250);
    for (int i = 0; i < gamesAmount; i++) {
      image(gameIcons[i], gameLoc[i].x, gameLoc[i].y);
    }
    fill(0);
    rect(0, 0, 1920, 200); //black stroke
    pushStyle();
    strokeWeight(5);
    fill(40);
    rect(width-900, height -600, 600, 600); //background door
    fill(20);
    rect(doorX -600, doorY -600, 300, 600); //door 
    rect(door2X -900, door2Y -600, 300, 600); //door
    textSize(120);
    fill(255);
    text("GAMESHOP TWENTE", 100, 150);
    image(shop, shopX, shopY);
    image(steve, steveX, steveY);
    image(sonic, 430, height -410);
    pushStyle();
    fill(168, 204, 215, 90);
    rect(50, 250, windowX, windowY); //window
    popStyle();

    if (isOpen == true) {
      pushStyle();
      tint(80, 80);
      slenderman.resize(600, 750);
      image(slenderman, width-900, height -600);
      popStyle();
    }
    
    if (jumpScare == true) {
      background(0);
      jumpscare.resize(1920, 1080);
      image(jumpscare, 0, 0);
      if (!scream.isPlaying()) {
        scream.play();
      }
    }
  }

  void openDoors(int mX, int mY) {
    if (mX > width -900 && mX < width -300 && mY >height -600 && mY< height) {
      isOpen = true;
      animationOpen();
    } else if (isOpen) {
      animationClose(); 
      isOpen = false;
    }
  }

  void animationOpen() {
    doorX = width +200;
    door2X = width -200;
  }

  void animationClose() {
    doorX = width - 300;
    door2X = width + 300;
  }
  void jumpscare(int mX, int mY) {
    if (dist(mX, mY, shopX + 113, shopY+72) < 130) {
      jumpScare = true;
    } else {
      jumpScare = false;
      scream.stop();
    }
  }

  void moveCharacters() {
    steveX = steveX + speedX;

    if (steveX <= 15 || steveX >= 360) {
      speedX = -speedX;
    }
    steveY = steveY + speedY;
    if (steveY <= 246 || steveY >= height -395 ) {
      speedY = -speedY;
    }
  }
}
