/* The dragon class is used to crete the dragon. It is made out of five seperate images */

class dragon {
  int opacity=0;
  int speed=1;
  float dragonX;
  float dragonY;
  float angle;
  float strech=250;
  float speedStretch=5;
  float mouthAngle=-40;
  boolean pressed=false;

  dragon(int x, int y) { //constructor
    dragonX = x;
    dragonY = y;
  }

  void display() {
    pushStyle();
    tint(255, opacity); //make the dragon appear smooth
    pushMatrix();
    translate(-290, -200); //adjusting dragons position to its center
    image(tail, dragonX+200, dragonY+100, strech, 170);
    //dragon small Wing
    pushMatrix();
    translate((dragonX+270), dragonY+200);
    rotate(radians((-angle*.5)+20));
    image(smallWing, -280, -60, 300, 150);
    popMatrix();
    image(body, dragonX+150, dragonY+100, 350, 200);
    //dragon big wing
    pushMatrix();
    translate(dragonX+300, dragonY+180);
    rotate(radians(angle));
    image(bigWing, -47, -185, 350, 200);
    popMatrix();
    //dragonMouth
    pushMatrix();
    translate(dragonX+200, dragonY+215);
    rotate(radians(mouthAngle));
    image(mouth, 0-30, -10, 35, 20);
    popMatrix();
    popMatrix();
    popStyle();
  }

  void update() {
    angle=angle+speed;
    strech=strech+speedStretch;
    opacity += 1;
    if ((angle>50)||(angle<-20)) { //changes wing rotate direction
      speed=-speed;
    }
    if ((strech>320)||(strech<230)) { //changes tail rotate direction
      speedStretch=-speedStretch;
    }

    if (mouthAngle<-40) { //makes the mouth animation
      mouthAngle=mouthAngle+.5;
    }
  }
  void fireBurst() { //creates the balls in the fireBall array
      mouthAngle=-70;
      for (int i=0; i<balls.length; i++) {
        balls[i]= new fireBall(dragonX, dragonY);
      } 
      pressed = true;
  }
  boolean isFire(){ //to know if the dragon has fired, needed to make sure the balls are only displayed after they were created
    if(pressed == true){ 
      return true;
    }else{
      return false;
    }
  }
}
