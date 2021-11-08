import processing.sound.*;

SoundFile recordScratch;
posterTop posterTop;
glassDoor glassDoor;
records records;

People Fred;
People John;
People Sam;
People Dora;
People Sara;

PImage shopFront;

People[] Persone = new People[6];
boolean keyX=false;
int lastTimeCheck;
int timeIntervalFlag = 3000; // 3 seconds because we are working with millis
int positionMouseX = mouseX;
int positionMouseY = mouseY;

void setup() {                                                                        
  size(872, 635); 

  shopFront = loadImage("shopFrontCorrect.jpg");
  posterTop = new posterTop();
  glassDoor = new glassDoor();
  records = new records();
  recordScratch = new SoundFile(this, "sounds/recordScratch.wav");


  //starting placement X and Y
  Fred = new People(500, 300);//random starting position x
  John = new People(10, 300);//random starting position x
  Sam  = new People(700, 300);
  Dora = new People(300, 300);
  Sara = new People(200, 300);
}

void draw() {
  positionMouseX = mouseX;
  positionMouseY = mouseY;

  background(shopFront);
  strokeWeight(0);

  posterTop.display();
  records.display();
  glassDoor.display();

  scale(1.6);

  Fred.display();
  John.display();
  Sam.display();
  Dora.display();
  Sara.display();

  Fred.update();
  John.update();
  Sam.update();
  Dora.update();
  Sara.update();
  
  //checking if the mouse is over the left record
  float disXLeft = 142 - mouseX;
  float disYLeft = 357 - mouseY;
  if (sqrt(sq(disXLeft) + sq(disYLeft)) < 38 ) {
    records.leftRecordColor = color(255, 50);
  } else {
    records.leftRecordColor = color(255, 0);
  }

  //checking if the mouse is over the right record
  float disXRight = 713 - mouseX;
  float disYRight = 361 - mouseY;
  if (sqrt(sq(disXRight) + sq(disYRight)) < 38 ) {
    records.rightRecordColor = color(255, 50);
  } else {
    records.rightRecordColor = color(255, 0);
  }
}

void mousePressed() {
  //stopping the people
  Fred.PeoplePressed();
  John.PeoplePressed();
  Sam.PeoplePressed();
  Dora.PeoplePressed();
  Sara.PeoplePressed();

  //playing the record noises
  float disXLeft = 142 - mouseX;
  float disYLeft = 357 - mouseY;
  float disXRight = 713 - mouseX;
  float disYRight = 361 - mouseY;
  if ((sqrt(sq(disXLeft) + sq(disYLeft)) < 38) || (sqrt(sq(disXRight) + sq(disYRight)) < 38 )) {
    recordScratch.play();
  }

  //changing the poster colors
  if (mouseY > 142 && mouseY < 245) {
    if (mouseX > 32 && mouseX < 107) {
      posterTop.colorPoster1 = color(random(00, 255), random(0, 255), random(0, 250));
    }
    if (mouseX > 116 && mouseX < 190) {
      posterTop.colorPoster2 = color(random(00, 255), random(0, 255), random(0, 250));
    }
    if (mouseX > 198 && mouseX < 274) {
      posterTop.colorPoster3 = color(random(00, 255), random(0, 255), random(0, 250));
    }
    if (mouseX > 284 && mouseX < 349) {
      posterTop.colorPoster4 = color(random(00, 255), random(0, 255), random(0, 250));
    }
    if (mouseX > 366 && mouseX < 430) {
      posterTop.colorPoster5 = color(random(00, 255), random(0, 255), random(0, 250));
    }
    if (mouseX > 442 && mouseX < 509) {
      posterTop.colorPoster6 = color(random(00, 255), random(0, 255), random(0, 250));
    }
    if (mouseX > 518 && mouseX < 587) {
      posterTop.colorPoster7 = color(random(00, 255), random(0, 255), random(0, 250));
    }
    if (mouseX > 601 && mouseX < 671) {
      posterTop.colorPoster8 = color(random(00, 255), random(0, 255), random(0, 250));
    }
    if (mouseX > 670 && mouseX < 756) {
      posterTop.colorPoster9 = color(random(00, 255), random(0, 255), random(0, 250));
    }
    if (mouseX > 754 && mouseX < 842) {
      posterTop.colorPoster10 = color(random(00, 255), random(0, 255), random(0, 250));
    }
  }
}
