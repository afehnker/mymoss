class Shopfront {

  //Global Variables
  PImage brickWall;
  PImage iceCreamCone;
  float lengthUnit;
  color interiorColor = #e1f2f1;
  int bushBalls = 20;
  float[] bushX = new float[bushBalls];
  float[] bushY = new float[bushBalls];
  boolean openingTimes = false;
  float speed;
  float sunscreenY;
  //End Global Variables

  //Declaring Objects
  //End Declaring Objects

  Shopfront(float initLengthUnit) {
    lengthUnit = initLengthUnit * 15;
    brickWall = loadImage("brickwall.jpg");
    iceCreamCone = loadImage("icecreamcone.jpg");
    for (int i=0; i<bushBalls; i++) {
      bushY[i] =  - 1 * random(lengthUnit, 1.5 * lengthUnit);
      bushX[i] = random( - 0.3 * lengthUnit, 0.3 * lengthUnit);
    }
    speed = 0.01 * lengthUnit;
    sunscreenY = -4 * lengthUnit;
  }//End Shopfront constr.

  void update() {
    //Check if open
    if ((sliders.timeSliderXPos >= 37.5 && sliders.timeSliderXPos <= 87.5) && !background.isRainy) {
      openingTimes = true;
    } else {
      openingTimes = false;
    }

    //Check if sunscreen is rolled out while it shouldn't
    if ((!background.isSunny || !openingTimes) && (sunscreenY > -5.5 * lengthUnit)) {
      sunscreenY = sunscreenY - speed;
    }
    
    //Check if sunscreen isn't rolled out when it should be
    if (background.isSunny && openingTimes && (sunscreenY < -4 * lengthUnit)) {
      sunscreenY = sunscreenY + speed;
    }
  }//End of update

  void display_static() {
    pushMatrix();
    translate(width/2, height);
    textureMode(NORMAL);
    textureWrap(REPEAT);

    //Brick Wall Backdrop
    beginShape();
    texture(brickWall);
    vertex( - 6.5 * lengthUnit, 0, 0, 6);
    vertex( - 6.5 * lengthUnit, - 8.5 * lengthUnit, 0, 1.75);
    vertex( - 5 * lengthUnit, - 11.5 * lengthUnit, 0.75, 0.25);
    vertex(5 * lengthUnit, - 11.5 * lengthUnit, 5.75, 0.25);
    vertex(6.5 * lengthUnit, - 8.5 * lengthUnit, 6.5, 1.75);
    vertex(6.5 * lengthUnit, 0, 6.5, 6);
    endShape();

    //Concrete
    fill(135);
    stroke(120);
    strokeWeight(5);
    beginShape();
    vertex( - 6.5 * lengthUnit, 0);
    vertex( - 6.5 * lengthUnit, - lengthUnit);
    vertex(6.5 * lengthUnit, - lengthUnit);
    vertex(6.5 * lengthUnit, 0);
    endShape();

    //Wooden Frames / Roof
    stroke(#bab19b);
    strokeWeight(2);
    beginShape();
    fill(#fff3d6);
    vertex( - 6.5 * lengthUnit, - 8.5 * lengthUnit);
    vertex( - 7 * lengthUnit, - 8.5 * lengthUnit);
    vertex( - 5.25 * lengthUnit, - 12 * lengthUnit);
    vertex(5.25 * lengthUnit, - 12 * lengthUnit);
    vertex(7 * lengthUnit, - 8.5 * lengthUnit);
    vertex(6.5 * lengthUnit, - 8.5 * lengthUnit);
    vertex(5 * lengthUnit, - 11.5 * lengthUnit);
    vertex( - 5 * lengthUnit, - 11.5 * lengthUnit);
    endShape(CLOSE);
    beginShape();
    vertex( - 5 * lengthUnit, - 12 * lengthUnit);
    vertex(0, - 17 * lengthUnit);
    vertex(5 * lengthUnit, - 12 * lengthUnit);
    vertex(4.5 * lengthUnit, - 12 * lengthUnit);
    vertex(0, - 16.5 * lengthUnit);
    vertex( - 4.5 * lengthUnit, - 12 * lengthUnit);
    endShape(CLOSE);
    rectMode(CORNER);
    rect( - 2.85 * lengthUnit, - 11.1 * lengthUnit, 5.7 * lengthUnit, 2.2 * lengthUnit);
    beginShape();
    fill(#8a3d13);
    vertex( - 4.5 * lengthUnit, - 12 * lengthUnit);
    vertex(0, - 16.5 * lengthUnit);
    vertex(4.5 * lengthUnit, - 12 * lengthUnit);
    endShape(CLOSE);
    noStroke();

    //Interior Background
    fill(interiorColor);
    rectMode(CORNER);
    rect( - 5.5 * lengthUnit, - 4.5 * lengthUnit, 10 * lengthUnit, 4.5 * lengthUnit);
    rect( - 2.75 * lengthUnit, - 11 * lengthUnit, ((5.5 - 0.2)/3) * lengthUnit, 2 * lengthUnit);
    rect(( - 2.75+0.1+((5.5 - 0.2)/3)) * lengthUnit, - 11 * lengthUnit, ((5.5 - 0.2)/3) * lengthUnit, 2 * lengthUnit);
    rect(( - 2.75+0.2+2 * ((5.5 - 0.2)/3)) * lengthUnit, - 11 * lengthUnit, ((5.5 - 0.2)/3) * lengthUnit, 2 * lengthUnit);

    //Interior
    stroke(120);
    strokeWeight(1);
    fill(200);
    rect( - 5.5 * lengthUnit, - 2.25 * lengthUnit, 5 * lengthUnit, 0.75 * lengthUnit);
    for (float i =  - 5.4 * lengthUnit; i <  - lengthUnit; i += 0.5 * lengthUnit) {
      fill( - i * 1.2, - i * 0.8, - i * 0.5);
      beginShape();
      vertex(i+0.1 * lengthUnit, - 1.75 * lengthUnit);
      vertex(i+0.55 * lengthUnit, - 1.75 * lengthUnit);
      vertex(i+0.7 * lengthUnit, - 2.2 * lengthUnit);
      vertex(i+0.25 * lengthUnit, - 2.2 * lengthUnit);
      endShape();
    }
    noStroke();

    //Ice Cream Cone
    stroke(220);
    strokeWeight(3);
    fill(255);
    ellipseMode(CENTER);
    ellipse(3 * lengthUnit, - 9.25 * lengthUnit, 0.75 * lengthUnit, 0.75 * lengthUnit);
    ellipse(2.75 * lengthUnit, - 8.75 * lengthUnit, 0.75 * lengthUnit, 0.75 * lengthUnit);
    ellipse(3.25 * lengthUnit, - 8.75 * lengthUnit, 0.75 * lengthUnit, 0.75 * lengthUnit);
    ellipse(3.5 * lengthUnit, - 8.25 * lengthUnit, 0.75 * lengthUnit, 0.75 * lengthUnit);
    ellipse(2.5 * lengthUnit, - 8.25 * lengthUnit, 0.75 * lengthUnit, 0.75 * lengthUnit);
    ellipse(3 * lengthUnit, - 8.25 * lengthUnit, 0.75 * lengthUnit, 0.75 * lengthUnit);
    stroke(189, 138, 0);
    beginShape();
    texture(iceCreamCone);
    vertex(2.25 * lengthUnit, - 7.95 * lengthUnit, 0, 0);
    vertex(3.75 * lengthUnit, - 7.95 * lengthUnit, 0.6, 0);
    vertex(3 * lengthUnit, - 5.75 * lengthUnit, 0.3, 0.45);
    endShape(CLOSE);
    noStroke();
    popMatrix();
  }//End display_static

  void display_shop_overlay() {
    pushMatrix();
    translate(width/2, height);
    textureMode(NORMAL);
    textureWrap(REPEAT);

    //Door
    fill(#fff3d6);
    rect(1.5 * lengthUnit, - 2 * lengthUnit, 0.5 * lengthUnit, 2 * lengthUnit);
    rect(4 * lengthUnit, - 2 * lengthUnit, 0.5 * lengthUnit, 2 * lengthUnit);
    stroke(#bab19b);
    strokeWeight(2);
    fill(#fff3d6);
    beginShape();
    vertex(2 * lengthUnit, - 2 * lengthUnit);
    vertex(1.5 * lengthUnit, - 2 * lengthUnit);
    vertex(1.5 * lengthUnit, - 1.9 * lengthUnit);
    vertex(2 * lengthUnit, - 1.9 * lengthUnit);
    endShape(CLOSE);
    beginShape();
    vertex(4 * lengthUnit, - 2 * lengthUnit);
    vertex(4.5 * lengthUnit, - 2 * lengthUnit);
    vertex(4.5 * lengthUnit, - 1.9 * lengthUnit);
    vertex(4 * lengthUnit, - 1.9 * lengthUnit);
    endShape(CLOSE);
    beginShape();
    vertex(2 * lengthUnit, - 3.5 * lengthUnit);
    vertex(2 * lengthUnit, - 4.5 * lengthUnit);
    vertex(1.9 * lengthUnit, - 4.5 * lengthUnit);
    vertex(1.9 * lengthUnit, - 3.5 * lengthUnit);
    endShape(CLOSE);
    beginShape();
    vertex(4 * lengthUnit, - 3.5 * lengthUnit);
    vertex(4 * lengthUnit, - 4.5 * lengthUnit);
    vertex(4.1 * lengthUnit, - 4.5 * lengthUnit);
    vertex(4.1 * lengthUnit, - 3.5 * lengthUnit);
    endShape(CLOSE);
    beginShape();
    vertex(2 * lengthUnit, 0);
    vertex(1.9 * lengthUnit, 0);
    vertex(1.9 * lengthUnit, - 3.6 * lengthUnit);
    vertex(4.1 * lengthUnit, - 3.6 * lengthUnit);
    vertex(4.1 * lengthUnit, 0);
    vertex(4 * lengthUnit, 0);
    vertex(4 * lengthUnit, - 3.5 * lengthUnit);
    vertex(2 * lengthUnit, - 3.5 * lengthUnit);
    endShape(CLOSE);
    stroke(105, 0, 0);
    strokeWeight(1);
    fill(200, 0, 0);
    ellipseMode(CENTER);
    ellipse(3 * lengthUnit, - 4.35 * lengthUnit, 0.1 * lengthUnit, 0.1 * lengthUnit);
    line(2.5 * lengthUnit, - 4 * lengthUnit, 3 * lengthUnit, - 4.35 * lengthUnit);
    line(3.5 * lengthUnit, - 4 * lengthUnit, 3 * lengthUnit, - 4.35 * lengthUnit);
    fill(255);
    stroke(180);
    rect(2.5 * lengthUnit, - 4 * lengthUnit, lengthUnit, 0.35 * lengthUnit);
    fill(0);
    textSize(20);
    if (openingTimes) {
      text("Open", 2.73 * lengthUnit, - 3.75 * lengthUnit);
      fill(#4f3418);
      strokeWeight(0);
      beginShape();
      vertex(4 * lengthUnit, - 3.5 * lengthUnit);
      vertex(3.75 * lengthUnit, - 3.3 * lengthUnit);
      vertex(3.75 * lengthUnit, 0);
      vertex(4 * lengthUnit, 0);
      endShape();
    } else {
      text("Closed", 2.65 * lengthUnit, - 3.75 * lengthUnit);
      fill(#4f3418);
      strokeWeight(0);
      rect(2 * lengthUnit, - 3.5 * lengthUnit, 2 * lengthUnit, 3.5 * lengthUnit);
      stroke(150);
      strokeWeight(1);
      fill(120);
      rect(2.25 * lengthUnit, - 1.6 * lengthUnit, 0.1 * lengthUnit, 0.3 * lengthUnit);
      rect(2.3 * lengthUnit, - 1.5 * lengthUnit, 0.25 * lengthUnit, 0.05 * lengthUnit);
      fill(interiorColor);
      rect(2.375 * lengthUnit, - 3.125 * lengthUnit, 1.25 * lengthUnit, 1.25 * lengthUnit);
      fill(120);
      rect(2.975 * lengthUnit, - 3.125 * lengthUnit, 0.05 * lengthUnit, 1.25 * lengthUnit);
      rect(2.375 * lengthUnit, - 2.5 * lengthUnit, 1.25 * lengthUnit, 0.05 * lengthUnit);
    }
    noStroke();

    //Brick wall
    beginShape();
    texture(brickWall);
    vertex( - 5.5 * lengthUnit, 0, 0.5, 3);
    vertex( - 5.5 * lengthUnit, - 1.5 * lengthUnit, 0.5, 2.25);
    vertex( - 0.5 * lengthUnit, - 1.5 * lengthUnit, 3, 2.25);
    vertex( - 0.5 * lengthUnit, - 5 * lengthUnit, 3, 0.5);
    vertex(1.5 * lengthUnit, - 5 * lengthUnit, 4, 0.5);
    vertex(1.5 * lengthUnit, 0, 4, 3);
    endShape(CLOSE);

    //Wooden Frames
    stroke(#bab19b);
    strokeWeight(2);
    //rect( - 5.6 * lengthUnit,  - 5.1 * lengthUnit, 5.2 * lengthUnit, 3.7 * lengthUnit);
    noStroke();

    //Concrete
    fill(135); 
    stroke(120); 
    strokeWeight(5); 
    beginShape(); 
    vertex( - 6.5 * lengthUnit, 0); 
    vertex( - 6.5 * lengthUnit, - lengthUnit); 
    vertex(1.5 * lengthUnit, - lengthUnit); 
    vertex(1.5 * lengthUnit, 0); 
    endShape(CLOSE); 
    beginShape(); 
    vertex(4.5 * lengthUnit, 0); 
    vertex(4.5 * lengthUnit, - lengthUnit); 
    vertex(6.5 * lengthUnit, - lengthUnit); 
    vertex(6.5 * lengthUnit, 0); 
    endShape(CLOSE); 
    beginShape(); 
    vertex(1.5 * lengthUnit, - 3.25 * lengthUnit); 
    vertex(0.75 * lengthUnit, - 3.25 * lengthUnit); 
    vertex(0.75 * lengthUnit, - 4 * lengthUnit); 
    vertex(1.5 * lengthUnit, - 3.75 * lengthUnit); 
    endShape(CLOSE); 
    beginShape(); 
    vertex(4.5 * lengthUnit, - 3.25 * lengthUnit); 
    vertex(5.25 * lengthUnit, - 3.25 * lengthUnit); 
    vertex(5.25 * lengthUnit, - 4 * lengthUnit); 
    vertex(4.5 * lengthUnit, - 3.75 * lengthUnit); 
    endShape(CLOSE); 
    beginShape(); 
    vertex(2.75 * lengthUnit, - 4.5 * lengthUnit); 
    vertex(2.5 * lengthUnit, - 5.25 * lengthUnit); 
    vertex(3.5 * lengthUnit, - 5.25 * lengthUnit); 
    vertex(3.25 * lengthUnit, - 4.5 * lengthUnit); 
    endShape(CLOSE); 
    noStroke(); 

    //Sunscreen
    fill(255);
    stroke(180);
    strokeWeight(2);
    beginShape();
    vertex( - 5.9 * lengthUnit, - 5 * lengthUnit);
    vertex( - 6 * lengthUnit, - 5.1 * lengthUnit);
    vertex( - 6 * lengthUnit, - 5.4 * lengthUnit);
    vertex( - 5.9 * lengthUnit, - 5.5 * lengthUnit);
    vertex( - 0.1 * lengthUnit, - 5.5 * lengthUnit);
    vertex(0, - 5.4 * lengthUnit);
    vertex(0, - 5.1 * lengthUnit);
    vertex( - 0.1 * lengthUnit, - 5 * lengthUnit);
    endShape(CLOSE);

    //Moving Part Sunscreen
    fill(255, 100, 100);
    stroke(255, 0, 0);
    beginShape();
    vertex( - 5.75 * lengthUnit, - 5.25 * lengthUnit);
    vertex( - 6 * lengthUnit, sunscreenY+0.25 * lengthUnit);
    vertex(0, sunscreenY+0.25 * lengthUnit);
    vertex( - 0.25 * lengthUnit, - 5.25 * lengthUnit);
    endShape();
    fill(255);
    stroke(180);
    strokeWeight(2);
    beginShape();
    vertex( - 5.9 * lengthUnit, sunscreenY+0.5 * lengthUnit);
    vertex( - 6 * lengthUnit, sunscreenY+0.4 * lengthUnit);
    vertex( - 6 * lengthUnit, sunscreenY+0.1 * lengthUnit);
    vertex( - 5.9 * lengthUnit, sunscreenY);
    vertex( - 0.1 * lengthUnit, sunscreenY);
    vertex(0, sunscreenY+0.1 * lengthUnit);
    vertex(0, sunscreenY+0.4 * lengthUnit);
    vertex( - 0.1 * lengthUnit, sunscreenY+0.5 * lengthUnit);
    endShape(CLOSE);
    noStroke();

    //Window Logo
    fill(255, 0, 0); 
    rect( - 2.2 * lengthUnit, - 3.3 * lengthUnit, 0.5 * lengthUnit, 0.5 * lengthUnit); 
    rect( - 4.3 * lengthUnit, - 3.3 * lengthUnit, 0.5 * lengthUnit, 0.5 * lengthUnit); 
    fill (255); 
    rect( - 2.9 * lengthUnit, - 3.3 * lengthUnit, 0.5 * lengthUnit, 0.5 * lengthUnit); 
    rect( - 3.6 * lengthUnit, - 3.3 * lengthUnit, 0.5 * lengthUnit, 0.5 * lengthUnit); 
    fill(255, 0, 0); 
    textSize(0.4 * lengthUnit); 
    text("N", - 2.8 * lengthUnit, - 2.9 * lengthUnit); 
    text("N", - 3.5 * lengthUnit, - 2.9 * lengthUnit); 
    fill(255); 
    text("A", - 4.2 * lengthUnit, - 2.9 * lengthUnit); 
    text("E", - 2.1 * lengthUnit, - 2.9 * lengthUnit); 
    fill(0); 
    textSize(0.15 * lengthUnit); 
    text("Schep -  en Softijs", - 3.65 * lengthUnit, - 2.65 * lengthUnit); 

    //Terrace
    //Bush 1
    pushMatrix(); 
    translate( - 6 * lengthUnit, 0); 
    fill(#2d5e27); 
    stroke(#1c3d18); 
    strokeWeight(2); 
    ellipseMode(CENTER); 
    for (int i=0; i<bushBalls; i++) {
      ellipse(bushX[i], bushY[i], 0.4 * lengthUnit, 0.4 * lengthUnit);
    }
    fill(255); 
    stroke(200); 
    strokeWeight(2); 
    beginShape(); 
    vertex( - 0.4 * lengthUnit, - lengthUnit); 
    vertex(0.4 * lengthUnit, - lengthUnit); 
    vertex(0.4 * lengthUnit, - 0.25 * lengthUnit); 
    vertex(0.25 * lengthUnit, 0); 
    vertex( - 0.25 * lengthUnit, 0); 
    vertex( - 0.4 * lengthUnit, - 0.25 * lengthUnit); 
    endShape(CLOSE); 
    popMatrix(); 
    //Bush 2
    pushMatrix(); 
    translate(0, 0); 
    fill(#2d5e27); 
    stroke(#1c3d18); 
    strokeWeight(2); 
    ellipseMode(CENTER); 
    for (int i=0; i<bushBalls; i++) {
      ellipse(bushX[i], bushY[i], 0.4 * lengthUnit, 0.4 * lengthUnit);
    }
    fill(255); 
    stroke(200); 
    strokeWeight(2); 
    beginShape(); 
    vertex( - 0.4 * lengthUnit, - lengthUnit); 
    vertex(0.4 * lengthUnit, - lengthUnit); 
    vertex(0.4 * lengthUnit, - 0.25 * lengthUnit); 
    vertex(0.25 * lengthUnit, 0); 
    vertex( - 0.25 * lengthUnit, 0); 
    vertex( - 0.4 * lengthUnit, - 0.25 * lengthUnit); 
    endShape(CLOSE); 
    popMatrix(); 
    //Bush 3
    pushMatrix(); 
    translate(6.5 * lengthUnit, 0); 
    fill(#2d5e27); 
    stroke(#1c3d18); 
    strokeWeight(2); 
    ellipseMode(CENTER); 
    for (int i=0; i<bushBalls; i++) {
      ellipse(bushX[i], bushY[i], 0.4 * lengthUnit, 0.4 * lengthUnit);
    }
    fill(255); 
    stroke(200); 
    strokeWeight(2); 
    beginShape(); 
    vertex( - 0.4 * lengthUnit, - lengthUnit); 
    vertex(0.4 * lengthUnit, - lengthUnit); 
    vertex(0.4 * lengthUnit, - 0.25 * lengthUnit); 
    vertex(0.25 * lengthUnit, 0); 
    vertex( - 0.25 * lengthUnit, 0); 
    vertex( - 0.4 * lengthUnit, - 0.25 * lengthUnit); 
    endShape(CLOSE); 
    popMatrix(); 
    //Bush 4
    pushMatrix(); 
    translate(9 * lengthUnit, 0); 
    fill(#2d5e27); 
    stroke(#1c3d18); 
    strokeWeight(2); 
    ellipseMode(CENTER); 
    for (int i=0; i<bushBalls; i++) {
      ellipse(bushX[i], bushY[i], 0.4 * lengthUnit, 0.4 * lengthUnit);
    }
    fill(255); 
    stroke(200); 
    strokeWeight(2); 
    beginShape(); 
    vertex( - 0.4 * lengthUnit, - lengthUnit); 
    vertex(0.4 * lengthUnit, - lengthUnit); 
    vertex(0.4 * lengthUnit, - 0.25 * lengthUnit); 
    vertex(0.25 * lengthUnit, 0); 
    vertex( - 0.25 * lengthUnit, 0); 
    vertex( - 0.4 * lengthUnit, - 0.25 * lengthUnit); 
    endShape(CLOSE); 
    popMatrix(); 
    //Lantern
    pushMatrix(); 
    translate(7.75 * lengthUnit, 0); 
    fill(#062e10); 
    stroke(#041f0b); 
    strokeWeight(2); 
    rectMode(CENTER); 
    rect(0, - 4.75 * lengthUnit, 0.75 * lengthUnit, 0.05 * lengthUnit); 
    rect(0, - 2.5 * lengthUnit, 0.15 * lengthUnit, 5 * lengthUnit); 
    rect(0, - 0.375 * lengthUnit, 0.5 * lengthUnit, 0.75 * lengthUnit); 
    arc(0, - 0.74 * lengthUnit, 0.5 * lengthUnit, 0.5 * lengthUnit, PI, TWO_PI, OPEN); 
    if ((sliders.timeSliderXPos <= 25 || sliders.timeSliderXPos >= 87.5) || (sliders.timeSliderXPos > 25 && sliders.timeSliderXPos <= 37.5 || sliders.timeSliderXPos < 87.5 && sliders.timeSliderXPos >= 75) || background.isRainy) {
      fill(#fdff91);
    } else {
      fill(background.skyColor);
    }
    beginShape(); 
    vertex( - 0.35 * lengthUnit, - 5 * lengthUnit); 
    vertex( - 0.5 * lengthUnit, - 6 * lengthUnit); 
    vertex(0.5 * lengthUnit, - 6 * lengthUnit); 
    vertex(0.35 * lengthUnit, - 5 * lengthUnit); 
    endShape(CLOSE); 
    fill(#062e10); 
    stroke(#041f0b); 
    strokeWeight(2); 
    beginShape(); 
    vertex( - 0.35 * lengthUnit, - 6 * lengthUnit); 
    vertex(0.35 * lengthUnit, - 6 * lengthUnit); 
    vertex(0, - 6.35 * lengthUnit); 
    endShape(CLOSE); 
    ellipse(0, - 6.35 * lengthUnit, 0.1 * lengthUnit, 0.1 * lengthUnit); 
    ellipse(0, - 6 * lengthUnit, lengthUnit, 0.25 * lengthUnit); 
    rect(0, - 5.15 * lengthUnit, 0.1 * lengthUnit, 0.2 * lengthUnit); 
    noFill(); 
    stroke(100); 
    ellipse(0, - 5.35 * lengthUnit, 0.2 * lengthUnit, 0.2 * lengthUnit); 
    fill(#062e10); 
    stroke(#041f0b); 
    ellipse(0, - 5 * lengthUnit, 0.7 * lengthUnit, 0.15 * lengthUnit); 
    rectMode(CORNER); 
    popMatrix(); 
    noStroke(); 
    popMatrix();
  }//End of display_dynamic
}//End of shopfront class
