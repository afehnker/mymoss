/* This class creates the door and its animation. Also it returns if the courser is above it.
*/

class door {
  int xPos;
  int yPos;
  int doorHeight;
  int doorWidth;
  float doorWidthOffset;
  int doorHeightOffset;
  boolean openDoor;
  boolean doorIsOpen;

  door(int x, int y) {
    xPos = x;
    yPos = y;
    doorHeight = 400;
    doorWidth = 400;
    doorWidthOffset = 0;
    doorHeightOffset = 0;
  }
  void display() {
    strokeWeight(4);
    fill(50);
    rect(xPos-20, yPos-20, doorWidth+40, doorHeight+40); //doorframe
    rect(xPos, yPos, doorWidth, doorHeight);
    pushStyle();
    for (int i = 0; i <= 100; i = i + 1) { //door background (might move to the class that is behind the window
      pushStyle();
      noStroke();
      fill(i*2);
      rect(xPos+ i, yPos + i, doorWidth - i*2, doorHeight - i);
      popStyle();
    }
    pushStyle();
    strokeWeight(1);
    fill(102, 51, 0);
    if (doorHeightOffset > -400){ //switching vertex for more realistic look
    beginShape();
    vertex(xPos - doorWidthOffset, yPos - doorHeightOffset+15);
    vertex(xPos + doorWidth + doorWidthOffset, yPos - doorHeightOffset+15);
    vertex(xPos + doorWidth, yPos + doorHeight);
    vertex(xPos, yPos + doorHeight);
    vertex(xPos - doorWidthOffset, yPos - doorHeightOffset+15);
    endShape();
    } else {
    beginShape();
    vertex(xPos - doorWidthOffset, yPos - doorHeightOffset);
    vertex(xPos + doorWidth + doorWidthOffset, yPos - doorHeightOffset);
    vertex(xPos + doorWidth, yPos + doorHeight);
    vertex(xPos, yPos+doorHeight);
    vertex(xPos - doorWidthOffset, yPos - doorHeightOffset);
    endShape();
    }
    rect(xPos - doorWidthOffset, yPos - doorHeightOffset, doorWidth + doorWidthOffset*2, 15); //door "front"
    popStyle(); 
    if (doorIsOpen == true){ //dragon appears, once the door is opened
      dragon.update();
      dragon.display();
    }
  }
  void update() {
    if (doorHeightOffset > -550 && openDoor == true) { // opens the door by manipulating the vertex
      doorWidthOffset = doorWidthOffset + 0.1;
      doorHeightOffset = doorHeightOffset - 1;     
    } else if (doorHeightOffset <= -550){
      doorIsOpen = true; //sets the door state to open
    }
  }
  boolean dragonAppear(){ //used in evil class to know if the door is opened
    if(doorIsOpen == true){
      return true;
    }else{
      return false;
    }
  }
  void openDoor() { //method to open the door
    openDoor = true;
  }
  boolean isOver(){ //checks if the curser is placed over the door and returns the state
    if (mouseX >= xPos && mouseX <= xPos+doorWidth && mouseY >= yPos && mouseY <= yPos+doorHeight){
    return true;
    } else {
      return false;
    }
  }
}
