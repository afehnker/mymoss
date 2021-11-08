/*
This class is for generating the balloons and updating their positions after the drawer opened.
The void display() function is for displaying the balloons at the bottom of the drawer at random X locations.
The void rise() function is for making the balloons go up slowly with a random X speed and Y speed.
Random X speeds simulate the influence of wind on the balloons.
The void popBalloon() function makes the elipse forming the balloon disappear after the balloon is popped.
The triangles connected to the balloon will fall down after that.
*/
class Balloon {
  //initialising variables and colors:
  float balloonXPos;
  float balloonYPos;
  float ySpeed;
  float xSpeed;
  int changeDirection;
  boolean popBalloon;
  boolean soundPlayed;
  color balloonColor;
  
  Balloon(float overX, float overY){
    //assigning values to variables:
    balloonXPos = overX;
    balloonYPos = overY;
    ySpeed = random(1.5,3); //makes the baloons go up with a random speed.
    xSpeed = random(-0.4,0.4); //makes the baloons go sideways with a random speed.
    changeDirection = 30;
    popBalloon = false;
    soundPlayed = false; //variable for not making the sound play multiple times.
    balloonColor = color(random(0,255),random(0,255),random(0,255));
  }
  
  void display() {
    fill(balloonColor);
    if (!popBalloon){
      ellipse(balloonXPos, balloonYPos, 40, 60); // only display balloon if not popped
    }
    stroke(255); //makes the strings on the baloons white.
    strokeWeight(2);
    line(balloonXPos, balloonYPos + 40, balloonXPos, balloonYPos + 55);
    stroke(1);
    strokeWeight(1);
    triangle(balloonXPos, balloonYPos + 30, balloonXPos + 10, balloonYPos + 40, balloonXPos - 10, balloonYPos + 40);
  }
  
  void rise(){
    if (!popBalloon){
      changeDirection --;
      if (changeDirection <= 0){
        changeDirection = 60;
        xSpeed = random(-0.2,0.2);//makes the balloons change X speed every 60 frames to make it seem like they flow in the wind.
      }
      balloonYPos -= ySpeed; //decrease y position 
      balloonXPos += xSpeed; //increase x position
    }
    else{
      balloonYPos += ySpeed; //increase y position
    }
  }
  
  void popBalloon(){
    if (mouseX >= balloonXPos - 20 && mouseX < balloonXPos + 20  && mouseY >= balloonYPos - 30 && mouseY <= balloonYPos + 40){
      popBalloon = true; //makes the triangle fall down after the baloon is popped.
      ySpeed = 8; //increase the y speed
      if(!soundPlayed) {
        soundPlayed = true;
        pop.play(); //plays the popping sound
      }
    }
  }
}
