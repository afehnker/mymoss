/* 
This class displays the housewife.
checks if the mouse is over the housewife( if yes)
moves housewife to the picture frame 

*/
class Housewife {

  //attributes
  float HousewifeX;
  float HousewifeY;
  float radius=120;
  PImage img;

  Housewife(float initX, float initY) {
    HousewifeX= initX;
    HousewifeY= initY;
    img =loadImage("huisvrouw.png");
  }
    //displays the housewife and her background ellipse/circle
  void display(){
    ellipse(450,720, radius, radius);
    image(img, 450, 720, 150, 120);
  }
   // checks if the mouse position is over the background ellipse
     boolean isMouseOver(float mX, float mY) {
    boolean answer=false;
    if (pow(HousewifeX-mX, 2)+ pow(HousewifeY-mY, 2)<=pow(radius, 2)) {
      answer= true;
    }
    return answer;
  }
   // prints new image to make the game playable
    void update(){
  image(img, HousewifeX - 20, HousewifeY-170, 120, 120);
  }
}
