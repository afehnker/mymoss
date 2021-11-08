//banner for above the shop window

class banner {

  PImage banner;

  void display() {
    size (600, 900);
    imageMode(CENTER);
    banner = loadImage("pofs.jpg");
    image(banner, 300, 50, 500, 70);
  }
}
