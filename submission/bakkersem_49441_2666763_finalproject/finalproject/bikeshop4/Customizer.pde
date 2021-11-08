class Customizer { // changes parts of the bicycle
  void changePart(String part, String set) { // change the image to the part of type, examples: change frame to the frame of sport set
    if (part == "wheels") {
      bicycle.wheelImage = loadImage("bikeparts/"+set+"/"+part+".png");
    }
    if (part == "frame") {
      bicycle.frameImage = loadImage("bikeparts/"+set+"/"+part+".png");
      changeOffset(set); // change the offsets to match with the current bicycle frame
    }
    if (part == "handlebars") {
      bicycle.handlebarImage = loadImage("bikeparts/"+set+"/"+part+".png");
    }
  }


  void changeOffset(String type) { // change the offsets of the bicycle parts to match with the frame
    
    //list of different offset values
    
    //race frame offsets
    float raceFrameYPosition = height/2.25;
    float raceBikeWheelsYOffset = 0.115*height;
    float raceBikeHandlebarXOffset = 0.08*width;
    float raceBikeHandlebarYOffset = -0.13*height; 

    //regular style frame offsets
    float regFrameXPosition = width/2.1;
    float regFrameYPosition = height/2.075;
    float regLeftWheelXOffset = -0.1075*width;
    float regRightWheelXOffset = 0.1525*width;
    float regWheelsYOffset = 0.08*height;
    float regHandlebarXOffset = 0.102*width;
    float regHandlebarYOffset = -0.178*height; 

    //mtb frame offsets
    float mtbFrameYPosition = height/2.18;
    float mtbWheelsYOffset = 0.1*height;
    float mtbHandlebarXOffset = 0.0825*width;
    float mtbHandlebarYOffset = -0.14*height; 

    //offsets that mtb and race have in common
    float mtbAndRaceFrameXPosition = width/2; // mtb and race frames have the same x position so use the same variable for this
    float mtbAndRaceLeftWheelXOffset = -0.13*width; // same for mtb and race
    float mtbAndRaceRightWheelXOffset = 0.1275*width;

    if (type == "regular") {
      //change offsets
      bicycle.frameYPosition = regFrameYPosition;
      bicycle.frameXPosition = regFrameXPosition;
      bicycle.leftWheelXOffset = regLeftWheelXOffset;
      bicycle.rightWheelXOffset = regRightWheelXOffset;
      bicycle.wheelsYOffset = regWheelsYOffset;
      bicycle.handlebarXOffset = regHandlebarXOffset;
      bicycle.handlebarYOffset = regHandlebarYOffset;
    }

    if (type == "race") {
      //change offsets to that of race frame
      bicycle.frameYPosition = raceFrameYPosition;
      bicycle.wheelsYOffset = raceBikeWheelsYOffset;
      bicycle.handlebarXOffset = raceBikeHandlebarXOffset;
      bicycle.handlebarYOffset = raceBikeHandlebarYOffset;
    }
    if (type == "mtb") {
      //change offsets to that of mtb
      bicycle.frameYPosition = mtbFrameYPosition;
      bicycle.wheelsYOffset = mtbWheelsYOffset;
      bicycle.handlebarXOffset = mtbHandlebarXOffset;
      bicycle.handlebarYOffset = mtbHandlebarYOffset;
    }
    if (type == "mtb" || type == "race") {
      //change offsets (these are the same in the race bike and the mtb bike setting, that's why they are grouped)
      bicycle.frameXPosition = mtbAndRaceFrameXPosition;
      bicycle.leftWheelXOffset = mtbAndRaceLeftWheelXOffset; //
      bicycle.rightWheelXOffset = mtbAndRaceRightWheelXOffset; // these should be fused
    }
  }
}
