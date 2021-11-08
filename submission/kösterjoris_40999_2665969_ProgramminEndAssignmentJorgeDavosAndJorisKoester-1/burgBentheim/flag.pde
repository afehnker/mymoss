/* creates the flag and flagpost */

class flag{
  int xPos;
  int yPos;
  int postWidth = 30;
  int postHeight = 800;
  int flagWidth = 200;
  int flagHeight = 350;
  boolean raiseFlag = false;
  //flag constructor
  flag(){
    xPos = width/2;
    yPos = height/2;
  }
  void display(){
    pushStyle();
    strokeWeight(2);
    fill(255,0,0);
    rectMode(CORNER);
    rect(width/2, postHeight-flagHeight, flagWidth, 70);
    fill(255,255,0);
    rect(width/2, postHeight-flagHeight + 70, flagWidth, 70);
    rectMode(CENTER);
    strokeWeight(2);
    fill(190);
    rect(width/2, height/2, postWidth, postHeight);
    popStyle();
  }
  void update(){ //makes the flag go up when the post is clicked
    if (raiseFlag == true && flagHeight <= 690) {
      flagHeight++;
    }
  }
  void raise(){ //sets the raise value to true
    raiseFlag = true;
  }
  boolean isOver(){ //checks if courser is above the flagpost
  if (mouseX >= width/2-postWidth/2 && mouseX <= width/2+postWidth/2 && mouseY >= height/2-postHeight/2 && mouseY <= height/2){
    return true;
  }else{
    return false;
  }
  }
}
