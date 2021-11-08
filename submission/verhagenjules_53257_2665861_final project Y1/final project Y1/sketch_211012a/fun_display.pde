class FunArt {
  ArrayList<Integer[]> splashes = new ArrayList<Integer[]>();

  FunArt(boolean randomCirclesInit) {
    randomCircles=randomCirclesInit;
    imgOrange = loadImage("paintSplashOrange.png");
    imgRed= loadImage("paintSplashRed.png");
    imgGreen=loadImage("paintSplashgreen.png");
    imgYellow= loadImage("paintSplashYellow.png");
    imgBlue= loadImage("paintSplashBlue.png");
  }

  PImage imgOrange, imgYellow, imgGreen, imgRed, imgBlue;
  float circleX, circleY, colorR, colorG, colorB, canvasX, canvasY;
  boolean randomCircles;
  boolean slashValueYellow, slashValueOrange, slashValueGreen, slashValueRed, slashValueBlue;
  boolean reset;
  PImage img;
  FloatList transparancy = new FloatList();
  
  void funArtCanvas() {
    rect(0, 115, 310, 250);
  }


  void circlesArt() {

    if (randomCircles==true) {
      for (int i = 0; i < 10/*change this varieble to make it go faster or slower */; i++) {

        canvasX = random(0, 310);
        canvasY = random(115, 370);
        colorR=random(255);
        colorG=random(255);
        colorB=random(255);

        fill(colorR, colorG, colorB);
        circle(canvasX, canvasY, random(1, 20));
      }
    }
  }


  void buttonDisplay() { //displays the red round button 
    strokeWeight(2);
    fill(255, 0, 0);
    ellipse(321, 356, 18, 18);
    ellipse(321, 376, 18, 18);
  }
  void buttonLogic() {
    if (dist(mouseX, mouseY, 319, 359) <= 20) {
      randomCircles=true;
      if (dist(mouseX, mouseY, 319, 379) <= 20) {
        randomCircles=false;
      }
    }
  }

  void paintSplash() {   
    if (slashValueYellow) {

      for (int i=0; i<splashes.size(); i++) {
        float trans = transparancy.get(i);
        transparancy.set(i, trans-20);
        tint(255, trans);
        image(imgYellow, splashes.get(i)[0], splashes.get(i)[1]);
        tint(255, 255);
      }
    }
    if (slashValueOrange) {
      for (int i=0; i<splashes.size(); i++) {
        float trans = transparancy.get(i);
        transparancy.set(i, trans-20);
        tint(255, trans);
        image(imgOrange, splashes.get(i)[0], splashes.get(i)[1]);
        tint(255, 255);
      }
    }
    if (slashValueGreen) {

      for (int i=0; i<splashes.size(); i++) {
        float trans = transparancy.get(i);
        transparancy.set(i, trans-20);
        tint(255, trans);
        image(imgGreen, splashes.get(i)[0], splashes.get(i)[1]);
        tint(255, 255);
      }
    }
    if (slashValueRed) {

      for (int i=0; i<splashes.size(); i++) {
        float trans = transparancy.get(i);
        transparancy.set(i, trans-20);
        tint(255, trans);
        image(imgRed, splashes.get(i)[0], splashes.get(i)[1]);
        tint(255, 255);
      }
    }
    if (slashValueBlue) {

      for (int i=0; i<splashes.size(); i++) {
        float trans = transparancy.get(i);
        transparancy.set(i, trans-20);
        tint(255, trans);
        image(imgBlue, splashes.get(i)[0], splashes.get(i)[1]);
        tint(255, 255);
      }
    }
  }



  void PaintSplashValue() {
    if (58<mouseX && mouseX<108 && 498<mouseY && mouseY<571) {
      splashes.add(new Integer[]{(int)random(-200, width), (int) random(-200, 300), 1});
      transparancy.append(255.0);
      slashValueYellow=true;
    }
    if (108<mouseX && mouseX<147 && 498<mouseY && mouseY<571) {
      splashes.add(new Integer[]{(int)random(-200, width), (int) random(-200, 300), 1});
      transparancy.append(255.0);
      slashValueOrange=true;
    }
    if (147<mouseX && mouseX<192 && 498<mouseY && mouseY<571) {
      splashes.add(new Integer[]{(int)random(-200, width), (int) random(-200, 300), 1});
      transparancy.append(255.0);
      slashValueGreen=true;
    }
    if (193<mouseX && mouseX<224 && 498<mouseY && mouseY<571) {
      splashes.add(new Integer[]{(int)random(-200, width), (int) random(-200, 300), 1});
      transparancy.append(255.0);
      slashValueRed=true;
    }
    if (224<mouseX && mouseX<287 && 498<mouseY && mouseY<571) {
      splashes.add(new Integer[]{(int)random(-200, width), (int) random(-200, 300), 1});
      transparancy.append(255.0);
      slashValueBlue=true;
    }
  }
}
