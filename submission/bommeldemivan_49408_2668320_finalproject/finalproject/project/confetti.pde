class confetti
{
  float confettiX, confettiY;
  float speedConfettiX, speedConfettiY;
  float confettiStartY;
  color confettiColor;
  float xOff, yOff, xInc, yInc;  //How fast or smooth the confetti moves in the x and y directions


  confetti()
  {
    confettiColor= color(random(255), random(255), random(255)); // makes different colours to each confetti piece

    confettiX = random(- 200, width + 200);  //the startplaces off each confetti random
    confettiY = random(-height, 0);

    confettiStartY = confettiY; 
    xInc = random(0.01, 0.1); // how smooth the confetti moves downward to the floor while moving a bit up, down and sideways
    yInc =  random(0.01, 0.1);
  }

  void DrawConfetti()
  {
    xOff+=xInc; //creates the movement for the noise
    yOff+=yInc;

    speedConfettiX = (noise(xOff)-0.5)*7; //uses perlin noise to move the confetti naturally random
    speedConfettiY = (noise(yOff))*5;

    if (confettiStartY+970 >= confettiY) //let the confetti stop falling down if it hits the floor, so it only executes if the confetti is still in the air
    {
      confettiX += speedConfettiX;
      confettiY += speedConfettiY;
    }

    //draws the confetti
    noStroke();
    fill(confettiColor);
    circle( confettiX, confettiY, 10);
  }
}
