class Text {
  float Xtext = 960;
  float Ytext = 510;
  float moveX = 7;
  float moveY = 7;
  
 void display(){
   textAlign(CENTER);
   fill(204, 164, 61);
   textSize(80);
   text("MANCHET", Xtext, Ytext);
 }
 
 void update() {
   Xtext = Xtext+ moveX;
   Ytext = Ytext + moveY;
   
   if (Xtext >= 1505){
    moveX = -moveX; 
   }
   else if (Xtext <= 400) {
    moveX = -moveX; 
   }
   
   if (Ytext >= 870) {
     moveY = - moveY;
   }
   else if (Ytext <= 240) {
    moveY = -moveY; 
   }
   
 }
  
  
}
