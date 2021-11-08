class Background {

  //Global Variables
  color skyColor;
  int red = 171;
  int green = 240;
  int blue = 255;
  boolean darkerSky;
  boolean isSunny;
  boolean isCloudy;
  boolean isRainy;
  PImage rainGif;
  float rainYPos1;
  float rainYPos2;
  //End Global Variables

  //Declaring Objects
  //End Declaring Objects

  Background() {
    rainGif = loadImage("rain.gif");
    rainYPos1 = 0;
    rainYPos2 = -height;
    //Initialising Objects
    //End Initialising Objects
  }//End of background constr.

  void update_time() {
    red = 171;
    green = 240;
    blue = 255;
    skyColor = color(red, green, blue);
    darkerSky = false;
    if (sliders.timeSliderXPos <= 25 || sliders.timeSliderXPos >= 87.5) {//Change color of sky depending on time of day
      red = 23;
      green = 32;
      blue = 66;
      darkerSky = true;
    } else if (sliders.timeSliderXPos > 25 && sliders.timeSliderXPos <= 37.5 || sliders.timeSliderXPos < 87.5 && sliders.timeSliderXPos >= 75) {
      red = 68;
      green = 88;
      blue = 166;
      darkerSky = true;
    }//End time of day checker
  }//End of update_time

  void update_weather() {
    if (sliders.weatherSliderXPos > 100/3 && sliders.weatherSliderXPos <= 200/3) {  //Cloudy weather
      isSunny = false;
      isCloudy = true;
      isRainy = false;
      background.darkerSky = true;
    } else if (sliders.weatherSliderXPos > 200/3) {  //Rainy weather
      isSunny = false;
      isCloudy = false;
      isRainy = true;
      darkerSky = true;
    } else {
      isSunny = true;
      isCloudy = false;
      isRainy = false;
    }
  }//End of update_weather

  void display_weather() {
    if (isRainy) {
      background.display_rain();
    }
  }//End of display_weather

  void display_overlay() {
    if (darkerSky) {
      fill(59, 24, 102, 75);
      rect(0, 0, width, height);
    }//Add dark overlay over entire screen for dusk, night and rain.
  }//End of display_overlay

  void display_rain() {
    float rainFallSpeed = 15;
    image(rainGif, 0, rainYPos1, width, height);
    image(rainGif, 0, rainYPos2, width, height);
    rainYPos1 += rainFallSpeed;
    rainYPos2 += rainFallSpeed;
    if (isRainy && (rainYPos1 > height)) {
      rainYPos1 = -height;
    }
    if (isRainy && (rainYPos2 > height)) {
      rainYPos2 = -height;
    }
  }//End of display_rain
}//End of class background
