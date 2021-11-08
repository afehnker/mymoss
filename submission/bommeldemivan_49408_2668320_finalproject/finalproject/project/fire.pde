//This class creates and moves the flames. A large part of this code was created by me(Jonathan) during the sportsday for the Rocketcaptain team.

class fire 
{ 
  float x, y, size; //the position and the size of the flame
  float xOff, yOff, xInc, yInc;  //How fast or smooth the flames moves in the x and y directions
  color innerColor = color(255, 50, 0), outerColor = color(255, 255, 0, 0);
  int smoothness = 100; //the amount of flames drawn with different colors on top of eachother.

  fire(int fireX, int fireY, float fireSize, float fireXInc, float fireYInc) 
  {
    x = fireX; 
    y = fireY; 
    size= fireSize; 
    xInc = fireXInc; 
    yInc = fireYInc;
  }

  void DrawFlame() 
  {  
    float randomXPos, randomYPos; //the position of the top of flame

    xOff+=xInc; //creates the movement for the noise
    yOff+=yInc;

    randomXPos = (noise(xOff)-0.5)*size; //uses perlin noise to move the flame naturally random
    randomYPos = (noise(yOff))*10*size;

    for (int i = 0; i <= smoothness; i++) 
    {
      float howFarIntoFlame  = map(i, 0, smoothness, 0, 1); //determines how far we are into the flame with a number between 0 and 1
      color flameColor = lerpColor(outerColor, innerColor, howFarIntoFlame); //mixes the outer and the inner color to create an in between tone depending on how war inwards we are
      CreateFlame(howFarIntoFlame, flameColor, randomXPos, randomYPos);
    }
  }

  void CreateFlame(float scale, color flameColor, float randomXPos, float randomYPos) 
  {
    pushMatrix();
    noStroke();
    fill(flameColor);
    translate(x, y);
    scale(1-scale); //from the outer flame to the inner flame
    bezier(0, 0, -2*size, -size/2, randomXPos-size, -randomYPos+2*size, randomXPos, -randomYPos); //each curve is one half of the flame
    bezier(0, 0, size, -size/2, randomXPos+size, -randomYPos+2*size, randomXPos, -randomYPos);
    popMatrix();
  }

  void UpdateFlame(float newX, float newY, float newSize) //updates in case the flame needs to move when you lose
  {
    x = newX; 
    y = newY;
    size = newSize;
  }
}
