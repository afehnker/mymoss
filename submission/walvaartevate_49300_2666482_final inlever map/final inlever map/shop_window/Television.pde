/* This is the class of the television. The television can be turned on by clicking on the 'on' button displayed in the bottom
right corner of the television. If the television is turned on, the on button will get the color green, the off button will get 
the color black and a creature will be displayed on the screen which will move. When the television is turned off (by clickin on the
'off' button, on the right side of the 'on' button, the screen will become black, the 'on' button will get the color back again and the 'off' button
 will get the color red again. For more infomation about what will be displayed on the screen when it is turned on, go to class TelevisionScreenOn. */

class Television {
  int xTelevision;
  int yTelevision;
  int xTelevisionSize;
  int yTelevisionSize;
  float xButton;
  float yButton;
  int green=0;
  int red=255;
  boolean tvOn = false;


  Television(int initXTelevision, int initYTelevision) {
    xTelevision = initXTelevision;
    yTelevision = initYTelevision;
    xTelevisionSize = 220;
    yTelevisionSize = 180;
  }

  void display() {
    fill(215, 172, 98);
    pushMatrix();
    translate(xTelevision, yTelevision);
    rect(0, 0, xTelevisionSize, yTelevisionSize, 20);//back layer of Television
    fill(0);
    rect(-0.5*xTelevisionSize+20, 0.5*yTelevisionSize+10, 20, 20); //foot on the right
    rect(0.5*xTelevisionSize-20, 0.5*yTelevisionSize+10, 20, 20); //foot on the left
    rect(0, -8, 180, 135, 30);//screen

    //buttons to turn the television on or off
    xButton=xTelevisionSize*(-0.30);
    yButton =yTelevisionSize*0.4+4;

    //changes the color of the 'on' and 'off' buttons
    if (tvOn == true) {
      red = 0;
      green =160;
    } else {
      green = 0;
      red = 255;
    }
    //'on' button
    fill(0, green, 0);
    ellipse(xButton, yButton, 20, 20);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(10);
    text("ON", xButton, yButton);
    //'off' button
    fill(red, 0, 0);
    ellipse(xButton+30, yButton, 20, 20);
    textAlign(CENTER, CENTER);
    textSize(10);
    fill(255);
    text("OFF", xButton +30, yButton);

    popMatrix();
  }

  void update(int initXmouse, int initYmouse) {
    int xMouse = initXmouse;
    int yMouse = initYmouse;
    if (dist(xButton+xTelevision, yButton+yTelevision, xMouse, yMouse)<=10) {
      tvOn = true; //turns on television
    }
    if (dist(xButton+xTelevision+30, yButton+yTelevision, xMouse, yMouse)<=10 && tvOn==true) {
      tvOn = false; //turns off television
    }
  }
}
