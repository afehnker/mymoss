/* 
This class displays athena.
checks if the mouse is over athena( if yes)
moves athena to the picture frame 

*/

class Athena {

  //attributes
  float athenaX;
  float athenaY;
  float radius=120;
  PImage img;

  Athena(float initX, float initY) {
    athenaX= initX;
    athenaY= initY;
    img =loadImage("athene.png");
  }
    //displays athena and her background ellipse/circle
  void display() {
    ellipse(300,720, radius, radius);
    image(img, athenaX, athenaY, 180, 180);
  } 
   // checks if the mouse position is over the background ellipse
  boolean isMouseOver(float mX, float mY) {
    boolean answer=false;
    if (pow(athenaX-mX, 2)+ pow(athenaY-mY, 2)<=pow(radius, 2)) {
      answer= true;
    }
    return answer;
  }
   // prints new image to make the game playable
  void update(){
  image(img, athenaX +120, athenaY-160, 120, 120);
  }
}
