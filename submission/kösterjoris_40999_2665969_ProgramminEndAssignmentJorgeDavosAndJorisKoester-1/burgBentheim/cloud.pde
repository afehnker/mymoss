/*   This class gives the cloud picture its position and makes them fly in random speed, size and position
     above the castle  
*/

class cloud {
  float xPos;
  float yPos;
  float cloudSpeed;
  float cloudStart;
  boolean rain;

  cloud() {
    cloudSpeed = random(1, 3);  //getting the cloud speed
    cloudStart = random(50, 500);  //getting the clouds start x-position
    xPos = (cloudStart+1600); //setting clouds initial x-position
    yPos = random(-150, 0); //setting clouds initial y-position (does not change)
  }
  void display() {
    image(cloud, xPos, yPos);
  }
  void update() {
    xPos = xPos - cloudSpeed; //making the cloud move to the left by substracting the speed
    if (xPos <= -1000) { //if the cloud moves out of the windows borders it is reset with new random values
      cloudSpeed = random(1, 3);
      cloudStart = random(50, 500);
      xPos = (cloudStart+1600);
      yPos = random(-200, -50);
      rain = false;  //resets the rain boolean, the cloud can rain again
    }
  }
  void startRain(){
    for (int i=0; i<raindrops.length; i++) { //instances of raindrops are created inside the array
    raindrops[i] = new rain(xPos+random(50, 550), -900+random(10, 900));
    }
    rain = true;
  }
  float xPosCloud(){ //to get the clouds x position
    return xPos;
  }
  float yPosCloud(){ //to get the clouds y position
    return yPos;
  }
  boolean isRaining(){ //cloud can only rain once per reset
    if (rain==true){
      return true;
    }else{
      return false;
    }
  }
  boolean isOver(){ //checks if the courser is above the cloud
    if (mouseX >= xPos && mouseX <= xPos+600 && mouseY >= yPos && mouseY <= yPos+318){
      return true;
    } else {
      return false;
    }
  
}
}
