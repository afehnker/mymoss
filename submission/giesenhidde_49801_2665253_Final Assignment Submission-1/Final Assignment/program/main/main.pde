/*
Made by Hidde Giesen - s2747065
 Final Assignment for P4WCI
 
I've made Anne's IJssalon. Depending on the time of day and weather different things happen.
Their icecream is as good as Van der Poels so come to Delden some time. :D
*/

//Global Variables
float lengthUnit = height/15; //Used between classes to keep sizes consistant.
//End Global Variables

//Declaring Objects
Background background;
Sliders sliders;
Shopfront shopfront;
//End Declaring Objects

void setup() {
  fullScreen(P2D);    //Made and tested on 2560x1600 and 3440x1440 screens and various resolutions
  //size(1920, 1080, P2D);
  //Initialising Objects
  background = new Background();
  sliders = new Sliders();
  shopfront = new Shopfront(lengthUnit);
  //End Initialising Objects
}

void draw() {
  background(background.red, background.green, background.blue);
  background.update_time();
  background.update_weather();
  shopfront.update();
  
  shopfront.display_static();
  shopfront.display_shop_overlay();
  background.display_weather();
  background.display_overlay();
  sliders.display();//Needs to stay on bottom
}

void mouseDragged() {
  sliders.moveTimeSlider(mouseX, mouseY);
  sliders.moveWeatherSlider(mouseX, mouseY);
}
