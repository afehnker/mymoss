class eventHandler {

  boolean runOnce;
  float posX;
  float posY;
  Flowers[] flowersArray = new Flowers[100];

  eventHandler() {
    runOnce=false;
  }



  void startUp() {
    eventhandler.respawn();
    lamp1.lampSwing =  PI/5.0 * cos( map( millis()%3000, 0, 3000, 0, TWO_PI) );      //makes the lamps swing using cos, map
    lamp2.lampSwing =  PI/5.0 * cos( map( millis()%7000, 0, 7000, 0, TWO_PI) );
    if (runOnce==false) {
      for (int i=0; i<flowersArray.length; i=i+1) {
        posX= random(100, 600);
        posY= random(600, 800);
        float flowersSpeed=random(1.5, 3);
        float flowersRotation= random(PI, 2*PI);


        flowersArray[i]= new Flowers(posX, posY, flowersSpeed, flowersRotation);
        runOnce=true;
      }
    }

    for (int i=0; i<flowersArray.length; i=i+1) {
      flowersArray[i].display();
      if (falling==true) {
      }
    }



    if (falling==true) {
      for (int i=0; i<flowersArray.length; i=i+1) {
        // flowersArray[i].autumn();
        flowersArray[i].fall();

        clock.list=0;
      }
    }
    if (growing == true) {
      for (int i=0; i<flowersArray.length; i=i+1) {
        //flowersArray[i].spring();
        flowersArray[i].grow();
      }
    }
  }



  void respawn() {
    if (mousePressed ) {
      for (int i=0; i<flowersArray.length; i=i+1) {
        flowersArray[i].reset();
      }
    }
  }
}
