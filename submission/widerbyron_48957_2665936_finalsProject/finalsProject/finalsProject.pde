/*
  Our finals project is the Montblanc Store front in Hamburg. 
 Our interactivity happens mainly inside the stars, the left star has several buttons at the points of the star which interact with the sceneBackground 
 and the sceneStore as well as use other classes and functions to add to the scenery, 
 click them and see what they do. ;) (For more details please check out the LeftSymbol class)
 The right star influences the portal, and lets it spin faster when used. (For more details please check out the RightSymbol class).
 Authors: Byron Wider and Door Kolkman
 */

Star star;
LeftSymbol leftSym;
RightSymbol rightSym;
Storefront sceneStore;
Surroundings sceneBackground;

void setup() {
  size(1200, 800, FX2D);
  frameRate(60);

  sceneStore = new Storefront(width/2, height/2);
  sceneBackground = new Surroundings(width/2, height/2);
  leftSym = new LeftSymbol(width/2, height/2, sceneBackground, sceneStore);
  rightSym = new RightSymbol(width/2, height/2, sceneStore);
}

void draw() {
  background(255);
  sceneBackground.display();
  sceneStore.display();
  leftSym.display();
  leftSym.update();
  rightSym.display();
  rightSym.update();
  sceneStore.update();
}

void mousePressed() {
  leftSym.clicked(mouseX, mouseY);
  rightSym.clicked(mouseX, mouseY);
  leftSym.activatePen();
}
