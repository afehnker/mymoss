/*
===========================
 SHOP WINDOW BERTUS WORKEL
 ===========================
 Final project for the CreaTe programming course.
 Made by: Gina van der Meijden and Luka van Hoeven
 All images are made by us by using an iPad and ProCreate (drawing app) and are thus original
 Click on the pumpkin to turn it on and off
 Open and close the curtains with the UP and DOWN arrow keys
 Drag the potion out of the witch's her hand and make her reach for it
 Watch out, something amazing will happen when you put the potion in the pot!
 The ghost is pretty scared of humans, he will start shaking when you hover over him
 The spiders will try and escape your cursor! (climb up when hovering)
 The scary skulls will stay on their rope when you try and drag them around, they'll fall back to their original position
 */

Front storeFront;
Curtain leftCurtain;
Curtain rightCurtain;
Pumpkin pumpkin;
Ghost ghost;
Witch witch;
SpiderA spiderA;
SpiderA spiderA2;
SpiderA spiderA3;
SpiderB[] spiderB;
Skull skull1;
Skull skull2;
Skull skull3;

PImage storeFrontImg;
PImage leftCurtainImg;
PImage rightCurtainImg;
PImage pumpkinImg;
PImage ghostImg;
PImage witchArm;
PImage witchBody;
PImage potion;
PImage pot;
PImage spiderAImg;
PImage explosion;
PImage spiderBImg;
PImage skull1Img;
PImage skull2Img;
PImage skull3Img;


void setup() {
  size(1280, 720);
  imageMode(CENTER);
  rectMode(CENTER);

  //storeFront
  storeFrontImg = loadImage("frontwindow.PNG");
  storeFront = new Front(width / 2, height / 2, storeFrontImg);

  //Pumpkin
  pumpkinImg = loadImage("Pumpkin.png");
  pumpkin = new Pumpkin(435, 545, pumpkinImg);

  //both curtains
  leftCurtainImg = loadImage("leftCurtain.png");
  rightCurtainImg = loadImage("rightCurtain.png");
  leftCurtain = new Curtain(600, 360, leftCurtainImg, 1);
  rightCurtain = new Curtain(1000, 340, rightCurtainImg, -1);

  //ghost
  ghostImg = loadImage("ghost.png");
  ghost = new Ghost(1100, 450, ghostImg);

  //witch
  witchArm = loadImage("witchArm.png");
  witchBody = loadImage("witchBody.png");
  potion = loadImage("potion.png");
  pot = loadImage("pot.png");
  explosion = loadImage("explosion.png");
  witch = new Witch(530, 400, witchBody, witchArm, potion, pot, explosion);

  //SpiderA hanging loading in
  spiderAImg = loadImage("Spider2.png");
  spiderA = new SpiderA (168, 0, spiderAImg);
  spiderA2 = new SpiderA (1240, 33, spiderAImg);
  spiderA3 = new SpiderA (280, -60, spiderAImg);

  //SpiderB crawling one loading in
  spiderBImg = loadImage("Spider1.png");
  //spawning in the array of crawling spiderB
  spiderB = new SpiderB [10];
  for (int i = 0; i<spiderB.length; i++) {
    spiderB[i] = new SpiderB(30 + round(random(0, width)), 602 + round(random(0, 90)), spiderBImg, witch);
  }

  //skulls
  skull1Img = loadImage("skull1.png");
  skull2Img = loadImage("skull2.png");
  skull3Img = loadImage("skull2.png");
  skull1 = new Skull(900, 170, skull1Img);
  skull2 = new Skull(1000, 170, skull2Img);
  skull3 = new Skull(800, 170, skull3Img);
}

void draw() {
  background(100);
  //ghost stuff
  ghost.checkIfOver(mouseX, mouseY);
  ghost.display();
  ghost.update();

  //witch
  witch.display();
  witch.update();

  //Skulls
  skull1.display();
  skull1.update();
  skull2.display();
  skull2.update();
  skull3.display();
  skull3.update();

  //curtains
  leftCurtain.display();
  leftCurtain.update();

  rightCurtain.display();
  rightCurtain.update();

  //rectangle for hiding the curtain if it moves to the left
  fill(100);
  rect(250, 360, 250, 1000);

  //storefront
  storeFront.display();

  //pumpkin
  pumpkin.display();

  //SpiderA
  spiderA.display();
  spiderA2.display();
  spiderA3.display();
  spiderA.isOver(mouseX, mouseY);
  spiderA.update();
  spiderA2.isOver(mouseX, mouseY);
  spiderA2.update();
  spiderA3.isOver(mouseX, mouseY);
  spiderA3.update();

  //SpiderB
  for (int i = 0; i< spiderB.length; i++) {
    spiderB[i].display();
    spiderB[i].update();
  }
}

void mousePressed() {
  if (pumpkin.isOver(mouseX, mouseY)) { //turn the pumpkin on/off and takes input for what to check with collision
    pumpkin.mouseIsPressed = !pumpkin.mouseIsPressed;
  }
  if (witch.isOverPotion(mouseX, mouseY)) { //checks for collision and puts the selectPotion boolean to true so we can drag the potion around with the mouse
    witch.selectPotion = true;
  }
  if (skull1.isOver(mouseX, mouseY) && !skull1.updating) {
    skull1.skullSelected = true;
  }
  if (skull2.isOver(mouseX, mouseY) && !skull2.updating) {
    skull2.skullSelected = true;
  }
  if (skull3.isOver(mouseX, mouseY) && !skull3.updating) {
    skull3.skullSelected = true;
  }
}

void mouseDragged() {
  if (witch.selectPotion) {
    witch.movePotion(mouseX, mouseY);
  }
  if (skull1.skullSelected) {
    skull1.rotateFacing(mouseX, mouseY);
  }
  if (skull2.skullSelected) {
    skull2.rotateFacing(mouseX, mouseY);
  }
  if (skull3.skullSelected) {
    skull3.rotateFacing(mouseX, mouseY);
  }
}

void mouseReleased() {
  witch.selectPotion = false;
  skull1.skullSelected = false;
  skull2.skullSelected = false;
  skull3.skullSelected = false;
}

void keyPressed() {
  if (keyCode == UP) {
    leftCurtain.slideClosed = true;//the opening and closing is controlled with booleans for smooth animation
    rightCurtain.slideClosed = true;
  } else if (keyCode == DOWN) {
    leftCurtain.slideOpen = true;
    rightCurtain.slideOpen = true;
  }
}

void keyReleased() {
  leftCurtain.slideClosed = false;
  leftCurtain.slideOpen = false;
  rightCurtain.slideClosed = false;
  rightCurtain.slideOpen = false;
}
