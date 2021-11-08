/*
  This class displays one planet.
 The planet is a circle with one color. 
 It has a speed to rotate around the centre with the mouse if over the poster. 
 */

class Planet {
  //position
  float xPosPlanet;
  float yPosPlanet;
  
  //speed for rotation
  float speed; 
  
  //size of planet
  float size;

  //color
  color planetColor;

  //keeps track of the mouse actions
  boolean mouseOverPlanet;

  //background
  PosterPlanet planetBackground;

  //constructor
  Planet(float newX, float newY, float newSpeed, float newSize, color newColor) {
    xPosPlanet = newX; 
    yPosPlanet = newY;
    speed = newSpeed;
    size = newSize;
    planetColor = newColor;
    planetBackground = new PosterPlanet(xPosPlanet, yPosPlanet);
    mouseOverPlanet = false;
  }


  void display() {
    if (mouseOverPlanet) {
      //planets starts moving if the mouse is over poster
      movementPlanet();
    } else {
      //start poster gets displayed in the beginnig and if the mouse is not longer over the poster
      fill(planetColor);
      circle(xPosPlanet, 0, size);
    }
  }

  /*
  (0\0) is in the middle of the poster trough the PosterPlanet object
   rotate with millis() to produce a movement -> millis change every single second 
   (0\0) is in the middle of the circle 
   */
  void movementPlanet() {
    if (speed>0) {
      pushMatrix();
      rotate(millis() * speed);
      translate(xPosPlanet, 0);
      fill(planetColor);
      circle(0, 0, size);
      popMatrix();
    } else {
      //used for the sun in the MainTab
      fill(planetColor);
      circle(0, 0, size);
    }
  }

  //keeps track if the user is with the mouse over the poster
  void hoverPlanet(int x, int y) {
    if (x>125 && x<475 && y>575 && y<825) {
      mouseOverPlanet = true;
    } else {
      mouseOverPlanet = false;
    }
  }
}
