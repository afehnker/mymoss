/*=================
 Final project designed and created by An, Hielke
 The store we chose is the Fare Juwlery downtown Enschede
 All designs and images are from Hielke.
 The scene changing code is written by An.
 The ideal of the game are both came up by Hielke and An
 Written in Processing, using Processing documentation, designs in Illustrator
 =================*/

/*=================
 The goal is to rob the golden necklace for money to buy a new playstation
 you need to steal it without triggering the alarm and have to do so before 3a.m
 Put the necklace in the black bag and you will win.

 =================*/


PImage shop, road, bag;
Timer time;
Alarm alarm;
Necklace necklace;
Window window;
Door door;
Key key1;

boolean isBroken = false;
boolean isLocked = true;

int headlineSize = 50;
float textPositionX;
float textPositionY;
float shopX, shopY, windowX, windowY, bagX, bagY;

String gameState;

void setup() {
  fullScreen();
  smooth();
  frameRate(60);
  rectMode(CENTER);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);

  gameState = "GAMEPLAY";
  textPositionX = width/2;
  textPositionY = height/2;
  shopX = width/10;
  shopY = height/10;
  bagX = width-300;
  bagY = 700;

  time = new Timer();
  alarm = new Alarm();
  necklace = new Necklace(shopX, shopY);
  window = new Window(shopX, shopY);
  key1 = new Key(shopX, shopY);
  door = new Door();
  shop = loadImage("shop.png");
  road = loadImage("pngwing.com.png");
  bag = loadImage("bag.png");
}

void draw() {
  background(200);

  switch(gameState) {
  case "GAMEPLAY":
    image(shop, shopX, shopY);
    image(road, 0, height-560, width, 600);
    image(bag, bagX, bagY, 200, 200);
    necklace.display();
    necklace.collide();
    door.display();
    door.open();
    key1.display();
    key1.collide();
    window.display();
    time.display();
    time.count();
    alarm.display();
    alarm.update();
    break;
  case "GAMEWIN":
    gameWin();
    break;
  case "GAMEOVER":
    gameOver();
    break;
  default:
    break;
  }
}

void mouseClicked() {
  if ((mouseX - (shopX+420))*(mouseX - (shopX+420)) + (mouseY - (shopY+350))*(mouseY - (shopY+350)) <= 32000 && !isBroken) {
    alarm.raise();
  }
}

void mouseDragged() {
  if (isBroken && isLocked) {
    key1.move(mouseX, mouseY);
  } else if (isBroken && !isLocked) {
    necklace.move(mouseX, mouseY);
  }
}

void mousePressed() {
  door.checking(mouseX, mouseY);
  window.update(mouseX, mouseY);
}

void mouseReleased() {
  door.reset();
}

void gameWin() {
  background(0, 200, 255);
  fill(0);
  textSize(headlineSize);
  text("You now have the money to buy playstation5. Yeet!!!", textPositionX, textPositionY);
}

void gameOver() {
  background(0);
  fill(255);
  textSize(headlineSize);
  text("You have triggered the alarm and have been caught by the police. Bruh", textPositionX, textPositionY);
}
