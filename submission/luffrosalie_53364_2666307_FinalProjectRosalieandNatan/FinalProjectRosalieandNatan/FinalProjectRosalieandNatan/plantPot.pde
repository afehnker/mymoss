/*
Plantpots appear on top shelf.
These are randomised decoration.

Code written by Rosalie Luff
*/

class PlantPot {
  float plantPotX;
  float plantPotY;
  int plantPotNumber;
  PImage plantPot1;
  PImage plantPot2;
  PImage plantPot3;

  PlantPot(float initPlantPotX, float initPlantPotY) {
    plantPotX = initPlantPotX;
    plantPotY = initPlantPotY;
    plantPotX = constrain(plantPotX, width*1/5+100, width*4/5-50);                  //constrained to the width of the shelf
    plantPotNumber = int (random(1, 4));                                            //random number generated to choose which of the 3 plantpots will be displayed each time the programme is run
    plantPot1 = loadImage ("plantPot1.png");
    plantPot2 = loadImage ("plantPot2.png");
    plantPot3 = loadImage ("plantPot3.png");
  }

  void display() {
    if (plantPotNumber == 1) {
      image (plantPot1, plantPotX, plantPotY, 498, 148-30);
    } else if (plantPotNumber == 2) {
      image (plantPot2, plantPotX, plantPotY, 464*4/5, 147*4/5);
    } else {
      image (plantPot3, plantPotX, plantPotY, 75, 89);
    }
  }
}
