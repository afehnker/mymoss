class Donutgameright {   
  float gamerightX;  
  float gamerightY;  
  float gamepositionX = random(1030, 1790);

  Donutgameright(float initX, float initY) {  
    gamerightX = initX;  
    gamerightY = initY;
  }  


  void display() {  
    stroke(1);    
    //Mini donut    

    //Outer mini donut    
    fill(222, 184, 135);    
    ellipse(gamerightX, gamerightY, 50, 50); //100, 100, 50, 50    

    //Inner mini donut    
    fill(255, 255, 255);    
    ellipse(gamerightX, gamerightY, 15, 15);    

    //Topping mini donut    
    noStroke();    
    fill(255, 102, 179);    
    ellipse(gamerightX -15, gamerightY, 17, 17);  
    ellipse(gamerightX -10, gamerightY -10, 17, 17);  
    ellipse(gamerightX +15, gamerightY, 17, 17);  
    ellipse(gamerightX -10, gamerightY +10, 17, 17);  
    ellipse(gamerightX +10, gamerightY -10, 17, 17);  
    ellipse(gamerightX +10, gamerightY +10, 17, 17);  
    ellipse(gamerightX, gamerightY -15, 17, 17);      
    ellipse(gamerightX, gamerightY +15, 17, 17);  

    //White  
    fill(255, 255, 255);  
    ellipse(gamerightX -15, gamerightY, 5, 3);  
    ellipse(gamerightX +10, gamerightY +9, 5, 3);  

    //Yellow  
    fill(255, 255, 0);  
    ellipse(gamerightX -10, gamerightY +13, 5, 3);     
    ellipse(gamerightX -9, gamerightY -10, 5, 3);      

    //Red  
    fill(255, 0, 0);  
    ellipse(gamerightX +13, gamerightY -10, 5, 3);      
    ellipse(gamerightX +2, gamerightY +17, 5, 3);   

    //Cyan  
    fill(0, 255, 255);  
    ellipse(gamerightX +15, gamerightY, 5, 3);      
    ellipse(gamerightX, gamerightY -15, 5, 3);
  }

  void move() {    
    if (gamerightY <= 550) {  
      gamerightY= gamerightY+10;
    }  
    if (gamerightY >= 550 && gamerightX <= gamepositionX) {  
      gamerightX= gamerightX+15;
    }
    if (gamerightX >= gamepositionX) {
      gamerightY= gamerightY+random(5, 10);
    }
    if (gamerightY >= 960) {
      gamerightX = 1020;
      gamerightY = 420;
      gamepositionX = random(1030, 1790);
    }
    if (homer.homerY <= 700) {
      if (gamerightX >= homer.homerX+65 && gamerightX <= homer.homerX+115 && gamerightY >= homer.homerY+65 && gamerightY <= homer.homerY+105) {
        gamerightX = 1020;
        gamerightY = 420;
        gamepositionX = random(1030, 1790);
        homer.bellyUpY = homer.bellyUpY +3;  
        homer.bellyUpH = homer.bellyUpH +5;
        homer.homerY = homer.homerY + 5;
      }
    }
  }
}  
