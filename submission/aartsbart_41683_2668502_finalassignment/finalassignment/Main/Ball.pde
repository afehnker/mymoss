class Ball {
  float ballX, ballY;
  float speedX, speedY;
  boolean isSelected;
  int goalCounter = 0;
  boolean displayHome;

  Ball(int x, int y) {
    ballX = x;
    ballY = y;
    speedX = 0;
    speedY = 0;
    isSelected = false;
  }

  void display() {
    background(0, 130, 0);
    pushStyle();
    fill(0, 130, 0);
    stroke(255);
    strokeWeight(9);
    ellipse(width/2, height/2, 400, 400);
    line(width/2, 0, width/2, height);
    ellipse(width - 280, 520, 150, 200); 
    rect(width - 300, 320, 300, 400);
    fill(0);
    rect(width - 40, 430, 180, 180);   
    fill(255);
    ellipse(width/2, height/2, 20, 20);    
    popStyle();
    pushStyle();
    fill(255, 255, 0);
    noStroke();
    ellipse(ballX, ballY, 40, 40);
    fill(255);
    rect(100, height -120, 110, 30);
    fill(0);
    textSize(20);
    text("Go to store", 100, height -100);
    popStyle();
    ballX = ballX + speedX;
    ballY = ballY + speedY;

    if ( ballX <= 20 ) {
      speedX = -speedX;
    } else if (ballY >= height - 20 || ballY <= 20) {
      speedY = -speedY;
    } else if ( ballX >= width && !(ballX >= width - 20 && (ballY <= 430 || ballY >= 610))) {
      speedX = 0;
      speedY = 0;
      fill(0, 0, 255);
      textSize(108);
      text("You scored!", 200, height/3);
    } else if (ballX > width) {
      ballX = width/4;
      ballY = height/4;
      speedX= 0;
      speedY=0;
    }
    if (displayHome) {
      store.display();
    }
  }

  void loadShot(float mX, float mY ) {
    if (isSelected) {
      ballX=mX;
      ballY=mY;
    }
  }

  void pressMouse(float mX, float mY) {    
    if (dist(ballX, ballY, mX, mY) <= 20) {
      speedX = 0;
      speedY = 0;
      isSelected = true;
    }
  }

  void releaseMouse(int mX, int mY, int pmX, int pmY) {
    if (isSelected) {
      speedX = mX - pmX;
      speedY = mY - pmY;
      isSelected = false;
    }
  }

  void home(int mX, int mY) {
    if (mX > 100 && mX < 210 && mY > height -120 && mY < height -90) {
      displayHome = true;
    }
  }
}
