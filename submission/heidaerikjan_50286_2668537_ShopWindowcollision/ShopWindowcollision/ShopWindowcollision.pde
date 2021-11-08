
//initializing 
Bottle[] bottles = new Bottle[10];
Vodka[] vodkas = new Vodka[10];

//selecting image variables
PImage img;
PImage gall;
PImage wine;
PImage shop;
PImage wood;
PImage vodka;
PImage door;
PImage on;
PImage off;
PImage brokenBottle;
PImage brokenVodka;

//global variable
float bounce = 0.02;

void setup() {
  //setting program field size
  size(1820, 980, P2D);

  //loading images
  img = loadImage("brick.jpg");
  gall = loadImage("gallgall.png");
  shop = loadImage("gallgall.jpg");
  wine = loadImage("wine.png");
  wood = loadImage("wood.jpg");
  vodka = loadImage("vodka.png");
  door = loadImage("door.png");
  on = loadImage("on.png");
  off = loadImage("off.png");
  brokenBottle = loadImage("brokenBottle.png");
  brokenVodka = loadImage("brokenVodka.png");

  //creating variables for classes
  for (int i = 0; i < 10; i++ ) {
    bottles[i] = new Bottle(random(width), random(580, 590), 80, i, bottles);
    vodkas[i] = new Vodka(random(width), random(260, 270), 80, i, vodkas);
  }
}

void draw() {
  background(135);
  noStroke();

  //selecting image as background (using it in background() didn't work)
  image(shop, 0, 0, width, height);

  //voids from the classes that have to be run
  for (int i = 0; i < 10; i++ ) {
    bottles[i].update();
    bottles[i].collide();
    bottles[i].display();
  }
  for (int i = 0; i < 10; i++ ) {
    vodkas[i].update();
    vodkas[i].collide();
    vodkas[i].display();
  }

  //images that go infront of the images created by the classes
  image(wood, 1055, 550, 760, 30);
  image(wood, 0, 550, 780, 30);
  image(img, 0, 0, 50, height); 
  image(img, 1770, 0, 50, height); 
  image(wood, 40, 0, 15, height); 
  image(wood, width-55, 0, 15, height); 
  image(gall, 0, 0, width, 200);
  image(door, 760, 190, 300, 830);
  image(on, 0, 400, 40, 40);
  image(off, 0, 440, 40, 40);  

  //turn off the inside and outside light of the store with the buttons
  if (mousePressed) {
    if ((mouseX > (0) && mouseX < (40)) &&
      (mouseY > (440) && mouseY < (480))) {
      tint(50);
    }
    if ((mouseX > (0) && mouseX < (40)) &&
      (mouseY > (400) && mouseY < (440))) {
      noTint();
    }
  }
}
