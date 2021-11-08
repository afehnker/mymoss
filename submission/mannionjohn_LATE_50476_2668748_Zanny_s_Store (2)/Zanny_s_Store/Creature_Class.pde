
public class trolly{
  PImage Trolly;
  public float trollyxPos;
  boolean Right;
  boolean left;
  

trolly(){
   Trolly = loadImage("Trolly.png");
}


void display(){
  image(Trolly, trollyxPos, height*0.686, width/4, height/3);
  
}
  

void CartControl(){ 
  if(mouseY>height*0.686 && mouseY<height*0.686+width/16 && mouseX<trollyxPos+width*0.05 && mouseX>trollyxPos-width*0.05){
  trollyxPos = mouseX;
  }else if(trollyxPos>width*0.75){
  trollyxPos = width*0.75;
  }else if(trollyxPos<0){
  trollyxPos = 0;
  }
}

}
