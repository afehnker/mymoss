class Homer {  

  float homerX;      
  float homerY;   
  float homerW;  
  float homerH;  
  float bellyUpY = 650;  
  float bellyUpH = 300;  


  Homer(float initX, float initY, float initW, float initH) {      
    homerX = initX;      
    homerY = initY;    
    homerW = initW;  
    homerH = initH;
  }      
  void images () {  
    homer1 = loadImage("Homer.png");   
    homer2 = loadImage("Homer2.png");
  }  
  void display() {  
    image(homer1, homerX, homerY, homerW, homerH);  
    image(homer2, homerX, bellyUpY, homerW, bellyUpH); 
    
    // where he feeds
    fill(255, 0, 0, 128);  //color red semi-transparent
    stroke(128, 0, 255, 128); //color purple semi-transparent
    rect(homerX +65, homerY +65, 50, 40);
    
    // to see where he needs to lay down
    fill(255, 0, 0, 0);  //color red semi-transparent
    stroke(128, 0, 255, 128); //color purple semi-transparent
    rect(homerX, homerY, 50, 40);
  }
}  
