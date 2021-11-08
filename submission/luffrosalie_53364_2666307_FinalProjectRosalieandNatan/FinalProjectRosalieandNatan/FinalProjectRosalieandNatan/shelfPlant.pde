/*
 shelfPlants appear on top shelf.
 These are randomised decoration.
 
 Bees attracted to plants :)
 
 Code written by Rosalie Luff
 */

class ShelfPlant {
  float shelfPlantX;
  float shelfPlantY;
  int shelfPlantNumber;
  PImage shelfPlant1;
  PImage shelfPlant2;

  ShelfPlant(float initShelfPlantX, float initShelfPlantY) {
    shelfPlantX = initShelfPlantX;
    shelfPlantY = initShelfPlantY;
    shelfPlantX = constrain(shelfPlantX, width*1/5+150, width*4/5-50);                  //constrained to the width of the shelf
    shelfPlantNumber = int (random(1, 3));                                              //random number generated to choose which of the 2 shelfPlants will be displayed each time the programme is run
    shelfPlant1 = loadImage ("shelfPlant1.png");
    shelfPlant2 = loadImage ("shelfPlant2.png");
  }

  void display() {
    if (shelfPlantNumber == 1) {
      image (shelfPlant1, shelfPlantX, shelfPlantY, 504*1/2, 422*1/2);
    } else {
      image (shelfPlant2, shelfPlantX, shelfPlantY+20, 602*1/2, 372*1/2);
    }
  }

//boolean to check if the mouse is over the shelf plant
  boolean mouseOverShelfPlant(float initMouseX, float initMouseY) {
    if (
      initMouseX <= shelfPlantX+125 && 
      initMouseX >= shelfPlantX-125 &&
      initMouseY <= shelfPlantY+100  &&
      initMouseY >= shelfPlantY-100) {
      return true;
    } else {
      return false;
    }
  }
}
