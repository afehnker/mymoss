class Mario{
  PImage mario;
  float marioX = 50;
  float marioY = 331;
  float speed = 3;
  
 Mario () {
       mario = loadImage("mario.png");
  }
  
   void display() {

    image (mario, marioX, marioY);
  mario.resize(120,150);
  }
    
     void updateMarioLocation() {
    if (marioX > width-50) {
      speed -= speed*-1;
      marioX = width-50;
    }
    if (marioX < 50) {
     speed = speed*-1;
      marioX = 50;
    }

    marioX = marioX + speed;
  }
    
}
