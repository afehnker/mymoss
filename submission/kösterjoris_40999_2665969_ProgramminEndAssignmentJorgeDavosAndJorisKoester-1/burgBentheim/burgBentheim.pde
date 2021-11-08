/* This interactive animation was made on the base of a cafe in bad bentheims castle.
You can click on different things and see what happens. At some point you might even use
the spacebar.
*/

PImage background;
PImage cloud;
PImage princessHead;
PImage princessBody;
PImage coffeeMug; //<>//
PImage fire;
PImage bigWing;
PImage smallWing;
PImage body;
PImage tail;
PImage mouth;
window window1;
window window2;
princess princess;
coffeeMug coffee;
door door;
flag flag;
cloud cloud1;
dragon dragon;
fireBall[] balls;
rain[] raindrops;


void setup() {
  size(1600,1000,P2D); //P2D added to only render in 2 dimension due to lags
  background = loadImage("background.png");
  cloud = loadImage("cloud.png");
  princessHead = loadImage("PrincessHead.png");
  princessBody = loadImage("PrincessBody.png");
  coffeeMug = loadImage("coffeeMug.png");
  fire = loadImage("fire.png");
  bigWing = loadImage("Big_Wing.png");
  smallWing = loadImage("Small_Wing.png");
  body = loadImage("Body.png");
  tail = loadImage("Tail.png");
  mouth = loadImage("mouth.png");
  window1 = new window(155,270);
  window2 = new window(1155,270);
  princess = new princess();
  coffee = new coffeeMug();
  door = new door(600,500);
  flag = new flag();
  cloud1 = new cloud();
  raindrops = new rain[2000]; //defines the number of drops
  dragon = new dragon(width/2, 825);
  balls = new fireBall[500]; //number of  fireballs when the dragon opens its mouth
}

void draw() {
  background(173, 216, 255);
  if (cloud1.isRaining() == true){
  for (rain drop : raindrops) { //raindrops are only updated and displayed once they were created
    drop.update();
    drop.display();
    }
  }
  cloud1.update();
  cloud1.display();
  flag.update();
  flag.display();
  fill(0,255,0);
  strokeWeight(4);
  ellipse(width/2, 1000, width*2, 800);
  image(background, 0, 0);
  if (window2.windowIsOpen() == true){
    princess.update();
    princess.display();
  }
  coffee.display();
  coffee.update();
  window1.update();
  window1.display();
  window2.update();
  window2.display();
  door.update();
  door.display();
  if (dragon.isFire() == true) { //fire balls only get displayed and updated once they are created
      for (fireBall ball : balls) {
        ball.display();
        ball.update();
      }
  }
}
void keyPressed(){
  if (key == ' ' && door.dragonAppear() == true){ //makes the dragon fire
    dragon.fireBurst();
  }
}
void mouseClicked() {
  if (window1.isOver() == true) { //opens the left window
    window1.openWindow();
  }
  if (window2.isOver() == true) { //opens the right window
    window2.openWindow();
  } 
  if (door.isOver() == true) { //opens the door
    door.openDoor();
  }
  if (flag.isOver() == true) { //raises the flag
    flag.raise();
  }
  if (cloud1.isOver()==true && cloud1.isRaining() == false){ //makes the cloud start to rain
    cloud1.startRain();
  }  
}
