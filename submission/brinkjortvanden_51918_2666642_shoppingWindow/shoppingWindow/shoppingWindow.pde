//final assignment P4WCI - Jort van den Brink s2789760 ----- //

//You can click an an alpaca to select it (this can be finicky at times) afterwards you can move the selected alpaca(s), unless they're in a box in which case they and only turn around. 'a' for moving left, 'd' for moving right and 'w' for jumping.  

// This is based on a shopping window of Expo (the gift shop in the city center, not the exhibition and trade center). I used 5 classes: alpaca, background, movement leaf and plant. 
// theae are for: the displaying and managing of the alpaca array, the displaying of the back-mid and for-ground, for managing the movement for the alapcas, for displaying the leaf falling from the plants and for placing the plants recpectivly. 
// I used an array of booleans for the keyPressed function in order to allow for multiple inputs at the same time (for instance 'a' and 'w') and for the alpacas I used an array with in th constructor 2 strings for the file names for the PNG's.
// This allows me to more easely dislay the diffent coloured PNG's.


background background;
movement movement;
alpaca[] alpacas = new alpaca[5];
leaf[] leaves = new leaf[100];
plant[] plants = new plant[3];
boolean[] keys = new boolean[3];

void setup() {
  size (700, 700); 
  initialise();     // I use an initialise function to keep thing nice and neat :)
}

void draw() {
  background.display();
  for (plant plant : plants) {
    plant.display();
  }
  for (alpaca alpacas : alpacas) {
    alpacas.display();
    alpacas.update();
  }
  background.forground();
  for (leaf leaves : leaves) {
    leaves.display();
    leaves.update();
  }
}


//Here i initialise all of my classes
void initialise() {
  background = new background();
  movement = new movement();
  alpacas[0]= new alpaca(520, height-250, "purple1.png", "purple2.png", true, true);
  alpacas[1]= new alpaca(90, height-280, "blue1.png", "blue2.png", false, true);
  alpacas[2]= new alpaca(470, height-260, "green1.png", "green2.png", true, true );
  alpacas[3]= new alpaca(50, height-150, "pink1.png", "pink2.png", false, false);
  alpacas[4]= new alpaca(650, height-280, "orange1.png", "orange2.png", true, false);
  plants[0] = new plant(130, height-280, "plant.png", true);
  plants[1] = new plant(width - 500, height-180, "plant.png", true);
  plants[2] = new plant(width - 300, height-280, "tree.png", false);
  for (int i = 0; i < leaves.length; i = i+1) {
    leaves[i] = new leaf(-100, 0);
  }
}


// as stated above by using an array of booelans I can keep track of multiple button inputs at once.
void keyPressed() {
  if (key == 'a') {
    keys[0] = true;
  }
  if (key =='d') {
    keys[1] = true;
  }
  if (key == 'w') {
    keys[2] = true;
  }
}

//were as the void Pressed() function "activates" the key states keyReleased deactivates them again
void keyReleased() {
  if (key == 'a') {
    keys[0] = false;
  }
  if (key =='d') {
    keys[1] = false;
  }
  if (key == 'w') {
    keys[2] = false;
  }
}

//this is used for checking if you clicked on an alpaca (it send the mouse positions to a different function where it calculates the distance between the alpacas and posttion of the mouse clicked
void mouseClicked() {
  float x = mouseX;
  float y = mouseY;
  for (alpaca alpacas : alpacas) {
    alpacas.activate(x, y);
  }
}
