/* 
 
 Dille & Kamille Shop Window Program made by Rosalie Luff and Natan van Bergem.
 All illustrations made by Rosalie Luff and Natan van Bergem.
 
 The bees have lost their sense of smell. You have to help them find the plants on the shelves!         
 Press and wiggle you mouse over a plant to show the bees where to go.
 
 The bird is happily pecking on the shelf, but what if you scare it?                                    
 Click on the bird to scare it away. If it's already in the nest, tell it to return to the shelf by clicking on it again.
 
 The butterfly is minding its own business, you wouldnt want to stun it would you...?                   
 Click on the butterfly to see it freeze in midair. Click again to allow it to carry on flying.
 */


Birb birb;
Nest nest;
Bee[] bees = new Bee[8];
Butterfly butterfly;
Basket[] basket = new Basket[5];
BirdHouse[] birdHouse = new BirdHouse[5];
Plant[] plant = new Plant[5];
PlantPot[] plantPot = new PlantPot[5];
ShelfPlant[] shelfPlant = new ShelfPlant [5];

int number1;
int number2;
int nestTime;
PImage shopBackground;

void setup() {
  size(1536, 864);                                                                                                //size of background image
  imageMode (CENTER);
  rectMode(CENTER);
  number1 = int (random(1, 5));                                                                                   //number to choose ratio of plantpots to birdhouses
  number2 = int (random(1, 5));                                                                                   //number to choose ratio of baskets to shelfplants
  shopBackground = loadImage("shopBackground.png");

  //x values in for loops written so that there is a minimum distance between the images so that they do not appear directly on top of eachother
  for (int i = 1; i <= plantPot.length; i++) {
    plantPot[i-1] = new PlantPot (width*1/5+100+i*random(200, 300), height*1/2-5);                                //starts at left side of top shelf
  }

  for (int i = 0; i < plant.length; i++) {
    plant[i] = new Plant (plantPot[i].plantPotX, plantPot[i].plantPotY - 130);                                   //plants appear inside the pots
  }

  for (int i = 1; i <= birdHouse.length; i++) { 
    birdHouse[i-1] = new BirdHouse (width*4/5-50 - i*random(200, 300), height*1/2-40);                            //starts at right side of top shelf
  }

  for (int i = 0; i < basket.length; i++) {
    basket[i] = new Basket (width*1/5+100+i*random(300, 400), height*3/4-50);                                     //starts at left side of middle shelf
  }

  for (int i = 0; i < shelfPlant.length; i++) {
    shelfPlant[i] = new ShelfPlant (width*4/5-50 - i*random(200, 300), height*3/4+40);                            //starts at right side of middle shelf
  }

  for (int i = 0; i < bees.length; i++) {
    bees[i] = new Bee (random(100, width-100), random(100, height-100));
  }

  birb = new Birb (width*1/3, height*1/2-10);                                                                     //starts on top shelf
  nest = new Nest (width*1/9, height*1/7);                                                                        //top left corner
  butterfly = new Butterfly (random(500, width-500), random(500, height-500));
}

void draw() {
  background(shopBackground);

  for (int i = 0; i < plant.length - number1; i++) {
    plant[i].display();
  }

  for (int i = 0; i < plantPot.length - number1; i++) {
    plantPot[i].display();
  }

  for (int i = 0; i < number2; i++) {
    basket[i].display();
  }

  for (int i = 0; i < shelfPlant.length - number2; i++) {
    shelfPlant[i].display();
  }
  for (int i = 0; i < bees.length; i++) {
    bees[i].display();
    bees[i].move();
  }

  for (int i = 0; i < number1; i++) {
    birdHouse[i].display();
  }

  birb.display();
  birb.walk();
  birb.pecc();
  birb.flee();
  birb.shelf();
  if (dist(birb.birbX, birb.birbY, nest.nestX+15, nest.nestY-25) <=10) {                                          //birb stops moving when in the nest
    birb.fleeSpeed = 0;
  }
  if (dist(birb.birbX, birb.birbY, width*1/3, height*1/2-10) <=5) {                                               //birb continues peccing when back on the shelf
    birb.shelfSpeed = 0;
    birb.isFlying = false;
  }

  butterfly.display();
  butterfly.fly();

  nest.display();
}

void mousePressed() {
  if (birb.mouseOverBirb(mouseX, mouseY)) {                                                                       //isFLying set to true when birb is clicked on
    birb. isFlying = true;
    if (dist(birb.birbX, birb.birbY, nest.nestX+15, nest.nestY-25) <=10) {                                        //if clicked on whilst in nest, birb returns to shelf
      birb.isReturning = true;
      birb.shelfSpeed = 10;
    } else {                                                                                                      //if clicked on whilst not in nest, birb flies to nest
      birb.isReturning = false;
      birb.fleeSpeed = 10;
    }
  }
  if (butterfly.mouseOverButterfly(mouseX, mouseY)) {                                                             //checks mouse position for stunning the butterfly
    butterfly.isStunned = !butterfly.isStunned;
  }
}

void mouseDragged() {                                                                                            //helping the bees to the find plants - they follow the mouse if the cursor is over the plant
  for (int i = 0; i < plant.length - number1; i++) {
    for (int j = 0; j < shelfPlant.length; j++) {
      for (int k = 0; k < bees.length; k++) {
        if ((plant[i].mouseOverPlant(mouseX, mouseY))||(shelfPlant[j].mouseOverShelfPlant(mouseX, mouseY))) {
          bees[k].smellFlower(mouseX, mouseY);
        }
      }
    }
  }
}
