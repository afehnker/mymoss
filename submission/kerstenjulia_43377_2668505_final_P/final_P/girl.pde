/* 
This class displays the girl.
checks if the mouse is over girl( if yes)
moves girl to the picture frame 

*/
class Girl {

  //attributes
  float girlX;
  float girlY;
  float radius=120;
  PImage img;

  Girl(float initX, float initY) {
    girlX= initX;
    girlY= initY;
    img =loadImage("meisje.png");
  }
  //displays the girl and her background ellipse/circle
  void display(){
    ellipse(600,720, radius, radius);
    image(img, 600, 720, 200, 140);
  }
  // checks if the mouse position is over the background ellipse
   boolean isMouseOver(float mX, float mY) {
    boolean answer=false;
    if (pow(girlX-mX, 2)+ pow(girlY-mY, 2)<=pow(radius, 2)) {
      answer= true;
    }
    return answer;
  }
  // prints new image to make the game playable
    void update(){
  image(img, girlX - 170, girlY-170, 120, 120);
  }
}
