/*
 In this program a part of the shopwindow of house of snobs in Enschede centre.
 
 Made by Ashley Braaksma and Emma Burema
 */
 
shopwindow shopwindow1;

void setup() {
  fullScreen();
  shopwindow1 = new shopwindow();
}

void draw() {
  shopwindow1.display();
}

void mouseClicked() {
  shopwindow1.moveGradientRight();
}


void keyPressed() {
  shopwindow1.lightsOnOff();
}
