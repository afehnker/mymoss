//birdhouse class so the main tab is less cluttert
class birdHouses {
  //initialize four birdhouse
  birdHouse birdHouse1;
  birdHouse birdHouse2;
  birdHouse birdHouse3;
  birdHouse birdHouse4;

  birdHouses() {
    // Initialize the 4 bird houses
    birdHouse1 = new birdHouse(width * -0.1525, height * 0.185, 1.03);
    birdHouse2 = new birdHouse(width * 0.87, height * 1.16, 0.52);
    birdHouse3 = new birdHouse(width * 0.05, height * 1.13, 0.53);
    birdHouse4 = new birdHouse(width * -0.2175, height * -0.0675, 0.54);
  }

  void display() {
    // Display the 4 birdhouses
    birdHouse1.display();
    birdHouse2.display();
    birdHouse3.display();
    birdHouse4.display();
  }
}
