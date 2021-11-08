class Planet {

  // declare texture for planets
  PImage earthImg;

  // declare a PShape to apply a texture on a shape "SPHERE"
  PShape globe;

  // declare SoundFile type song
  SoundFile song;

  // declare x,y,radius,initX,initY, scale-ratio, rotate-speed, angle of rotation around Y-axis
  float planetX, planetY, planetRadius, initX, initY, scaleNumber, speed, angle;

  // declare planetColor
  color planetColor;

  boolean isSelected, isPlanetRotating, isPlaying;

  // constructor has parameters 
  Planet(float initX, float initY, float initRadius, color initColor, SoundFile song) {
    planetRadius = initRadius;
    planetColor = initColor;
    planetX = initX;
    planetY = initY;
    this.initX = initX;  // use initX to let the planet back to its initial X position
    this.initY = initY;  // use initY to let the planet back to its initial Y position
    this.song = song;

    speed = 1;  //rotation speed of 1;

    earthImg = loadImage("earth.jpg");  // initialize earthImg with earth texture

    // define a shape SPHERE with a radius, you must already color the PShape 
    noStroke();
    fill(planetColor);
    globe = createShape(SPHERE, planetRadius*2);
    globe.setTexture(earthImg);  //apply the texture to the PShape
  }
  // display
  void display() {
    pushMatrix();
    translate(planetX, planetY);
    rotateY(radians(angle));  //based on the angle count
    scale(scaleNumber, scaleNumber, scaleNumber);  //the variable scaleNumber will let the shape scale based on the distant function from its inital position
    shape(globe);
    popMatrix();
  }

  // rotate planet, only if the planet is on/ in the disk space of the recordPlayer
  void rotatePlanet(boolean onDisk) {  //that is why it askes for the boolean from the class recordPlayer
    if (onDisk) {
      angle = (angle+speed)%360;  // with this function the speed will sum with the angle every time until set back to 0 by the modulo
    }
  }

  // scale planet, start with initial scale 1, then if the planet gets away from its initial position, it will be scaled
  void scalePlanet() {
    scaleNumber = 1 + dist(planetX, planetY, initX, initY)/400;
  }

  // the planet will automaticly lerp to the recordplayer disk space or it will go back to its initial position
  void moveAutomatic(boolean inDiskArea, RecordPlayer recordPlayer) {
    if (inDiskArea) {  // all if the condition inDiskArea is true, this condition is connected to the boolean method from recordPlayer that checks if planet is in Disk area
      planetX = lerp(planetX, recordPlayer.recordPlayerX, 0.05);
      planetY = lerp(planetY, recordPlayer.recordPlayerY, 0.05);
    } else {
      planetX = lerp(planetX, initX, 0.05);
      planetY = lerp(planetY, initY, 0.05);
    }
  }

  // select planet method, that returns isSelected is true if the mouse is over a planet, this method is only called when you mouse press, thats why we can call it select
  boolean select(float mousePosX, float mousePosY) {
    isSelected = false;
    if (dist(mousePosX, mousePosY, planetX, planetY) <= planetRadius*scaleNumber*2) {
      isSelected = true;
    }
    return isSelected;
  }

  // if this method is called the mouseX and the mouseY will be connected to the planet x and y to drag the planet
  void drag(float mousePosX, float mousePosY) {
    if (isSelected) {  //only done on the planet which is selected
      planetX = mousePosX;
      planetY = mousePosY;
      speed = 1;  //this will set back the initial speed value to 1, so that every following up planet has a rotation speed of 1
    }
  }

  // if mouse is released this method will give the value isSelected false, because no planet is selected anymore
  void deselect() {
    isSelected = false;
  }

}
