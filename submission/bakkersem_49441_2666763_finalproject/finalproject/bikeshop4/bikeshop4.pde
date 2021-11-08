// made by Sem Bakker (2771020) in 2021 for final project of P4WCI

//initialize classes
Bicycle bicycle;
UserInterface UI;
Customizer customizer;

PImage wall; // initizialize the background picture

void setup() {
  fullScreen(); // set program to be fullscreen
  frameRate(60); // set framerate to 60
  imageMode(CENTER); // set imagemode to center, this makes it easier to see where a picture is located

  //constructors
  customizer = new Customizer();
  bicycle = new Bicycle();
  UI = new UserInterface();

  wall = loadImage("general/bg.png"); // background image
}

void draw() {
  image(wall, width/2, height/2, width, height); // draw the store window (background)
  bicycle.display();
  UI.display();
}

void mouseClicked() {
  UI.buttonCheck();
}
