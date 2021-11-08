class StoreName {
  float storeNameX = 500;
  float storeNameY = 40;
  float storeNameW = 325;
  float storeNameH = 40;
  PImage img;
  //constructor
  StoreName(float initX, float initY) {
    storeNameX = initX;
    storeNameY = initY;
    img = loadImage("storename.png");
  }
  void display() { //will display the png at the coordinates that were set as variables
    image(img, storeNameX, storeNameY, storeNameW, storeNameH);
  }
  void mouseclick(float newX, float newY) { //if you click the name, music will start playing
    if (newX>storeNameX && newX <storeNameX+storeNameW && newY>storeNameY && newY <storeNameY+storeNameH) {
      bgmSong.loop();
    }
  }
}
