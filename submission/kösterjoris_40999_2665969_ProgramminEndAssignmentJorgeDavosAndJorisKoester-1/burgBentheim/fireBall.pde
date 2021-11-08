/* creates fireballs blown out of the dragons mouth */

class fireBall {
  float xPosFire;
  float yPosFire;
  float xSpeed;
  float ySpeed;
  boolean isFire = false;
  //fireball constructor
  fireBall(float dragonX, float dragonY) {
    xPosFire=(dragonX-100);
    yPosFire=(dragonY+35);
  }
  void display() { //displays the fireballs
    if (isFire == true){
    image(fire, xPosFire, yPosFire, 20, 20);
    } else {
      image(fire, -100, 100, 20, 20); //places balls outside the visible area, once the crossed the border
    }
  }
  void update() {
    if (xPosFire <= -50 || xPosFire >=1650 || yPosFire <= -50 || yPosFire >= 1050){ //detects if balls are outside the window
      isFire = false;
      } else {
    xSpeed += random(-2, 2); //makes the fireBall behave random
    ySpeed += random(-2, 2);
    yPosFire += ySpeed; //ads the randomness to the fireballs position
    xPosFire += xSpeed;
    isFire = true;     
    }
  } 
}
