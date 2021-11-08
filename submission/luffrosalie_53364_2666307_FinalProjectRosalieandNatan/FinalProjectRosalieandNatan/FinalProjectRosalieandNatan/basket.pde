/*
Baskets appear on the middle shelf.
 These are randomised decoration.
 
 Code written by Rosalie Luff
 */

class Basket {
  float basketX;
  float basketY;
  PImage basket;

  Basket(float initBasketX, float initBasketY) {
    basketX = initBasketX;
    basketY = initBasketY;
    basketX = constrain(basketX, width*1/5+150, width*4/5-50);                          //constrained to the width of the shelf
    basket = loadImage ("basket.png");
  }

  void display() {
    image(basket, basketX, basketY, 264*3/5, 193*3/5);                                  //scaled to appropriate size
  }
}
