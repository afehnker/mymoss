/*
 The Sky is a color pattern that will change within time.
 A counter will update the blue value, where changes happed as day and night.
 
 Code written by Susanne Fuentes Bongenaar
*/

class Sky {
  float skyX;
  float skyY;
  float skySize;
  int timeCounter;
  int colorCounter;
  color skyColor;
  

  //give a referencepoint (x,Y) and a sky size
  Sky(float initX, float initY, float initSize) {
    skyX = initX;
    skyY = initY;
    skySize = initSize;
    timeCounter = 1600;
    colorCounter = 0;
  }

  void display() {
    pushMatrix();
    translate(skyX, skyY);
    
    //draw the sky
    noStroke();
    fill(skyColor);
    rect(0, 0, width, skySize);
    popMatrix();
  }

  //update the skycolor according to the time
  void update() {
    //check if it is night time, draw a dark sky
    if (timeCounter >= 1200) {
      skyColor = color(0, 0, 0);
      timeCounter--;
    }
    //check if it is dawn, increase the blue sky color value
    else if (timeCounter < 1200 && timeCounter > 945) {
      skyColor = color(0, 0, colorCounter);
      colorCounter++;
      timeCounter--;
    }
    //check if it is day time, keep the previous sky color
    else if (timeCounter <= 945 && timeCounter > 500) {
      timeCounter--;
    }
    //check if the sun sets, decrease the blue sky color value
    else if (timeCounter <= 500 && timeCounter > 0) {
      skyColor = color(0, 0, timeCounter);
      timeCounter--;
    }
    //check night time, reset all counters
    else if (timeCounter == 0) {
      timeCounter = 1700;
      colorCounter = 0;
    }
  }
}
