class Paintings {

  Paintings(boolean click1Init, float transparantInit1, float transparantInit2, float transparantInit3, float transparantInit4) {
    clickPainting1=click1Init;
    transparantPainting1=transparantInit1;
    transparantPainting2=transparantInit2;
    transparantPainting3=transparantInit3;
    transparantPainting4=transparantInit4;
  }

  PImage img;
  boolean clickPainting1, clickPainting2, clickPainting3, clickPainting4;
  float i;
  float transparantPainting1, transparantPainting2, transparantPainting3, transparantPainting4;
  float colourButtonRed, colourButtonGreen, colourButtonBlue;
  
  
  void paintings() {


    if (clickPainting4==true) {

      if (transparantPainting4>0) {//makes the image fade in 
        print(transparantPainting4);
        transparantPainting4=transparantPainting4-5;
        img = loadImage("maria.jpg");
        image(img, 394, 320, 190, 264);
        fill(255, 255, 255, transparantPainting4);
        rect(394, 320, 190, 264);
      } else {
        img = loadImage("maria.jpg");//i placed this part in because if you remove it the square becomes the same colour of the background if i removeit 
        image(img, 394, 320, 190, 264);
      }
    } else {
      fill(255);
      rect(394, 320, 190, 264);
    }

    //----------------------------------------------------------------------------------------
    if (clickPainting3==true) {

      if (transparantPainting3>0) {//makes the image fade in 
        print(transparantPainting3);
        transparantPainting3=transparantPainting3-5;
        img = loadImage("ufizzi.jpg");
        image(img, 340, 448, 110, 136);
        fill(255, 255, 255, transparantPainting3);
        rect(340, 448, 110, 136);
      } else {
        img = loadImage("ufizzi.jpg");//i placed this part in because if you remove it the square becomes the same colour of the background if i removeit 
        image(img, 340, 448, 110, 136);
      }
    } else {
      fill(255);
      rect(340, 448, 110, 136);
    }
    //----------------------------------------------------------------------------------------
    if (clickPainting2==true) {

      if (transparantPainting2>0) {//makes the image fade in 
        print(transparantPainting2);
        transparantPainting2=transparantPainting2-5;
        img = loadImage("impressionismo1.jpg");
        image(img, 489, 411, 146, 173);
        fill(255, 255, 255, transparantPainting2);
        rect(489, 411, 146, 173);
      } else {
        img = loadImage("impressionismo1.jpg");//i placed this part in because if you remove it the square becomes the same colour of the background if i removeit 
        image(img, 489, 411, 146, 173);
      }
    } else {
      fill(255);
      rect(489, 411, 146, 173);
    }
    //----------------------------------------------------------------------------------------

    if (clickPainting1==true) {

      if (transparantPainting1>0) {//makes the image fade in 
        print(transparantPainting1);
        transparantPainting1=transparantPainting1-5;
        img = loadImage("staryNight.jpg");
        image(img, 414, 494, 120, 110);
        fill(255, 255, 255, transparantPainting1);
        rect(414, 494, 120, 110);
      } else {
        img = loadImage("staryNight.jpg");//i placed this part in because if you remove it the square becomes the same colour of the background if i removeit 
        image(img, 414, 494, 120, 110);
      }
    } else {
      fill(255);
      rect(414, 494, 120, 110);
    }
  }

  void clickValue() {
    if (415<mouseX && mouseX<526 && 498<mouseY && mouseY<597) {
      clickPainting1=true;
    }
    if (537<mouseX && mouseX<635 && 484<mouseY && mouseY<583) {
      clickPainting2=true;
    }
    if (489<mouseX && mouseX<635 && 411<mouseY && mouseY<484 ) {
      clickPainting2=true;
    }
    if (348<mouseX && mouseX<399 && 447<mouseY && mouseY<582 ) {
      clickPainting3=true;
    }
    if (395<mouseX && mouseX<447 && 444<mouseY && mouseY<484 ) {
      clickPainting3=true;
    }
    if (395<mouseX && mouseX<577 && 322<mouseY && mouseY<576 ) {
      clickPainting4=true;
    }
  }

  void button() {
    fill(colourButtonRed, colourButtonGreen, colourButtonBlue);
    ellipse(471, 606, 18, 18);
  }

  void resetClickValue() {
    if (dist(mouseX, mouseY, 471, 606) <= 20) {
      colourButtonRed=255;
      colourButtonGreen=255;
      colourButtonBlue=255;
      clickPainting1=false;
      clickPainting2=false;
      clickPainting3=false;
      clickPainting4=false;
      transparantPainting1=255;
      transparantPainting2=255;
      transparantPainting3=255;
      transparantPainting4=255;
    } else {
      colourButtonRed=255;
      colourButtonGreen=0;
      colourButtonBlue=0;
    }

    ellipse(471, 606, 18, 18);
  }
  
  
}
