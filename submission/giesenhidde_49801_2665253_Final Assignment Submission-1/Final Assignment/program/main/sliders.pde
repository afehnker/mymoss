class Sliders {

  //Global Variables
  float timeSliderXPos;
  float weatherSliderXPos;
  
  //End Global Variables

  Sliders() {
    timeSliderXPos = 50;
    weatherSliderXPos = 0;
  }//End of sliders constr.

  void display() {
    //Sliders + Text
    float timeSliderYPos = (height/18+height/288+1);
    float weatherSliderYPos = (2*height/18+height/288+1);
    float timeSpeed = 0.1;
    int timeSliderText = 0;
    stroke(100);
    strokeWeight(1);
    fill(255);
    rect( (width-(7*width/18)), (height/18), (6*width/18), (height/144) );    //Time Slider
    rect( (width-(4*width/18)), (2*height/18), (3*width/18), (height/144) );  //Weather Slider
    fill(255, 255, 255, 50);
    rect( (width-(7*width/18)), (height/18), (6*width/18), (height/24) );     //Time Slider Text Box
    rect( (width-(4*width/18)), (2*height/18), (3*width/18), (height/24) );   //Weather Slider Text Box
    for (int i = (width-(7*width/18)); i < (width-width/18-width/72); i += width/72) {  //text for different times of day
      fill(0);
      textSize(height/72);
      text(timeSliderText, i+width/144, (height/18+height/24-height/144) );
      timeSliderText += 1;
    }//End of time for loop
    text("Sunny", width-4*width/18+width/54, (2*height/18+height/24-height/144) );
    text("Cloudy", width-3*width/18+width/54, (2*height/18+height/24-height/144) );
    text("Rainy", width-2*width/18+width/54, (2*height/18+height/24-height/144) );

    //Slider Buttons
    fill(255);
    ellipse( ((width-(7*width/18))+((timeSliderXPos/100)*6*width/18)), timeSliderYPos, height/72, height/72 );
    ellipse( ((width-(4*width/18))+((weatherSliderXPos/100)*3*width/18)), weatherSliderYPos, height/72, height/72 );
    noStroke();
    timeSliderXPos = (timeSliderXPos + timeSpeed) % 101;
}//End of display

  void moveTimeSlider(float mouseXPos, float mouseYPos) {
    if (mouseXPos >= (width-7*width/18) && mouseXPos <= (width-width/18) && mouseYPos <= (height/18+height/288+1+height/144) && mouseYPos >= (height/18+height/288+1-height/144) ) {
      timeSliderXPos = (mouseXPos-(width-7*width/18))/( width-12*width/18)*100;
    }
  }//End of moveTimeSlider
  
  void moveWeatherSlider(float mouseXPos, float mouseYPos) {
    if (mouseXPos >= (width-4*width/18) && mouseXPos <= (width-width/18) && mouseYPos <= (2*height/18+height/288+1+height/144) && mouseYPos >= (2*height/18+height/288+1-height/144) ) {
      weatherSliderXPos = (mouseXPos-(width-4*width/18))/( width-15*width/18)*100;
    }
  }//End of moveWeatherSlider
}//End of class sliders
