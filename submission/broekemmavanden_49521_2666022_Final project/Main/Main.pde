ArrayList<Bubbles> bubbles;
ArrayList<Bat> swarm = new ArrayList<Bat>(); // declare array of plants

Witch witch;
Skeleton skeleton;
Background background;
Spook spook1;
Spider spider1;
float xMouse, yMouse;


void setup() {
  size(1500, 800);
  
  spook1 = new Spook();
  spider1 = new Spider();
  witch = new Witch();
  skeleton = new Skeleton();
  background = new Background();
  bubbles = new ArrayList<Bubbles>();
  
}

void draw() {
  background(0, 50, 100);

  xMouse = mouseX;
  yMouse = mouseY;

  //----background----
  background.display(xMouse);

  //----witch----
  witch.display();
  witch.mouseOver(xMouse, yMouse);
  witch.move();

  //----poison bubbles----
  bubbles.add(new Bubbles());
  for (Bubbles p : bubbles) {
    p.display();
    p.move();
  }

  //----bats----
  for (Bat bat : swarm) {
    bat.display(); // swarm
    bat.update();
  }
  for (int i = swarm.size()-1; i >= 0; i--) {
    Bat bat = swarm.get(i);
    bat.removeBats(i);
  }
  
  //----spook----
  spook1.displaySpook();

  //----spider----
  spider1.display();
  spider1.swing();

  //----skeleton----
  skeleton.display();
  skeleton.changeEyes(xMouse, yMouse);
}

void keyPressed() {
  swarm.add(new Bat()); // create new bats
  Bat soundBat = swarm.get(0);
  soundBat.batSound.play();
}

void mouseDragged() {
  spider1.moveSpider(xMouse, yMouse);
}
