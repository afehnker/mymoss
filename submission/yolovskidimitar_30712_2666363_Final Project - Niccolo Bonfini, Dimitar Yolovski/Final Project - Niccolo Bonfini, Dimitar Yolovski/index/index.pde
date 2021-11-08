// move all the mousebuttons buttons mouseX mouseY to event handleres, add an animation nested array
boolean isOpen = false;
boolean mouseClick = false; //Lines 2 and 3 are booleans for the door to open and close
int action = 0;
int magazineCount=7;
int peopleCount = 6;
int peopleLeft = -700;
int peopleRight = width + 1200; //Lines 4 to 8 are set integers for variables used in the later in the code
People[] person = new People[peopleCount]; //This is the array for the people walking in front of the shop
int personLocX[] = {peopleLeft, peopleLeft, peopleLeft, peopleRight, peopleRight, peopleRight}; //This is the constructor for the people walking
int personSpeedX[] = {4, 5, 6, 4, 5, 6}; //This is the constructor for the speed of the people walking
magazine[] magazineRow1 = new magazine[magazineCount];
magazine[] magazineRow2 = new magazine[magazineCount];
magazine[] magazineRow3 = new magazine[magazineCount];
magazine[] magazineRow4 = new magazine[magazineCount]; //Lines 12 to 15 are arrays for the comics
int posterCount = 4; //This sets the count for posters as 4
poster[] posters = new poster[posterCount]; //This is the array for the posters
int postX[] = {150, 185, 320, 450};
int postY[] = {450, 580, 550, 400}; //Lines 18 and 19 are the constructors for the posters
int magX[] = {789, 830, 871, 912, 953, 994, 1035};
int magY[] = {540, 590, 640, 690}; //Lines 20 to 21 are the constructors for the magazines
int boxCount = 3; //This sets the count of boxes to 3
Box[] boxes = new Box[boxCount]; //This is the array for the boxes
int boxX[] = {450, 885, 940};
int boxY[] = {225, 215, 230}; //Lines 24 to 25 are the constructors for the boxes
int widthBox[] = {90, 70, 70};
int heightBox[] = {70, 90, 60};//Lines 26 to 27 are the constructors for the boxes dimensions
Shop myShop; //This recals the class shop
door myDoor; //This recals the class door

void setup () {
  int personLocY = height-450;


  size(1300, 800);
  myDoor = new door(650, 495);
  for (int i = 0; i<peopleCount; i++) {
    person[i] = new People(personLocY, personLocX[i], personSpeedX[i], int(random(1, 5)));
  }
  for (int i = 0; i<boxCount; i++) {
    boxes[i] = new Box(boxX[i], boxY[i], widthBox[i], heightBox[i]);
  }
  myShop = new Shop(50, 50);
  for (int i=0; i<magazineCount; i++) {
    magazineRow1[i] = new magazine(magX[i], magY[0]);
  }
  for (int i=0; i<magazineCount; i++) {
    magazineRow2[i] = new magazine(magX[i], magY[1]);
  }
  for (int i=0; i<magazineCount; i++) {
    magazineRow3[i] = new magazine(magX[i], magY[2]);
  }
  for (int i=0; i<magazineCount; i++) {
    magazineRow4[i] = new magazine(magX[i], magY[3]);
  }
  for (int i = 0; i<posterCount; i++) {
    posters[i] = new poster(postX[i], postY[i]);
  }
  //IDK WHAT ANY OF THESE DO
}


void draw() {
  background(190);
  //draws everything
  myShop.display();
  
  myDoor.display(isOpen, mouseClick);


  for (int i=0; i<magazineCount; i++) {
    magazineRow1[i].display();
  }
  for (int i=0; i<magazineCount; i++) {
    magazineRow2[i].display();
  }
  for (int i=0; i<magazineCount; i++) {
    magazineRow3[i].display();
  }
  for (int i=0; i<magazineCount; i++) {
    magazineRow4[i].display();
  }
  for (int i = 0; i<posterCount; i++) {
    posters[i].display();
  }

  for (int i = 0; i<boxCount; i++) {
    boxes[i].display();
  }
  for (int i = 0; i<peopleCount; i++) {
    person[i].display();
  }
  for (int i = 0; i<peopleCount; i++) {
    person[i].update(width + 1300);
  }
  //recives information on which hero is going to be drawn
  myShop.update(action);
}
void mousePressed() {
  //recevie information of the window location
  float windowX = myShop.originalX();
  float windowY = myShop.originalY();
  if (mouseButton == RIGHT) {
    //it sends information about the mouse location
    isOpen = myDoor.isOver(mouseX, mouseY);
    //inverts mouseClick value
    mouseClick = !mouseClick;
    // sends the middle box to a random location inside teh window
    boxes[2].rngLocation(windowX+30, windowY+363, windowX +430, windowY+320, mouseX, mouseY);
    //checks if the mouse is over the poster and if it is it removes one
    for (int i = 0; i<posterCount; i++) {
      if (posters[i].isOver(mouseX, mouseY )) {
        posterCount = posterCount-1;
      }
    }
  } else if (mouseButton == CENTER) {
    //resets the location and poster count
    boxes[2].resetBox();
    boxes[0].resetBox();
    posterCount = 4;
  }
}
void keyPressed() {
  // checks what button is pressed 
  if ( key == '\t') {
    boxes[1].change(); //NOT SURE
  } else if (key == '-') {
    for (int i=0; i<magazineCount; i++) {
      magazineRow1[i].update(); //Lines 122 to 124 are the command for which, if the minus sign key is pressed, the magazines change color
    }
    for (int i=0; i<magazineCount; i++) {
      magazineRow2[i].update();
    }
    for (int i=0; i<magazineCount; i++) {
      magazineRow3[i].update();
    }
    for (int i=0; i<magazineCount; i++) {
      magazineRow4[i].update();
    }
  } else if (key == '1') {
    action = 3;
  } else if (key == '2') {
    action = 1;
  } else if (key == '3') {
    action = 2;
  }
}

void mouseDragged() {
  // checks if the left button is clicked while dragging the mouse 
  if (mouseButton == LEFT) {
    boxes[0].update(mouseX, mouseY);
  }
} //Lines 148 to 152 is the mouseDragged command for the box, when the mouse is draged the box moves with it
