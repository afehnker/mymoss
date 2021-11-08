class Koya {
  float koyaX;
  float koyaY;
  float koyaPosX;
  float koyaPosY;
  float koyaStrokeWeight;
  color koyaFillMain;
  color koyaStroke;
  color koyaFillWhite;
  
  trolly Trolly = new trolly();
  float xPosTrolly = Trolly.trollyxPos;
  
  Koya(float koyaPosX, float koyaPosY) {
    this.koyaPosX = koyaPosX;
    this.koyaPosY = koyaPosY;
    koyaX =0;
    koyaY =0;
    koyaFillMain = color(#8cddfa);
    koyaStroke = color(5, 7, 8);
    koyaStrokeWeight = 5;
    koyaFillWhite = color(255, 255, 255);
  }

  void display() {
    //stroke(koyaStroke);  //start of the display with the colors and stroke & strokeweight
    //strokeWeight(3);
    fill(koyaFillMain);
    strokeWeight(koyaStrokeWeight);
    stroke(koyaStroke);
   
   
    //right ear
    pushMatrix();
    translate(koyaPosX+60, koyaPosY-120);
    rotate(0.4);
    fill(#8cddfa);
    strokeWeight(koyaStrokeWeight);
    stroke(koyaStroke);
    ellipse(0, 0, koyaX+110, koyaY+100);
    noStroke();
    fill(255, 255, 255); //the white colors
    ellipse(0, 0, koyaX+70, koyaY+60);
    popMatrix();

    //left ear
    pushMatrix();
    translate(koyaPosX-110, koyaPosY-60);
    rotate(-1);
    strokeWeight(koyaStrokeWeight);
    stroke(koyaStroke);
    fill(#8cddfa); //blue color
    ellipse(0, 0, koyaX+110, koyaY+100); //blue ear part
    noStroke();
    fill(255, 255, 255); //the white colors
    ellipse(0, 0, koyaX+70, koyaY+60); //white ear part
    popMatrix();

    //head
    pushMatrix();
    fill(koyaFillMain);
    translate(koyaPosX, koyaPosY);
    rotate(-0.3);
    strokeWeight(koyaStrokeWeight);
    stroke(koyaStroke);
    ellipse(0,0, koyaX+220, koyaY+190);
    popMatrix();

    //right eyes
    pushMatrix();
    translate(koyaPosX+25, koyaPosY-15);
    rotate(-0.3);
    strokeWeight(2);
    fill(koyaStroke);
    rect(0, 0, koyaX+37, koyaY+4, 200);
    popMatrix();

    //left eyes
    pushMatrix();
    translate(koyaPosX-60, koyaPosY+10);
    rotate(-0.3);
    strokeWeight(2);
    fill(koyaStroke);
    rect(0, 0, koyaX+37, koyaY+4, 200);
    

    //nose
    fill(#6861d8);
    strokeWeight(koyaStrokeWeight);
    stroke(koyaStroke);
    ellipse(60,20, koyaX+35,koyaY+40);
    popMatrix();

    //mouth
    pushMatrix();
    translate(koyaPosX+12, koyaPosY+20);
    strokeWeight(koyaStrokeWeight);
    rotate(0.9);
    stroke(koyaStroke);
    noFill();
    arc(0, 0, koyaX+50, koyaY+70, 0, QUARTER_PI);
    popMatrix();
    
    }
    void dragKoya() {
    if(mouseY>koyaPosY-160 && mouseY<koyaPosY+100 && mouseX>koyaPosX-150 && mouseX<koyaPosX+130){
    koyaPosX = mouseX;
    koyaPosY = mouseY;
    }
    }
    void kravity () {
     if(koyaPosX>xPosTrolly && koyaPosX<xPosTrolly+width/4 && koyaPosY>height-160 && koyaPosY<height*0.686){
      koyaPosY=height-160;
      koyaPosX=xPosTrolly+width/8;
    }else if(koyaPosY>=height-140){
      koyaPosY = height-140;
    }else{
     koyaPosY += 10;
    }
}
}
