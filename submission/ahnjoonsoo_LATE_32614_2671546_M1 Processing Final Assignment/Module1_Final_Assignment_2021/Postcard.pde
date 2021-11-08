// for the theater window picture
class Window {
  PImage w;


  Window() {
    w =loadImage("Film.jpg");
    image(w, width/2, height/2, 900, 600);
  }

  void display() {
    imageMode(CENTER);
    image(w, width/2, height/2, 900, 600);
  }
}
