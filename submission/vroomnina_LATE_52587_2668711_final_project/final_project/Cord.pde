//Array of cord units, positioning logic for each cord unit

class Cord {

  int numUnits;
  CordUnit[] units;
  float x;
  float y;
  
  PVector totalTranslation;

  //initialize the position and units
  Cord(float initX, float initY, int cableLength) {
    x = initX;
    y = initY;

    numUnits = cableLength;
    units = new CordUnit[numUnits];
    totalTranslation = new PVector(0,0);

    for (int i = 0; i < numUnits; i++) {
      units[i] = new CordUnit(random(-PI, PI));
      totalTranslation.add(new PVector(-units[i].l*sin(units[i].rotation), units[i].l*cos(units[i].rotation)));
    }
  }

  //draw each unit
  void display() {
    pushMatrix();
    translate(x, y);
    for (int i = 0; i < numUnits; i++) {
      units[i].display();
    }
    popMatrix();
  }

  //place each unit at the correct location
  void update() {
    totalTranslation = new PVector(0,0);
    for (int i = 0; i < numUnits; i++) {
      units[i].update(totalTranslation.x, totalTranslation.y);
      totalTranslation.add(new PVector(-units[i].l*sin(units[i].rotation), units[i].l*cos(units[i].rotation)));
    }
  }
  
  //randomize the rotation of each generally in the direction of the mouse
  void drag(float mx, float my) {
    PVector mousePos = new PVector(mx-x, my-y);
    for (int i = 0; i < numUnits; i++) {
      if(mousePos.heading() < -PI/2) {
        units[i] = new CordUnit(mousePos.heading()-PI/2+random(-1, 1)+2*PI);
      } else {
        units[i] = new CordUnit(mousePos.heading()-PI/2+random(-1, 1));
      }
    }
  }
}
