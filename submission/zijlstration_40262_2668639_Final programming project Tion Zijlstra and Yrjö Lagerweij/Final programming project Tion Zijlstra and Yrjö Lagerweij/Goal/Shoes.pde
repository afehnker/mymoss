class Shoes {

  PImage shooterRight; // Loading the shoe image
  Shoes(int initX, int initY) {
    xShoe=initX;
    yShoe=initY;
  }
  void display() {
    imageMode(CENTER);
    shooterRight=loadImage("shooterright.png"); //Used to load the shooter's shoe
    image(shooterRight, xShoe, yShoe, 100, 100); //Position of the shoe
  }
}
