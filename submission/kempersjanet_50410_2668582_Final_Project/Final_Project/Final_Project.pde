Forest forest;
Gnome gnome;
Squirrel squirrel;
Acorns [] acorns = new Acorns [5];
Leaves [] leaves = new Leaves [10];
Score score;

void setup() {
  size(1500, 1000);

  //calling the constructors
  forest = new Forest(width/2, height/2);
  gnome = new Gnome(9*(width/10), 9*(height/10)+30);
  squirrel = new Squirrel((width/8)*3, height);
  score = new Score(width/10, 9.5*height/10);

  for (int i = 0; i<acorns.length; i++) {
    acorns[i] = new Acorns(random(width), 10);
  }

  for (int i = 0; i<leaves.length; i++) {
    leaves[i] = new Leaves(random(width), 10);
  }
}

void draw() {
  background(175, 215, 225);

  forest.display();
  score.display();
  gnome.display();
  squirrel.display();
  squirrel.update();


  for (int i = 0; i<acorns.length; i++) { 
    acorns[i].display();
    acorns[i].update();
  }

  for (int i = 0; i<leaves.length; i++) {
    leaves[i].display();
    leaves[i].update();
  }

  //if the squirrel reachs the mushroom, then the game will end
  squirrel.resetScore();
}

void mousePressed() {

  //taking the gnome to where the mouse is
  gnome.move(mouseX, mouseY);

  //collecting points for clicking on an acorn
  for (int i = 0; i<acorns.length; i++) {
    acorns[i].collecting(mouseX, mouseY);
  }

  //collecting a point for clicking on a leave
  for (int i = 0; i<leaves.length; i++) {
    leaves[i].collecting(mouseX, mouseY);
  }
}

void mouseReleased() {

  //after collecting points, the acorn will appear on top of the screen
  for (int i = 0; i<acorns.length; i++) {
    acorns[i].reset(mouseX, mouseY);
  }

  //after collecting a point for the leave, the leave will appear on top of the screen
  for (int i = 0; i<leaves.length; i++) {
    leaves[i].reset(mouseX, mouseY);
  }
}

void keyPressed() {

  //making sure the squirrel won't reach the mushroom to steal the collected items. Each time will be correcten to the bottom of the screen
  if (key == 'r' || key == 'R') {
    squirrel.correcting(mouseX, mouseY);
    squirrel.reset();
  }
}
