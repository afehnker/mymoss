class People {
  int whichPerson;
  PImage person1;
  PImage person2;
  PImage person3;
  PImage person4;
  PImage person5;
  int personWidth;
  int personHeight;
  int personX;
  int personY;
  int speedX;
  People(int initY, int initX, int initSpeedX, int personNr ) {
    whichPerson = personNr;
    personWidth = 500;
    personHeight = 450;
    person1 = loadImage("person1.png");
    person1.resize(personWidth, personHeight);
    person2 = loadImage("person2.png");
    person2.resize(personWidth, personHeight);
    person3 = loadImage("person3.png");
    person3.resize(personWidth, personHeight);
    person4 = loadImage("person4.png");
    person4.resize(personWidth, personHeight);
    person5 = loadImage("person5.png");
    person5.resize(personWidth, personHeight);
    personX = initX;
    personY = initY;
    speedX = initSpeedX;
  }
  void display() {
    // checks the value of whichPerson and draws the according person
    if (whichPerson == 1) {
      image(person1, personX, personY+50);
    } else if (whichPerson == 2) {
      image(person2, personX, personY);
    } else if (whichPerson == 3) {
      image(person3, personX, personY);
    } else if (whichPerson == 4) {
      image(person4, personX, personY);
    } else if (whichPerson == 5) {
      image(person1, personX, personY);
    }
  }
  void update(int rightBound) {
    //sets a speed and bounds
    personX = personX + speedX;
    if (personX>rightBound) {
      speedX = -speedX;
    } else if (personX< -800) {
      speedX = -speedX;
    }
  }
}
