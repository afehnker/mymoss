class bats{
  
  float batX;
  float batY;
  float batSpeedX = random(-5,5);
  float batSpeedY = random(-5,5);
  PImage batImg;
  //constructor bats
bats(float batXa, float batYa){
batXa = batX;
batYa = batY;
}
//display the bats and give them sped
void batDisplay(){
  batImg = loadImage("Bat.png");
  batX = batX + batSpeedX;
  if(((batX <= 130) || (batX >= 240)) && ((batX <= 825) || (batX >= 935))){
    batSpeedX = batSpeedX * -1;
}
   batY = batY + batSpeedY;
   if((batY <= 260) || (batY >= 700)){
     batSpeedY = batSpeedY * -1;
}
}
}
