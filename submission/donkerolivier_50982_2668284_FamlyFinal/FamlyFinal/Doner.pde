class Doner{
  float xDoner, yDoner;
  PImage donerimage;    
  
  Doner(float initX, float initY){  
  xDoner = initX;
  yDoner = initY;
  donerimage = loadImage("donercone.png");  //Doner image from https://www.pngfind.com/mpng/hwhoTxx_ottoman-doner-kebab-kebab-doner-png-transparent-png/
  }
  
  void display(){  
    fill(210);    //light grey rod
    rect(xDoner + 145, 0, 30, height);
    image(donerimage, xDoner, yDoner);
    
       
  }
  
  
  
  
  
  
  
}
