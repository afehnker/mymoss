class Ball {
  PImage ballImage; // Loading the image of the ball

  //Added variables to make the ball shrink
  float ballWidth = 80;
  float ballHeight = 80;

  Ball(int initX, int initY) {
    ballX=initX;
    ballY=initY;
  }

  void display() {
    ballImage=loadImage("ballimage.png"); //Loading the image of the ball to display
    imageMode(CENTER);
    image(ballImage, ballX, ballY, ballWidth, ballHeight); //Position and scaling of the ball
  }

  void update() { 
    if (ballY<240) { //If the ball is less than 240 on Y axis, the scaling stops.
      ballWidth = 0.15 * 240;
      ballHeight = ballWidth;
    } else { //The ball will keep downscaling.
      ballHeight = 0.15 * ballY;
      ballWidth = ballHeight;
    }
  }
}
