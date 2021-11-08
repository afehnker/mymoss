class Snack {

  PImage kroket, frikandel, kaassouffle;
  float snackX, snackY;
  int snackCode;


  Snack(float initX, float initY, int initS) { //Loading the snack images for display in the windows
    snackX = initX;
    snackY = initY;
    snackCode = initS;
    kroket = loadImage("kroket.png");
    frikandel = loadImage("frikandel.png");
    kaassouffle = loadImage("kaassouffle.png");
  }

  void display() { //Displaying the different snacks
    if (snackCode == 0) {
      image(kroket, snackX, snackY, kroket.width/2, kroket.height/2);
    }
    if (snackCode == 1) {
      image(frikandel, snackX, snackY, frikandel.width/1.5, frikandel.height/1.5);
    }

    if (snackCode == 2) {
      image(kaassouffle, snackX, snackY);
    }
  }
}
