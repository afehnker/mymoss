boolean popupVisible = false;


int popupDish;


class Popup {

  PImage iFrikandel;
  PImage iKroket;

  Popup() {
    iFrikandel = loadImage("iFrikandel.png");
    iKroket = loadImage("iKroket.png");
  }

  void show() {
    //Draw the popup when bool is set to true (and remove when set to false)
    if (popupVisible == true) {
      fill(248, 213, 63);            //Yellow
      background(100);
      rect(100, 100, 600, 400, 25);
      rectMode(CENTER);
      if (popupDish == 1) {
        image(iFrikandel, 100, 100);
      } else if (popupDish == 2) {
        image(iKroket, 100, 100);
      }
      fill(255, 0, 0);            //Red
      rect(400, 460, 150, 50);

      //Close button
      textSize(50);
      fill(255);
      text("Close", 340, 475);
    }
  }
  void closeBtn() {
    if (popupVisible == true) {
      if (320 < mouseX & mouseX < 470 & 435 < mouseY & mouseY < 480) {

        popupVisible = false;
      }
    }
  }
}
