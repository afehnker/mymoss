/*=================
 The Key code is written by An.
 The Key is designed by Hielke.
 
 ==================
 This is the Key class.
 It creates a key and interacts it with the door.
 if they collide, key will disappear.
 
 =================*/

class Key {

  PImage key1;
  float posX, posY;
  boolean keyVisible = true;

  Key(float posX, float posY) {
    key1 = loadImage("key.png");
    this.posX = posX+420;
    this.posY = posY+350;
  }

  void display() {
    if (keyVisible) {
      image(key1, posX, posY, 100, 50);
    }
  }


  void move(float mX, float mY) {
    posX = mX;
    posY = mY;
  }

  void collide() {    // if key collide with the door, it will disapear
    if ( posX >= shopX + 885 && posY >= shopY + 235) {
      isLocked = false;
      keyVisible = false;
    }
  }
}
