//Move the ghost with arrowkeys and eat the falling pepernoten from the sky before they fall down on the ground or else it is game over

Ghost ghost;
Counter counter;
Pepernoten[] pepernotens = new Pepernoten[25]; //papernoten fall from the sky
PImage bg;

Windmill mill;

void setup() {

  size(1000, 1000);
  bg = loadImage("background.png");
  smooth();
  counter = new Counter();
  ghost = new Ghost();
  for (int i = 0; i < pepernotens.length; i++) { //pepernoten rain
    pepernotens[i] = new Pepernoten();
  }
  mill = new Windmill();
}

void draw() {
  background(bg);
  ghost.display();
  counter.display();
  mill.update();
  for (int i = 0; i < pepernotens.length; i++) { //as long as they keep falling the game keeps going
    pepernotens[i].display();
    pepernotens[i].fall();
    pepernotens[i].gameOver();
  }
}
void keyPressed() { //move ghost with arrow keys

  if (keyCode == RIGHT) {
    ghost.moveRight();
  }

  if (keyCode == LEFT) {
    ghost.moveLeft();
  }
}
