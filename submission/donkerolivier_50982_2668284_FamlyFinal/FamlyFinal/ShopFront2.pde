class ShopFront2 {
  float xShopFront, yShopFront;
  PImage famly;
  int zoomcount = 0;
  float imgscale = 1;
  int resizeCounter = 0;

  ShopFront2(float initX, float initY) {
    xShopFront = initX;
    yShopFront = initY;
    famly = loadImage("famly.jpg");
  }

  void display() {
    imageMode(CENTER);

    if (imgscale > 0 && imgscale <= 3) {
      pushMatrix();
      translate(xShopFront - 100*(imgscale-1), yShopFront + 1.2*(imgscale-1));    //shift left along with imagescale, the -1 is there because imgscale starts at 1.
      scale(imgscale);
      image(famly, 0, 0);
      popMatrix();
    } else {
      imageMode(CORNER);    //back to corner, otherwise all images that follow are drown in center mode.
      hideShopFront();
      scoreboard1.resetScoreboard();    //for a second pass of the game.
    }
    imgscale += 0.01;
  }

  void hideShopFront() {
    showshopfront2 = false;
    imgscale = 1; //reset to original value to avoid showshopfront 2 = false being spammed forever
  }
}
