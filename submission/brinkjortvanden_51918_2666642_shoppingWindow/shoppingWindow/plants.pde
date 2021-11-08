// is used to display the plants

class plant {
  PVector posPlant;
  PImage plant;
  boolean small; // dicates the scale down 

  plant(float initX, float initY, String Plant, boolean Small) {
    posPlant = new PVector(initX, initY);
    plant = loadImage(Plant);
    small = Small;
  }

  void display() {
    if (small) {
      image(plant, posPlant.x, posPlant.y, width/8, width/8);
    } else {
      image(plant, posPlant.x, posPlant.y, width/2.5, width/2.5);
    }
  }


}
