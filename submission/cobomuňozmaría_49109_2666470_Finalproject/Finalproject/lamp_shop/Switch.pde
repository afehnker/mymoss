class Switch {
  float x;
  float y;
  float switchPos;

  Standinglamp lampz;

  SoundFile switchSound;

  Switch(float posX, float posY) {
    x = posX;
    y = posY;
    switchPos=38;                   //off position
    lampz=new Standinglamp(0, 0);
    switchSound = new SoundFile(lamp_shop.this, "switch.mp3");
  }

  void display() {
    pushMatrix();
    translate(x, y);              //Everything is now relative to x and y, the position of the switch

    lampz.display();              //the standing lamps are also relative to the switch position

    //lightswitch
    strokeWeight(1);
    fill(255);                                    
    rect(0, 0, 35, 65, 8);
    strokeWeight(2);
    rect(13, 20, 10, 27);
    //screws
    ellipse(18, 11, 3, 3);
    ellipse(18, 57, 3, 3);
    //mobile part
    fill(0);
    rect(13, switchPos, 10, 9); 

    popMatrix();                  //Now everything is normal again
  }


  void turn(int posX, int posY) {
    if (posX>x && posX<x+35 && posY>y && posY<y+65) {  //checks if position is within the switch 
      switchSound.play(); 
      lampz.light();             //turns on/off the lights
      if (switchPos==38) {       //if off, change switch position to on
        switchPos=20;
      } else {                   //viceversa
        switchPos=38;
      }
    }
  }
}
