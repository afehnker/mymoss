/* This class creates raindrops. They are invisible until they reach a specific y-position 
to make it look like they are falling out of a cloud. */

class rain {
  float xPos;
  float yPos;
  rain(float x, float y) { //giving the initial x- and y-position
    xPos = x;
    yPos = y;
  }
  void display() {
    pushStyle();
    noStroke();
    if (yPos < cloud1.yPosCloud()+250){ //if condition makes sure raindrops are only visible when being under the cloud
    noFill();
    } else {
    fill(random(100,255),random(100,255),random(100,255));
    }
    ellipse(xPos, yPos, 5, 50); //shape of the raindrops 
    popStyle();
  }
  void update() {
    yPos += random(0.1, 5); //to make it more realistic the raindrops change their speed randomly with every update
    if (yPos < cloud1.yPosCloud()+250){
    xPos = cloud1.xPosCloud()+random(50,550) + random(-1, 1); //if condition sets the raindrops position, based on the clouds position
    } else {  //after "falling out" the cloud x-position of the raindrops is fixed.
      xPos += random(-1,1);  //giving the raindrops a small "shake" effect which makes them look more real
    }
  }
}
