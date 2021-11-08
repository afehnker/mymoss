class Forest

{
  Trees trees;
  Mushroom mushroom;

  float forestX;
  float forestY;
  color grassColor;

  Forest(float initX, float initY) {
    forestX = initX;
    forestY = initY;
    grassColor = color(85, 192, 93);

    trees = new Trees (0, 0);
    mushroom = new Mushroom ((width/8)*3, (height/6)*4);
  }

  void display() {
    noStroke();
    fill(grassColor);
    ellipse(forestX, height, width, 2.5*(height/4));
    trees.display();
    mushroom.display();
  }
}
