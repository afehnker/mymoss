/*
  Authors: Matei Obrocea and Soham H. Nanwani
  Final project for the P4WCI course
  Date: 31 oct 2021
*/

//variables and objects declarations
Platter [] platters;
Lid[] lids;
BakeryObject loaf;
StartScreen startScreen;
Background bg;
int [] xCenterPos = {-300, 0, 0, 300};
int randomStartPos = int(random(0, 4));

void setup() {
  //variables and objects initializations
  size(1500, 1000);
  startScreen = new StartScreen();
  bg = new Background();
  platters = new Platter[4];
  for (int i =0; i < platters.length; i++) {
    platters[i] = new Platter(width/2 - 450 +i*300, height/2);
  }
  lids = new Lid [4];
  for (int i =0; i < platters.length; i++) {
    lids[i] = new Lid (width/2 - 450 +i*300, height/2);
  }
  loaf = new BakeryObject(width/2 - 450 + randomStartPos*300, height/2 + 160);
}

void draw() {
  //method callings
  bg.display();
 
  //displays the platters and revolves them around points which are situated at the middle point between platters
  for (int i =0; i < platters.length; i++) {
    platters[i].display();
    platters[i].move(width/2 + xCenterPos[i], height/2);
    platters[i].update(width/2 - 450 +i*300);
    platters[i].prompt(); //prompts the player to chooose a platter
  } 
  //displays and moves the loaf according to the platter it is stuck on
  loaf.update(platters[randomStartPos].x, platters[randomStartPos].y + 180); 
  loaf.display();
  loaf.updateResult();
  loaf.isWithin(mouseX, mouseY);
  for (int i = 0; i < lids.length; i++) {
    lids[i].display();
    lids[i].updatePosition(platters[i].x, platters[i].y);
  }
  startScreen.display();//shows the start screen
}

void mousePressed() {
  // methods which triggers the previous ones, called by events
  for (int i =0; i < platters.length; i++) {
    lids[i].open(i); //opens the selected lid
    lids[i].rotate_(); //rotates the lids
  }
  for (int i =0; i < platters.length; i++) {
    platters[i].startRotating(mouseX, mouseY); //rotates the platters
  }
  if (platters[0].isOver(mouseX, mouseY)) {
    randomStartPos = int(random(0, 4)); //sets the loaf to a random position after rotating button has been pressed, so that the player will have to guess where the loaf is
  }
  loaf.showResult();
  startScreen.backToStart(mouseX, mouseY);
}

void keyPressed() {
  if (key == ' ') {
    for (int i =0; i < platters.length; i++) {
      lids[i].openAll();
    }
    startScreen.play();
  }
}
