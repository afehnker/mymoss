class Donuts {   
  float donutsX;  
  float donutsY;  
  float donutsW;  
  float donutsH;  

  Donuts(float initX, float initY, float initW, float initH) {  
    donutsX = initX;  
    donutsY = initY;  
    donutsW = initW;  
    donutsH = initH;
  }  


  void display() {  
    stroke(1);  
    //Mini donuts moving  

    //Outer mini donuts  
    fill(222, 184, 135);  
    ellipse(donutsX, donutsY, donutsW, donutsH); //100, 100, 50, 50  

    //Topping mini donuts  
    noStroke();  
    fill(255, 102, 179);  
    ellipse(donutsX -15, donutsY, donutsW -33, donutsH -33);  
    ellipse(donutsX -10, donutsY -10, donutsW -33, donutsH -33);  
    ellipse(donutsX +15, donutsY, donutsW -33, donutsH -33);  
    ellipse(donutsX -10, donutsY +10, donutsW -33, donutsH -33);  
    ellipse(donutsX +10, donutsY -10, donutsW -33, donutsH -33);  
    ellipse(donutsX +10, donutsY +10, donutsW -33, donutsH -33);  
    ellipse(donutsX, donutsY -15, donutsW -33, donutsH -33);      
    ellipse(donutsX, donutsY +15, donutsW -33, donutsH -33);      

    //Inner mini donuts  
    fill(255, 255, 255);  
    ellipse(donutsX, donutsY, donutsW -35, donutsH -35);  

    //Sprinkles mini donuts  
    //White  
    fill(255, 255, 255);  
    ellipse(donutsX -15, donutsY, donutsW -45, donutsH -47);  
    ellipse(donutsX +10, donutsY +9, donutsW -45, donutsH -47);  

    //Yellow  
    fill(255, 255, 0);  
    ellipse(donutsX -10, donutsY +13, donutsW -45, donutsH -47);     
    ellipse(donutsX -9, donutsY -10, donutsW -45, donutsH -47);      

    //Red  
    fill(255, 0, 0);  
    ellipse(donutsX +13, donutsY -10, donutsW -45, donutsH -47);      
    ellipse(donutsX +2, donutsY +17, donutsW -45, donutsH -47);   

    //Cyan  
    fill(0, 255, 255);  
    ellipse(donutsX +15, donutsY, donutsW -45, donutsH -47);      
    ellipse(donutsX, donutsY -15, donutsW -45, donutsH -47);
  }  
  void move() {  
    donutsX = donutsX +5;  
    if (donutsX >= 800) {  
      donutsX= -30;
    }
  }
}  
