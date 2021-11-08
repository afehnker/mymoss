/*
Birdhouses appear on the top shelf.
 These are randomised decorations.
 
 Code written by Rosalie Luff
 */

class BirdHouse {
  float birdHouseX;
  float birdHouseY;
  int birdHouseNumber;
  PImage birdHouse1;
  PImage birdHouse2;

  BirdHouse(float initBirdHouseX, float initBirdHouseY) {
    birdHouseX = initBirdHouseX;
    birdHouseY = initBirdHouseY;
    birdHouseX = constrain(birdHouseX, width*1/5+100, width*4/5-50);              //constrained to the width of the shelf
    birdHouseNumber = int (random(1, 3));                                         //random number generated to choose which of the 3 birdhouses will be displayed each time the programme is run
    birdHouse1 = loadImage("birdHouse1.png");
    birdHouse2 = loadImage("birdHouse2.png");
  }

  void display() {
    if (birdHouseNumber == 1) {
      image(birdHouse1, birdHouseX, birdHouseY-25, 238*2/3, 330*2/3);             //scaled to appropriate size
    } else {
      image(birdHouse2, birdHouseX, birdHouseY-5, 122*2/3, 274*2/3);              //scaled to appropriate size
    }
  }
}
