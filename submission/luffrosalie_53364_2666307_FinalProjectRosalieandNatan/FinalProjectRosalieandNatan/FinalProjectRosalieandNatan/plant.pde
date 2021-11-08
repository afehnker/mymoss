/*
Plants appear on the top shelf.
Locations dependant on plantpot location.

Bees attracted to plants :)

Code written by Rosalie Luff
*/

class Plant {
  float plantX;
  float plantY;
  int plantNumber;
  boolean mouseOver;
  PImage plant1;
  PImage plant2;
  PImage plant3;

  Plant(float initPlantX, float initPlantY) {
    plantX = initPlantX;
    plantY = initPlantY;
    plantX = constrain(plantX, width*1/5+100, width*4/5-50);                    //constrained to the top shelf
    plantNumber = int (random(1, 4));                                           //random number generated to choose which of the 3 plants will be displayed each time the programme is run
    plant1 = loadImage ("plant1.png");
    plant2 = loadImage ("plant2.png");
    plant3 = loadImage ("plant3.png");
  }

  void display() {
    if (plantNumber == 1) {
      image (plant1, plantX, plantY, 223, 264);
    } else if (plantNumber == 2) {
      image (plant2, plantX, plantY, 223, 264);
    } else {
      image (plant3, plantX, plantY+10, 231, 165);
    }
  }

//boolean to check if the mouse is over the plant
  boolean mouseOverPlant(float initMouseX, float initMouseY) {
    if (
      initMouseX <= plantX+113 && 
      initMouseX >= plantX-113 &&
      initMouseY <= plantY+100  &&
      initMouseY >= plantY-100) {
      return true;
    } else {
      return false;
    }
  }
}
