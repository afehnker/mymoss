/*=================
 The rain code is written and designed by An.
 
 ==================
 This is the rain generator class. This class consist of one smaller class, which is the drop class of the rain.
 The class rain will call an array of drops object and then generate them randomly on the x axis. 
 If the drops fall out of the screen, they will be teleported back to the start.
 The drop will also generate randomly from size, speed to how far it is.
 
 The class rain doesn't have any interaction but it makes for some visual pleasure.
 =================*/

class Rain {

  int rainAmount = 600;
  Drop[] drop = new Drop[rainAmount];

  Rain() {
    for ( int i = 0; i < drop.length; i++) {
      drop[i] = new Drop();
    }
  }

  void rainFall() {
    for (int i = 0; i < drop.length; i++) {
      drop[i].dropShow();
      drop[i].dropFall();
    }
  }
}

class Drop {

  float dropX = random(width);
  float dropY = random(-height, -50);
  float dropZ = random(0, 20);

  void dropShow() {
    float len = map(dropZ, 0, 20, 10, 15);
    float dropShape = map(dropZ, 0, 20, 1, 2.5);

    strokeWeight(dropShape);
    stroke(#7673fb);
    line(dropX, dropY, dropX, dropY - len);
  }

  void dropFall() {
    float ySpeed = map(dropZ, 0, 20, 10, 20);
    float grav = map(dropZ, 0, 20, 0.1, 0.18);

    dropY = dropY + ySpeed;
    ySpeed = ySpeed + grav;
    
    
    // reuse the drop
    if (dropY > height) {
      dropY = random(-height, -10);
      ySpeed = map(dropZ, 0, 20, 10, 20);
    }
  }
}
