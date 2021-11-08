class Bicycle { // displays bicycle

  /* every part is available in multiple styles: race, regular, mtb all in their own respective style folder
   every part is called wheel.png, frame.png etc.
   the default bicycle shown when nothing has been selected is the mountain bike*/
  PImage wheelImage = loadImage("bikeparts/mtb/wheels.png"); 
  PImage frameImage = loadImage("bikeparts/mtb/frame.png");
  PImage handlebarImage = loadImage("bikeparts/mtb/handlebars.png"); 

  /* floats for offsets, every bicycle frame has different attachment points for the bicycle parts, 
   these values change when changing frames, 
   default is that of mountain bike */
  float frameXPosition = width/2;
  float frameYPosition = height/2.18;
  float leftWheelXOffset = -0.13*width;
  float rightWheelXOffset = 0.1275*width;
  float wheelsYOffset = 0.1*height;
  float handlebarXOffset =  0.0825*width;
  float handlebarYOffset = -0.14*height;

  void display() {
    pushMatrix();
    translate(frameXPosition, frameYPosition); // set position of the frame to be 0,0

    pushMatrix();
    translate(leftWheelXOffset, wheelsYOffset); // set the wheels to be in their own matrix, for rotating
    rotate(0.1*frameCount);
    image(wheelImage, 0, 0); // left wheel
    popMatrix();

    pushMatrix();
    translate(rightWheelXOffset, wheelsYOffset); // set the wheels to be in their own matrix, for rotating
    rotate(0.1*frameCount);
    image(wheelImage, 0, 0); // right wheel
    popMatrix();

    image(frameImage, 0, 0); // frame
    image(handlebarImage, handlebarXOffset, handlebarYOffset); // handlebars
    popMatrix();
  }
}
