/* //<>// //<>//
 Main tab
 
 Final project by Jan Kröger(s2654512) and Alex Ward(s2317672)
 Shop window - Location - Route Du Soleil - Haverstraatpassage 39, 7511 EV Enschede
 
 Controls
 Left Arrow to move time forward
 Right Arrow to move time backward
 Spacebar to resume normal time
 Click to Respawn flowers
 
 (make sure the 'window' is in focus)
 */


// Variables for images and Booleans for falling/ updating
boolean falling;
boolean update;
boolean growing;
PImage tree, cogImage, frontCogImage, T1, clockNums;
Control control;
Painting painting;
Clock clock;
Flowers flowers;
Cog cog;
Car car;
eventHandler eventhandler;
Lamp lamp1;
Lamp lamp2;

// Setup - Draws canvas and initalizes classes , loads images
void setup() {
  size(700, 1000);
  painting= new Painting();
  clock= new Clock();
  control = new Control();
  cog = new Cog();
  car = new Car();
  eventhandler = new eventHandler();
  lamp1= new Lamp(90, 0);
  lamp2= new Lamp(600, 20);

  falling= false;
  growing = false;
  update=false;
  cogImage = loadImage("images/rearCog.png");
  tree=loadImage("images/Tree-removebg-preview.png");
  frontCogImage = loadImage("images/rearCog.png");
  T1= loadImage("images/T1.png");
  clockNums = loadImage("images/clockNums.png");
}



// Main - Draw class, displays all classes in a specific order
void draw() {
  background(255);

  lamp1.display();
  lamp2.display();
  painting.display();
  eventhandler.startUp();  // initalizes array for flowers
  clock.display();
  cog.display();
  clock.clockTick();
  car.display();
  car.borders();
  control.controls()  ;
}

//END OF MAIN
