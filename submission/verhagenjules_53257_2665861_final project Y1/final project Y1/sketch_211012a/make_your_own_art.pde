class Canvas {

  Canvas(boolean selectInit, float brushSizeInit, boolean pressedInit) {
    colour=selectInit;
    brushSize=brushSizeInit;
    pressed=pressedInit;
  }
  float paint00X, paint00Y, paint01X, paint01Y=441, paint02X, paint02Y, paint03X, paint03Y, paint04X, paint04Y, paint05X, paint05Y;
  float []paintArrayX=new float [6];
  float []paintArrayY=new float [6];
  float []redArray=new float [6];
  float []greenArray=new float [6];
  float []blueArray=new float [6];
  int counter;
  float red0, red1, red2, red3, red4, red5;
  float green0, green1, green2, green3, green4, green5;
  float blue0, blue1, blue2, blue3, blue4, blue5;
  boolean colour=false;
  int t;
  boolean brush=false;
  float brushSize;
  boolean pressed;



  void display() {
    paint00X=721; 
    paint00Y=441;
    paint01X=760; 
    paint01Y=441;
    paint02X=806; 
    paint02Y=441;
    paint03X=840; 
    paint03Y=441;
    paint04X=880; 
    paint04Y=442;
    paint05X=927; 
    paint05Y=442;

    paintArrayX[0]=paint00X; 
    paintArrayY[0]=paint00Y;
    paintArrayX[1]=paint01X; 
    paintArrayY[1]=paint01Y;
    paintArrayX[2]=paint02X; 
    paintArrayY[2]=paint02Y;
    paintArrayX[3]=paint03X; 
    paintArrayY[3]=paint03Y;
    paintArrayX[4]=paint04X; 
    paintArrayY[4]=paint04Y;
    paintArrayX[5]=paint05X; 
    paintArrayY[5]=paint05Y;

    redArray[0]=236;
    greenArray[0]=232;
    blueArray[0]=26;
    redArray[1]=224;
    greenArray[1]=60;
    blueArray[1]=49;
    redArray[2]=172;
    greenArray[2]=20;
    blueArray[2]=90;
    redArray[3]=152;
    greenArray[3]=30;
    blueArray[3]=151;
    redArray[4]=0;
    greenArray[4]=103;
    blueArray[4]=127;
    redArray[5]=48;
    greenArray[5]=58;
    blueArray[5]=178;
  }


  void canvas() {
    fill(255);
    rect(740, 139, 304, 200);
  }

  void paintBottle() {

    for (int i=0; i<6; i++) {
      fill(redArray[i], greenArray[i], blueArray[i]);
      rect(paintArrayX[i], paintArrayY[i], 30, 30);
    }
  }
  //void margin() {
  //  strokeWeight(2);
  //  for (int i=0; i<6; i++) { // made this so i dont have to manualy put in every value in 

  //    line(paintArrayX[i], paintArrayY[i], paintArrayX[i]+10, paintArrayY[i]+4);
  //    line(paintArrayX[i]+10, paintArrayY[i]+4, paintArrayX[i]+21, paintArrayY[i]+5);
  //    line(paintArrayX[i]+21, paintArrayY[i]+5, paintArrayX[i]+22, paintArrayY[i]+23);
  //    line(paintArrayX[i]+23, paintArrayY[i]+23, paintArrayX[i]+11, paintArrayY[i]+21);
  //    line(paintArrayX[i]+11, paintArrayY[i]+21, paintArrayX[i]+1, paintArrayY[i]+19);
  //    line(paintArrayX[i]+1, paintArrayY[i]+19, paintArrayX[i]+1, paintArrayY[i]);
  //  }
  //}

  void brushPaint() {
    if (pressed==true) {
      
      fill(redArray[t], greenArray[t], blueArray[t]);
      circle(mouseX, mouseY, brushSize);
    }
  }


  void brushValue () { // these parts of the code just say, if your mouse are in there coordinetes it will change the colour of the brush 
    if (722<mouseX && mouseX<762 && 420<mouseY && mouseY<490) {
      colour=true;
      t=0;
    }
    if (762<mouseX && mouseX<792 && 420<mouseY && mouseY<482) {
      colour=true;
      t=1;
    }
    if (805<mouseX && mouseX<836 && 420<mouseY && mouseY<482) {
      colour=true;
      t=2;
    }
    if (841<mouseX && mouseX<873 && 420<mouseY && mouseY<482) {
      colour=true;
      t=3;
    }
    if (880<mouseX && mouseX<911 && 420<mouseY && mouseY<482) {
      colour=true;
      t=4;
    }
    if (924<mouseX && mouseX<958 && 420<mouseY && mouseY<482) {
      colour=true;
      t=5;
    }
  }

  void setColour(boolean colour_){
     colour = colour_; 
  }

  void brushSizeValue() {
    if (823<mouseX && mouseX<840 && 324<mouseY && mouseY<364) {
      brushSize=10;
    }
    if (846<mouseX && mouseX<861 && 325<mouseY && mouseY<360) {
      brushSize=7;
    }
    if (865<mouseX && mouseX<879 && 325<mouseY && mouseY<360) {
      brushSize=5;
    }
    if (866<mouseX && mouseX<887 && 325<mouseY && mouseY<360) {
      brushSize=3;
    }
    if (905<mouseX && mouseX<920 && 325<mouseY && mouseY<360) {
      brushSize=2;
    }
    if (924<mouseX && mouseX<938 && 325<mouseY && mouseY<360) {
      brushSize=1;
    }
  }



  void brushPressedValue() {
    pressed=true;
  }

  void buttonDisplay() {
    fill(255, 0, 0);
    ellipse(736, 349, 18, 18);
  }
  void buttonLogic() {
  if (dist(mouseX, mouseY, 736, 349) <= 20) {
    background(255);
  }
}
}
