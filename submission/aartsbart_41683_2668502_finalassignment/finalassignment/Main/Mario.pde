class Mario {
  PImage marioKart;
  PImage bowser;
  float marioX = width/2; 
  float marioY = height/2;
  boolean moveMarioDown, moveMarioUp;
  int speed = 22;
  float Xpos;
  float Ypos = height/2;
  float obstacleSpeed = 20;
  boolean displayHome;

  void display() {
    marioKart = loadImage("mariokart.png");
    bowser = loadImage("bowser.png");
    background(100, 0, 0);  
    marioKart.resize(100, 100);
    image(marioKart, marioX, marioY);
    bowser.resize(400, 300);
    image(bowser, Xpos, Ypos);
    pushStyle();
    noStroke();
    rect(100, height -120, 110, 30);
    fill(0);
    textSize(20);
    text("Go to store", 100, height -100);
    popStyle();
    obstacle();
    collision();
    if (moveMarioUp == true) {

      cmove();
    } else if (moveMarioDown == true) {
      cmove();
    }

    if (displayHome) {
      store.display();
    }
  }


  void moveUp() {
    moveMarioUp = true;
    moveMarioDown = false;
  }

  void moveDown() {
    moveMarioDown = true;
    moveMarioUp = false;
  }


  void cmove() {
    if (moveMarioUp) {
      if (marioY <= 0) {
        marioY = 0;
      } else  marioY = marioY - speed;
    } else if (moveMarioDown) {
      if (marioY >= height -100) {
        marioY = height -100;
      } else  marioY = marioY + speed;
    }
  }

  void obstacle() {
    Xpos += obstacleSpeed;
    if (Xpos > width) {
      Ypos = random(100, height - 200);
      Xpos = 0;
      obstacleSpeed += 5;
    }
  }

  void collision() {
    if (dist(Xpos + 200, Ypos + 150, marioX, marioY) < 175) {
      obstacleSpeed = 0;
      speed = 0;
      textSize(280);
      text("you lose", 200, 200);
    }
  }


  void home(int mX, int mY) {
    if (mX > 100 && mX < 210 && mY > height - 120 && mY < height - 90) {
      displayHome = true;
    }
  }
}
