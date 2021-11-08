/*
  PortalParts creates and animates the portal, by makinbg three seperate archs rotate.
  Author: Door
*/

class PortalParts {
  
  float beginPortal;
  float endPortal;
  float distanceLines;
  float speedPortal;
  float strokeWeightPortal;
  float portalX;
  float portalY;
  
  PortalParts(float xPos, float yPos, float initBegin, float initEnd, float initDistance, float initSpeed, float initStroke) {
    
    portalX = xPos;
    portalY = yPos;
    distanceLines=initDistance;
    beginPortal = initBegin;
    endPortal = initEnd;
    speedPortal = initSpeed;
    strokeWeightPortal=initStroke;
  }

  void display() {
    stroke(255);
    noFill(); //because it's an arc 
    strokeWeight(strokeWeightPortal);
    pushMatrix();
    translate(portalX,portalY);
    for (float i=3; i<500; i=i+distanceLines) { //placing the arcs at an even distance by changing size based on i
      arc(0, 0, 40+i, 40+i, beginPortal+i, endPortal+i);
    }
   popMatrix(); 
  }

  void update() {
    //making tha arcs move
    beginPortal = beginPortal+speedPortal; //moving the begin position further on the circle
    endPortal = endPortal+speedPortal; //moving it the same distance as the begin so the begin doesn't gain on the end
  }
  
  void setNewSpeed(float newSpeed){
    
    speedPortal = newSpeed;
  
  }
}
