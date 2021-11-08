/**
  this class handles the display and the opening and closing of the stoor doors.
**/

class Doors {
  float doorWidth;
  color door = color(196, 72, 82);
  color doorShadow = color(155, 62, 64);
  color doorLight = color(224, 92, 112);
  color window = color(48, 48, 72, 128);
  color windowlight = color(172, 172, 216);
  
  public Doors() {
    doorWidth = 205;
  }
  
  void display() {
    pushMatrix();
    translate(1125,610);
    // left door
    pushMatrix();
    translate(-102.5,-1.5);
    drawDoor();
    popMatrix(); 
    // right door
    pushMatrix();
    translate(102.5,-1.5);
    drawDoor();
    
    popMatrix();
    
    popMatrix();
  }
  
  void drawDoor() {
    float doorHeight = 503;
    fill(door);
    rect(0,0,doorWidth, doorHeight);
    fill(window);
    rect(0,-10,doorWidth-40,doorHeight-220);
    
    fill(doorShadow);
    rect(0,-200,doorWidth-40,40);
    rect(0,180,doorWidth-40,60);
    
    fill(door);
    rect(0,-200,doorWidth-50,30);
    rect(0,180,doorWidth-50,50);
    
    fill(doorLight);
    rect(0,-200,doorWidth-60,25);
    rect(0,180,doorWidth-60,45);
    
    rect(0,240,doorWidth,20);
    
    
  }
}
