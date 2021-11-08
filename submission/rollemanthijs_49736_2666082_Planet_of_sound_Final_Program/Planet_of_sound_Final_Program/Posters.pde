//class for the posters on the window

class posters {

  PImage retro;
  PImage acdc;
  PImage abba;

  float speed = 2;

  float ix = 120;
  float iy = 230;
  
  int widthimage = 96;
  int heigthimage = 144;

  void display() {;
    size(600, 900);
    retro = loadImage("retro.jpg");
    acdc = loadImage("acdc.jpg");
    abba = loadImage("abba.jpg");
    imageMode(CENTER);
    image(retro, ix, iy, widthimage, heigthimage);
    image(acdc, ix+150, iy, widthimage, heigthimage);
    image(abba, ix+300, iy, widthimage, heigthimage);
  }
  //make the images move slowly from left to right and vice versa
  void move() {
    ix = ix + speed;
    if ((ix<= 90) || (ix >= width-390)) {
      speed = speed * -1;
    }
  }
}
