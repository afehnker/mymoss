/*
ShopWindow: Comicasa  
 Erik Schuit and Anica Krüger 
 Date: 31.10.2021
 
 There is a shop window with four posters and chess pieces walking in the background.
 A Minion, butterflies, planets and a Ninja can be seen. When hovering over a poster it will start
 animating. If you click on the Minion or the Ninja, you will go to a new scene.
 */

Butterfly[] butterfly;
BackgroundShopWindow background;
Minion minion;
PosterButterfly posterButterfly;
Ninja myNinja;
Planet[] planets;
Planet mySun;


void setup() {
  background = new BackgroundShopWindow();
  posterButterfly = new PosterButterfly(1200, 250);
  butterfly = new Butterfly[3];
  minion = new Minion(0, 0);
  for (int i=0; i< butterfly.length; i++) {
    butterfly[i] = new Butterfly(random(1100, 1300), random(150, 350), 1200, 250);
  }
  myNinja = new Ninja(0, 0);
  planets = new Planet[3];
  for (int i=0; i<planets.length; i++)
  {
    planets[i] = new Planet(random(40, 100), 0, random(0.0009, 0.002), random(10, 25), color(random(0, 255), random(0, 255), random(0, 255)));
  }
  mySun = new Planet(0, 0, 0, 35, color(255, 255, 0));
  size(1500, 900);
  background(232, 128, 128);
  rectMode(CENTER);
}

void draw() {
  background.display();
  //Planets
  mySun.planetBackground.display();
  for (int i=0; i< planets.length; i++)
  {
    planets[i].display();
  }
  mySun.display();
  popMatrix();
  noFill();
  //Butterflies
  posterButterfly.display();
  for (int i=0; i< butterfly.length; i++) {
    butterfly[i].display();
    butterfly[i].fly();
  }
  //Minions
  minion.display(); 
  minion.jump();
  minion.collide();
  //Ninja
  myNinja.display(minion.getStart());
}


void mouseClicked() {
  myNinja.clickedNinja(mouseX, mouseY);
  minion.clickOnPoster(mouseX, mouseY, myNinja.getIsGamePlaying());
}

void mouseMoved() {
  minion.hover(mouseX, mouseY);
  myNinja.hoverNinja(mouseX, mouseY);
  for (int i=0; i< planets.length; i++)
  {
    planets[i].hoverPlanet(mouseX, mouseY);
  }
  mySun.hoverPlanet(mouseX, mouseY);
  for (int i=0; i< butterfly.length; i++) {
    butterfly[i].hover(mouseX, mouseY);
  }
}

void keyPressed() {
  myNinja.ninjaEventHandling(key);
  if (key == ' ') {
    minion.jumpCheck(true);
  }
  if (keyCode == ENTER) {
    minion.goBack(true);
  }
}
