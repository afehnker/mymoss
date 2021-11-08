/* A beautifil dancing coffe mug hidden behind a window
*/

class coffeeMug{
  float shakeOffset; //transfers the offset
  float shakeParameter; //sets the amount of shaking
  int xPos;
  int yPos;
 coffeeMug(){
   xPos = window1.xPosWindow(); //getting left windows positions
   yPos = window1.yPosWindow();
 }
 void display(){
   for (int i = 0; i <= 60; i = i + 1) { //creating the window background (might move to the class thats behind the window covers)
      pushStyle();
      noStroke();
      fill(40,4*i,i*2);
      rect(xPos+ i, yPos + i, 300 - 2*i, 300 - i);
      popStyle();
    }
   pushStyle();
   imageMode(CENTER);
   image(coffeeMug,xPos+170+shakeOffset,yPos+200,200,200);
   popStyle();
 }
 void update() {
    shakeOffset -= 5*sin(shakeParameter); //makes it shake smooth, sin value increases and decreases in different speed
    shakeParameter += 0.2;  
  }
}
