/* This class creates the windows and its animations. Also it returns if the courser is above it.
*/

class window {
  int xPos;
  int yPos;
  int xPos2;
  int coverWidth;
  int windowWidth;
  int windowHeight;
  boolean openWindow;

  window(int x, int y) {
    xPos = x;
    yPos = y;
    windowWidth = 300;
    windowHeight = 300;
    coverWidth = windowWidth/2; //covers have half the length of the window
    xPos2 = xPos + windowWidth; //second cover x-position
    openWindow = false;
  }
  void display() {
    strokeWeight(4);
    //fill(0);
    //rect(xPos, yPos, windowWidth, windowHeight);
    fill(102, 51, 0);
    rect(xPos, yPos, coverWidth, windowHeight); //left window cover
    rect(xPos2, yPos, -coverWidth, windowHeight); //right window cover
    rect(xPos+coverWidth-10, yPos, 10, windowHeight); //left window cover "front"
    rect(xPos2-coverWidth, yPos, -10, windowHeight); //right window cover "front"
  }
  void update() {
    if (coverWidth >= -60 && openWindow == true) { //makes the covers open   
      coverWidth = coverWidth-1;
    } 
  }
  void openWindow() { //method to open the window
    openWindow = true;
  }
  boolean isOver(){ //checks if the curser is placed over the window
    if (mouseX >= xPos && mouseX <= xPos+windowWidth && mouseY >= yPos && mouseY <= yPos+windowHeight){
    return true;
    } else {
      return false;
    }
  }
  boolean windowIsOpen(){ //to know if the window is opened
    if (openWindow == true){
      return true;
    } else {
      return false;
    }
  }
  int xPosWindow(){ //gives the windows x position
    return xPos;
  }
  int yPosWindow(){ //fives the windows y postion
    return yPos;
  }
}
