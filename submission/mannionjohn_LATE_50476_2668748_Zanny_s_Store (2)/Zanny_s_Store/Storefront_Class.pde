
class StoreFront{

  
void display(){
  
//borders
      fill(0);
        line(width/2, height, width/2, height*0.4);
      noFill();
      fill(155);
      noStroke();
        rect(0, 0, width, height*0.04166667);
        rectMode(CORNERS);
        rect(0, height*0.96, width, height);
        rectMode(LEFT);
        rect(0, 0, width*0.03125, height);
        rect(width*0.96875, 0, width, height);
        rect(width*0.28125, 0, width*0.3125, height);
        rect(width*0.6875, 0, width*0.71875, height);
        rect(width*0.3125, height*0.375, width*0.6875, height*0.41666667);
        
        
     //door
       //outlines
          stroke(2);
          noFill();
          rect(width*0.34375, height*0.458333333, width*0.46875, height*0.958333333);
          rect(width*0.53125, height*0.458333333, width*0.65625, height*0.958333333);
          rect(width*0.3125, height*0.41666667, width/2, height*0.9999);
          rect(width/2, height*0.41666667, width*0.6875, height*0.9999);
          fill(155);
       //left-door top
         rect(width*0.3125, height*0.41666667, width*0.34375, height*0.458333333);
         rect(width*0.3125, height*0.41666667, width/2, height*0.458333333);
       //left-door sides
         rect(width*0.3125, height*0.41666667, width*0.34375, height);
         rect(width*0.46875, height*0.41666667, width/2, height);
       //door handle left
         fill(100);
         stroke(2);
           rect(width*0.4375, height*0.75, width*0.4875, height*0.791666667);
         fill(155);
       //right
          rect(width/2, height*0.41666667, width*0.6875, height*0.458333333);
       //right-door sides
          rect(width/2, height*0.41666667, width*0.53125, height);
          rect(width*0.65625, height*0.41666667, width*0.6875, height);
      //door handle right
         fill(100);
           rect(width*0.5125, height*0.75, width*0.5625, height*0.791666667);
          noStroke();
         fill(155);
     
       
  
  //sign
    stroke(2);
    noFill();
      rect(width*0.3125, height*0.04166667, width*0.6875, height*0.375);
     fill(155);
    stroke(2);
      rect(width*0.296875, height*0.125, width*0.703125, height*0.16667, 50);
      rect(width*0.296875, height*0.29166, width*0.703125, height*0.3333333, 50);
    noStroke();
  
  
  //outlines
   
    //windows
    noFill();
    stroke(2);
      rect(width*0.03125, height*0.0416667, width*0.28125, height*0.958333333);
      rect(width*0.71875, height*0.0416667, width*0.96875, height*0.958333333);
     fill(155);
     noStroke();
  }
}
