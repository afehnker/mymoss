/*=================
 The Necklace code is written by An.
 The Necklace is taken from free by Hielke
 
 ==================
 The class of the necklace.
 You can pick it up and put it into your bag
 
 =================*/

class Necklace {

  PImage necklace;
  float posX, posY;

  Necklace(float posX, float posY) {
    necklace = loadImage("gold-chain.png");
    this.posX = posX+900;
    this.posY = posY+305;
  }

  void display() {
    image(necklace, posX, posY, 100, 100);
  }


  void move(float mX, float mY) {
    posX = mX;
    posY = mY;
  }

  void collide() {
    if ( posX >= bagX && posY >= bagY) {
      gameState = "GAMEWIN";
    }
  }
}
