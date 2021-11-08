//background of the shop

class background {

  PImage background;

  void display() {
    size (600, 900);
    background = loadImage("background.jpg");
    imageMode(CENTER);
    image(background, 300, 455, 545, 640);
  }
}
