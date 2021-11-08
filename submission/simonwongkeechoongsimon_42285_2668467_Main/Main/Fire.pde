class Fire {
  float randomXPos;
  float randomYPos;
  float x;
  float y;
  float size;
  float xOff;
  float yOff;
  float xInc;
  float yInc;

  Fire(int fireX, int fireY, float fireSize, float fireXInc, float fireYInc) {
    xInc = fireXInc;
    yInc = fireYInc;
    x = fireX;
    y = fireY;
    size= fireSize;
  }

  void display(int intX, int intY) {
    x = intX;
    y= intY;

    //creates the colors
    float orangeRed;
    float orangeGreen;
    float yellowRed;
    float yellowGreen;

    xOff+=xInc;
    yOff+=yInc;

    //gives it a random position between xOff and the size of the flame. This makes the flame getting smaller and bigger
    randomXPos = (noise(xOff)-0.5)*size;
    randomYPos = (noise(yOff))*10*size;

    //creates the flickering collors of the flame
    orangeRed = (noise(yOff)+2)*100;
    orangeGreen = (noise(yOff)+2)*50;
    yellowRed = (noise(yOff)+2)*200;
    yellowGreen = (noise(yOff)+2)*100;

    //creates the 3 different flames
    CreateFlame(1, orangeRed, orangeGreen, 0); //the orange flame
    CreateFlame(0.7, yellowRed, yellowGreen, 0); //the yellow flame
    CreateFlame(0.2, orangeRed/2, orangeGreen, 255); //the blue flame
  }

  void CreateFlame(float scale, float red, float green, float blue) {
    pushMatrix();
    noStroke();
    fill(red, green, blue);
    translate(x, y);
    scale(scale); //makes flame bigger or smaller depending on the scale
    rotate(PI); //rotates the flame, so that they are vertical
    bezier(0, 0, -2*size, size/2, randomXPos-size, randomYPos-2*size, randomXPos, randomYPos); //creates the shape of the flame
    bezier(-1, 0, size, size/2, randomXPos+size, randomYPos-2*size, randomXPos-1, randomYPos);
    popMatrix();
  }
}
