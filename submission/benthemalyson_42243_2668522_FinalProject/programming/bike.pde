class Bike {

  //making relative position for the bike and declaring all variables
  float bikeX = 170;
  float bikeY = 919;
  float randomSpeed = 10;
  float r = 100;
  float g = 100;
  float b = 100;
  float dimension = 10;

  void display() {

    //drawing the wheels
    noFill();
    stroke(0);
    strokeWeight(10);
    ellipse(bikeX+140, bikeY+35, 140, 140);
    ellipse(bikeX-90, bikeY+35, 140, 140);

    //drawing the bike body
    stroke(r, g, b);
    line(bikeX-40, bikeY-55, bikeX+110, bikeY-75);
    line(bikeX-40, bikeY-55, bikeX, bikeY+35);
    line(bikeX, bikeY+35, bikeX+110, bikeY-75);
    line(bikeX-40, bikeY-55, bikeX-100, bikeY+35);
    line(bikeX-100, bikeY+35, bikeX, bikeY+35);
    line(bikeX+110, bikeY-105, bikeX+140, bikeY+35);
    line(bikeX+110, bikeY-105, bikeX+70, bikeY-105);
    //changing the stroke back to normal because it messed with the minigame
    strokeWeight(1);
    noStroke();
  }

  void update() {
    //makes the bike loop
    if (bikeX<width+200) {
      //moves the bike at varying speeds
      bikeX = bikeX+randomSpeed;
    } else {
      //re-randoms all the variables to make each bike unique
      bikeX = -200;
      randomSpeed = random(10, 50);
      dimension = random(5, 25)*random(-1, 1);
      bikeY = 919+dimension;
      r = random(100, 255);
      g = random(100, 255);
      b = random(100, 255);
    }
  }
}
