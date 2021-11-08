
class Costumer{
 PImage Zalfa;
 PImage Johnny;
 PImage Nick;
 PImage Nick2;
 float CxPos; 
 float CxPos2;
 float CxPos3;
 float CxPos4;
 boolean CheckPressed;
  
  Costumer(){
   Zalfa = loadImage("Zalfa.jpg");
   Johnny = loadImage("Johnny.jpg");
   Nick = loadImage("Nick.jpg");
   Nick2 = loadImage("Nick.jpg");
}
  
  
  void display(){
  image(Johnny, CxPos, height*0.686, width/12, height/3);
  image(Nick, CxPos2, height*0.686, width/12, height/3);
  image(Zalfa, CxPos3, height*0.686, width/12, height/3);
  image(Nick2, CxPos4, height*0.686, width/12, height/3);
  
  
   if(CheckPressed){
     if(CxPos>width+300){
       CxPos = random(-width, -width/12);
   }else{
     CxPos += random(0.5, 6);
   }
   if(CxPos2>width+300){
       CxPos2 = random(-width, -width/12);
   }else{
     CxPos2 += random(0.5, 6);
   }
   if(CxPos3<-200){
     CxPos3 = random(width+1, width+200);
   }else{
       CxPos3 -= random(0.5, 6);
     }
     if(CxPos4<-200){
     CxPos4 = random(width+1, width+200);
   }else{
       CxPos4 -= random(0.5, 6);
     }
  }
 
  }
}
