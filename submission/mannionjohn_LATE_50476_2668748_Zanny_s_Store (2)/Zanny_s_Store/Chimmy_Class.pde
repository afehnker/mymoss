class Chimmy {
  float chimmyX;
  float chimmyY;
  float chimmyPosX;
  float chimmyPosY;
  color chimmyMainColor;
  color chimmyStrokeColor;
  color chimmyStrokeWeight;
  
  trolly Trolly = new trolly();
  float xPosTrolly = Trolly.trollyxPos;
  
  
  
  Chimmy(float chimmyPosX, float chimmyPosY) {
    this.chimmyPosX = chimmyPosX;
    this.chimmyPosY = chimmyPosY;
    chimmyX = 0;
    chimmyY=0;
    chimmyMainColor = color(#f9e118);
    chimmyStrokeColor = color(#0c0d06);
    chimmyStrokeWeight = 5;
  }
  void display () {
    fill(chimmyMainColor);
    strokeWeight(chimmyStrokeWeight);
    stroke(chimmyStrokeColor);
    
    //ear
    pushMatrix();
    stroke(chimmyStrokeColor);
    fill(chimmyStrokeColor);
    translate(chimmyPosX, chimmyPosY+26);
    rotate(3.125);
    arc(0,0, chimmyX+275, chimmyY+250,0,PI,CHORD);
    popMatrix();
    
    //head 
    fill(chimmyMainColor);
    strokeWeight(chimmyStrokeWeight);
    ellipse(chimmyPosX, chimmyPosY+30, chimmyX+220, chimmyY+160);
    noStroke();
    ellipse(chimmyPosX, chimmyPosY-25, chimmyX+210, chimmyY+140);
    
    //face 
    fill(255,255,255);
    stroke(chimmyStrokeColor);
    strokeWeight(chimmyStrokeWeight);
    ellipse(chimmyPosX, chimmyPosY+20, chimmyX+150, chimmyY+140);
    
    //eyes
    fill(chimmyStrokeColor);
    ellipse(chimmyPosX-20, chimmyPosY+20, chimmyX+15, chimmyY+15);
    ellipse(chimmyPosX+20, chimmyPosY+20, chimmyX+15, chimmyY+15);
    
    //nose
    pushMatrix();
    translate(chimmyPosX, chimmyPosY+40);
    rotate(2.75);
    arc(0,0,chimmyX+15,chimmyY+15, 0, PI+QUARTER_PI, CHORD);
    popMatrix();
    
    //mouth
    pushMatrix();
    translate(chimmyPosX, chimmyPosY+55);
    line(-20, 5, chimmyX+20,chimmyY);
    rotate(-0.6);
    fill(#FABBBB);
    arc(5,10,chimmyX+15,chimmyY+20, 0, PI+QUARTER_PI, CHORD);
    popMatrix();
    
  }
  void dragChimmy() {
    if(mouseY>chimmyPosY-160 && mouseY<chimmyPosY+180 && mouseX>chimmyPosX-150 && mouseX<chimmyPosX+150){
    chimmyPosX = mouseX;
    chimmyPosY = mouseY;
    }
  }
  void Crafity(){ 
   //for (int i=0; i<cart.length; i++){
   //cart[i].CartControl();
    if(chimmyPosX>xPosTrolly - width/2 && chimmyPosX<xPosTrolly+width/4 && chimmyPosY>height-160 && chimmyPosY<height){
      chimmyPosY=height-200;
      chimmyPosX= xPosTrolly+width/8;
    }else if(chimmyPosY>height-140){
      chimmyPosY = height-140;
    }else{
      chimmyPosY += 10;
    }
    }
  }
