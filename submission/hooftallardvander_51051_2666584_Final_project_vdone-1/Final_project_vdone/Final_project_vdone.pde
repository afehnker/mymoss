//* Made by Allard van der Hooft *
PImage background;
birdHouses birdHouses;
bird bird;
sunScreen sunScreen;

void setup() {
  size(800, 800);
  // Initialize the store background image
  background = loadImage("Store.jpg");
  // Initialize the birdhouses
  birdHouses = new birdHouses();
  // Intialize the bird
  bird = new bird(100, 100, -1, false);
  // Initialize the sunscreen
  sunScreen = new sunScreen(width/2, 0, 1, 1);
}

void draw() {
  // Draw the background image
  image(background, -150, 0);
  // Show the birdhouses
  birdHouses.display();
  // Show the sunscreen
  sunScreen.display();
  // Show the bird
  bird.display();
}

void mouseDragged() {
  // If the mouse is clicked, move the bird to the location
  bird.move(max(min(mouseX, width), 0), max(min(mouseY, height), 0));
}

void keyPressed() {

  //If the key e is pressed, make the bird wink
  if (key == 'e') {
    bird.wink();
  }
  // If the key w is pressen, open the suncreen further
  if (key == 'w') {
    sunScreen.move(-0.01, -0.01);
  }
  // If the key s is pressed, close the sunscreen
  else if (key == 's') {
    sunScreen.move(0.01, 0.01);
  }
}

void keyReleased() {
  //If the key e is released, make the bird stop winking
  if (key == 'e') {
    bird.noWink();
  }
}
