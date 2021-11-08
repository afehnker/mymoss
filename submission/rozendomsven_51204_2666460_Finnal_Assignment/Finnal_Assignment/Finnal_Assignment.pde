//Program written by Sven Rozendom and Rint Rutgers.
car car;
wrench[] wrench = new wrench[2]; //array for wrench
boolean[] useWrench = new boolean[2]; //array to check if the wrench is used
wineBottle[] wine = new wineBottle[10]; // array of bottles
boolean[] destroyedBottle = new boolean[10]; //array to check if the bottle is broken
void setup() {
  rectMode(CENTER);
  size(1700, 950);
  car = new car(100, 100);
  for (int i = 0; i < wine.length; i++) { //creates 10 bottles
    wine[i] = new wineBottle(int(random(width)), int(random(height)), int(random(360)));
  }
  for (int i = 0; i < destroyedBottle.length; i++) { //sets all bottles to not broken.
    destroyedBottle[i] = false;
  }
  for (int i = 0; i < wrench.length; i++) { //creates 2 wrenches
    wrench[i] = new wrench(int(random(width)), int(random(height)));
  }
  for (int i = 0; i < useWrench.length; i++) { //sets all wrenches to not used
    useWrench[i] = false;
  }
 
}

void draw() {
  background(80);
  for (int i = 0; i < wine.length; i++) {
   if(destroyedBottle[i] == false){ //checks if current bottle is broken.
    wine[i].display(); //shows intact bottle
   } else {
   wine[i].broken(); // shows broken bottle
   }
  }
  for (int i = 0;i<wrench.length;i++){
    if(useWrench[i] == false){ //checks if current wrench is used
    wrench[i].display(); //shows wrench
   } else {
    // shows nothing
   }
  }
  car.display();
  car.update();
  car.wallCheck();
  car.collisionCheck();
  fill(car.damage*25,0,0); //damage score that slowly changes color form black to red.
  textSize(32);
  text( "damage: " + car.damage*10 + "%", 10,30);
}


void keyPressed() {
  car.keyCheck(keyCode);
}
void keyReleased() {
  car.keyReCheck(keyCode);
}
