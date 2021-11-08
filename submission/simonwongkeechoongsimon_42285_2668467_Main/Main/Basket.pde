class Basket {
  float x;
  float y;

  PImage basket;

  // Initialise basket width and height
  Basket() {
    basket = loadImage("basket.png");
    basket.resize(200, 200); // resize the image of the basket to 70 pixels
  }

  // Basket position
  void basketPos(float initX, float initY) {
    x = initX;
    y = initY;
  }

  // Display Basket
  void display() {
    image(basket, x, y);
  }

  //Check if pepernoten object collides with basket
  boolean collide(Pepernoten p) {
    float range = dist(x+100, y+100, p.xAxis, p.yAxis);

    // If the Pepernoten object is less than 70 pixels of the basket it will be caught
    if (range < 70) {
      return true;
    } else {
      return false;
    }
  }
}
