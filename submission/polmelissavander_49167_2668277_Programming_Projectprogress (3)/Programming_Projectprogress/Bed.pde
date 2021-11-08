class Bed {    

  float bedX;    
  float bedY;    
  float bedW;    
  float bedH;    

  Bed(float initX, float initY, float initW, float initH) {    
    bedX = initX;    
    bedY = initY;    
    bedW = initW;    
    bedH = initH;
  }    

  void display() {

    //Bed
    noStroke();
    //Wheels
    //Outer wheels
    fill(0, 0, 0);
    ellipse(bedX, bedY, bedW, bedH);
    ellipse(bedX +100, bedY, bedW, bedH);
    ellipse(bedX +200, bedY, bedW, bedH);
    ellipse(bedX +300, bedY, bedW, bedH);

    //Inner wheels
    fill(189, 189, 189); 
    ellipse(bedX, bedY, 25, 25);
    ellipse(bedX +100, bedY, bedW -25, bedH -25);
    ellipse(bedX +200, bedY,bedW -25, bedH -25);
    ellipse(bedX +300, bedY, bedW -25, bedH -25);

    //Legs bed
    rect(bedX -10, bedY -130, bedW -30, bedH +80); 
    rect(bedX +90, bedY -130, bedW -30, bedH +80); 
    rect(bedX +190, bedY -130, bedW -30, bedH +80); 
    rect(bedX +290, bedY -130, bedW -30, bedH +80); 
    rect(bedX -50, bedY -60, bedW +350, bedH -30); 

    //Matrass bed
    fill(161, 161, 161);
    rect(bedX -50, bedY -130, bedW +350, bedH -25);
    fill(189, 189, 189); 
    rect(bedX -25, bedY -180, bedW +300, bedH); 
    rect(bedX -25, bedY -220, bedW +25, bedH -10);

    //Bed sides
    fill(161, 161, 161);
    rect(bedX -50, bedY -230, bedW -25, bedH +50);  
    rect(bedX +325, bedY -230, bedW -25, bedH +50);
  }
}
