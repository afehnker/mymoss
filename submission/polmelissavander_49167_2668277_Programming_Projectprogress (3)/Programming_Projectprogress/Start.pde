class Start {  
  PImage img;    
  float startX;    
  float startY;    
  float startW;    
  float startH;   


  Start(float initX, float initY, float initW, float initH) {    
    startX = initX;    
    startY = initY;    
    startW = initW;    
    startH = initH;
  }  

  void images() {  
    startsc = loadImage("Family.png");  
    letter = loadImage("Start1.png");  
    click = loadImage("Click.png");
  }  

  void display() {  
    fill(0, 255, 255);   
    rect(startX, startY, startW, startH);  
    image(startsc, startX +630, startY, startW -1300, startH -150);  
    image(letter, -100, 100);  
    image(click, 400, -400);
  }
}  
