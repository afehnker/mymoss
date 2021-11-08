/*
Shopwindow by Wieger Wittrock, group 1.
 31-10-2021
 This interactive shopwindow has elements of the real shop "By Jan Marc" in Hengelo
 */
class Locker { //class for the locker, that also connects the locker door and the tshirts

  int lockerX; //we use this to Push and popmatrix the locker, so we are sure the locker is symetrical drawn 
  int lockerY;

  LockerDoor door; //object of different classes that are used in this class.
  Clothes[] clothes; //in an array so we can easily have multiple of them

  Locker() {
    lockerX = width/2; //locker is in the middle of the X-axis
    lockerY = 550; 
    door = new LockerDoor();
    clothes = new Clothes[int(random(3, 5))]; //3,8
    for (int i = 0; i < clothes.length; i++) {
      clothes[i] = new Clothes(int(random(400-180, 400-80)), 379, color(random(200, 255), random(0, 100), random(0, 100)) ); 
      //give values to the tshirts, at a random position on the left locker hanger, with a random red-ish color
    }
  }

  void display() {
    pushMatrix();
    translate(lockerX, lockerY);//new middlepoint

    //middle locker
    fill(170, 136, 115);
    stroke(0);
    rect(0, 0, 400, 500);

    //topback locker
    fill(180, 146, 125);
    quad(200, -250, 190, -260, -210, -260, -200, -250);

    //leftback locker
    quad(-200, 250, -210, 240, -210, -260, -200, -250);

    //leftinside of the locker
    fill(0, 30);
    strokeWeight(2);
    line(-190, -180, -70, -180); //this is the left hanger beam
    strokeWeight(1);
    quad(-190, -240, -70, -240, -70, 240, -190, 240);

    //middleinside
    fill(145, 116, 98);    
    quad(-60, -240, 60, -240, 60, 240, -60, 240);  
    for (int i =-210; i<-180; i+=10) { //we draw the vents
      strokeWeight(2);
      stroke(55, 43, 36);
      line(-40, i, 40, i); //first line is darker
      stroke(151, 116, 95);
      strokeWeight(3);
      line(-40, i-1.5, 40, i-1.5); //second one is brown
      stroke(0);
    }
    strokeWeight(2);
    stroke(55, 43, 36);
    line(-40, 200, 40, 200); //this is the vent at the bottom, I chose to only have one of them at the bottom
    stroke(151, 116, 95);
    strokeWeight(3);
    line(-40, 200-1.5, 40, 200-1.5);
    stroke(0);
    strokeWeight(1);
    door.display(); //we display the locker door in the middle part of the locker

    //rightinside
    fill(0, 30);
    strokeWeight(2);
    line(70, -180, 190, -180); //this is the right hanger beam
    strokeWeight(1);
    quad(70, -240, 190, -240, 190, 240, 70, 240);
    popMatrix();

    for (int i = 0; i < clothes.length; i++) {
      clothes[i].display(); //we display all the tshirt in a loop, since the objects are in an array
    }
  }


  void update() {
    door.update();
    for (int i = 0; i < clothes.length; i++) {
      clothes[i].update();
      if (clothes[i].clothesX < 450 && clothes[i].clothesX > 400 && clothes[i].clothesY > 400 && clothes[i].clothesY < 720 && door.isOpen && !clothes[i].grabbedTshirt) {
        //we check if there is a tshirt above the locker, and the locker door is open. In that case the shirt will go inside the locker
        clothes[i].isInDoor = true;
      }
      if (door.isOpening) {
        clothes[i].changeColor(); //if the door is opened again, then the shirts will jump out and have a different color
      }
    }
  }

  void dragMouseLocker(float mouseXParameter, float mouseYParameter) {//parameters for mouseX and mouseY, in the main tab. this method is called in mouseDragged
    for (int i = 0; i < clothes.length; i++) {
      clothes[i].dragTshirt(mouseXParameter, mouseYParameter); //you can drag the selected tshirt, this is done in the Shop class
    }
  }

  void pressMouseLocker(float mouseXParameter, float mouseYParameter) {//parameters for mouseX and mouseY, in the main tab. this method is called in mousePressed
    for (int i = clothes.length-1; i >= 0; i--) {   //reversed the loop,so you grab the top tshirt and not the one in the back
      if (clothes[i].nearTshirt(mouseXParameter, mouseYParameter)) { //this is a boolean method in the Clothes class that will return true if the mouse is near the shirt
        clothes[i].selectTshirt(mouseXParameter, mouseYParameter); //only ONE shirt can get selected, because of the break.
        break;
      }
    }
    door.openAndCloseDoor( mouseXParameter, mouseYParameter); //we also call the open/close method for the locker door, when you press the mouse
  }

  void releaseMouseLocker(float mouseXParameter, float mouseYParameter, float previousMouseXParameter, float previousMouseYParameter) {//called in mouseReleased
    for (int i = 0; i < clothes.length; i++) { 
      clothes[i].releaseTshirt( mouseXParameter, mouseYParameter, previousMouseXParameter, previousMouseYParameter); 
      //this will set a boolean in the Clothes class to false, and the selected tshirt is let go!
      //this also makes it so the shirt will get the speed of the mouse, thats why we have mouseX,mouseY,pmouseX,pmouseY as parameters. With these we calculate
      //the speed the shirt gets, in the Clothes class
    }
  }

  void resetShirtPosition() {//this called when you press a key
    for (int i = 0; i < clothes.length; i++) { 
      clothes[i].resetPositionTshirts(); //reset the shirt position, just in case some shirts dissapear
    }
  }
}
