class Donutgameleft {     
  float gameleftX;    
  float gameleftY;   
  float gamepositionX = random(10, 1010);  


  Donutgameleft(float initX, float initY) {    
    gameleftX = initX;    
    gameleftY = initY;
  }    


  void display() {    
    stroke(1);    
    //Mini donut    

    //Outer mini donut    
    fill(222, 184, 135);    
    ellipse(gameleftX, gameleftY, 50, 50); //100, 100, 50, 50    

    //Inner mini donut    
    fill(255, 255, 255);    
    ellipse(gameleftX, gameleftY, 15, 15);    

    //Topping mini donut    
    noStroke();    
    fill(255, 102, 179);    
    ellipse(gameleftX -15, gameleftY, 17, 17);  
    ellipse(gameleftX -10, gameleftY -10, 17, 17);  
    ellipse(gameleftX +15, gameleftY, 17, 17);  
    ellipse(gameleftX -10, gameleftY +10, 17, 17);  
    ellipse(gameleftX +10, gameleftY -10, 17, 17);  
    ellipse(gameleftX +10, gameleftY +10, 17, 17);  
    ellipse(gameleftX, gameleftY -15, 17, 17);      
    ellipse(gameleftX, gameleftY +15, 17, 17);  

    //White  
    fill(255, 255, 255);  
    ellipse(gameleftX -15, gameleftY, 5, 3);  
    ellipse(gameleftX +10, gameleftY +9, 5, 3);  

    //Yellow  
    fill(255, 255, 0);  
    ellipse(gameleftX -10, gameleftY +13, 5, 3);     
    ellipse(gameleftX -9, gameleftY -10, 5, 3);      

    //Red  
    fill(255, 0, 0);  
    ellipse(gameleftX +13, gameleftY -10, 5, 3);      
    ellipse(gameleftX +2, gameleftY +17, 5, 3);   

    //Cyan  
    fill(0, 255, 255);  
    ellipse(gameleftX +15, gameleftY, 5, 3);      
    ellipse(gameleftX, gameleftY -15, 5, 3);
  }  

  void move() {      
    if (gameleftY <= 550 && gameleftY <= 950) {    
      gameleftY= gameleftY+10;
    }    
    if (gameleftY >= 550 && gameleftX >= gamepositionX) {    
      gameleftX= gameleftX-10;
    }  
    if (gameleftX <= gamepositionX && gameleftY>=0) {  
      gameleftY= gameleftY+random(5, 10);
    }  
    if (gameleftY >= 960) {
      gameleftX = 1020;
      gameleftY = 420;
      gamepositionX = random(0, 1010);
    }
    if (homer.homerY <= 700) {
      if (gameleftX >= homer.homerX+65 && gameleftX <= homer.homerX+115 && gameleftY >= homer.homerY+65 && gameleftY <= homer.homerY+105) {
        gameleftX = 1020;
        gameleftY = 420;
        gamepositionX = random(0, 1010);
        homer.bellyUpY = homer.bellyUpY +3;  
        homer.bellyUpH = homer.bellyUpH +5;
        homer.homerY = homer.homerY + 5;
      }
    }
  }
}    
