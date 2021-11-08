class Production {

  float productionX;
  float productionY;

  Production(float initX, float initY) { 
    productionX = initX; 
    productionY = initY;
  } 

  void display() {
    //Assemblyline
    fill(0);
    rect(productionX, productionY, 700, 100);

    //back
    fill(220, 220, 220);
    rect(productionX, productionY, 700, 10);    

    //front
    fill(220, 220, 220);
    rect(productionX, productionY+60, 700, 40);

    //background
    fill(255);
    rect(productionX, productionY+120, 1800, 900);

    image(drip, productionX, productionY+120, 200, 70);
    image(drip, productionX+200, productionY+120, 200, 70);
    image(drip, productionX+400, productionY+120, 200, 70);
    image(drip, productionX+600, productionY+120, 200, 70);
    image(drip, productionX+800, productionY+120, 200, 70);
    image(drip, productionX+1000, productionY+120, 200, 70);
    image(drip, productionX+1200, productionY+120, 200, 70);
    image(drip, productionX+1400, productionY+120, 200, 70);
    image(drip, productionX+1600, productionY+120, 200, 70);
  }
}
