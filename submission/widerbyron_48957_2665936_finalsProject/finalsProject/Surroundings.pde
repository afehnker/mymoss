/*
 Surroundings Class.
 Draws the surroundings, sky, street, and has a displayed time. The day can be changed when the update function is called.
 Author: Byron and Door
 */

class Surroundings {

  float xSurroundings;
  float ySurroundings;

  float skyR = 105; //R value for sky color
  float skyG = 156; //G value for sky color
  float skyB = 245; //B value for sky color

  float starA = 0; //value for alpha of the stars
  
   float moonPos=-120;//value for moving the moon up

  float[] starPosX = new float[20];//for random position of stars
  float[] starPosY = new float[20];//for random position of stars

 

  //float cloudX=320;//value for moving the clouds right left
  // float cloudY=-300;//value for moving the clouds up down
  float[] cloudX = new float[8];//for random position for the clouds
  float[] cloudY = new float[8];//for random position for the clouds
  float cloudC = 255; //cloud color

  int clockHour;
  int clockSecond;




  Surroundings(float xPos, float yPos) {

    xSurroundings = xPos;
    ySurroundings = yPos;

    for (int i=0; i < starPosX.length; i++) {         
      starPosX[i] =random(-500, 500); //Giving the stars all a random X outside the draw so it only happens once
    }
    for (int i=0; i < starPosY.length; i++) {         
      starPosY[i] =random(-400, -250); // same but for Y
    }

    for (int i=0; i < cloudX.length; i++) {         
      cloudX[i] =random(-600, 600); //Giving the clouds all a random X outside the draw so it only happens once
    }
    for (int i=0; i < cloudY.length; i++) {         
      cloudY[i] =random(-450, -250); // same but for Y
    }

    clockHour = 17;
    clockSecond = 20;
  }


  void display() {
    pushMatrix();
    translate(xSurroundings, ySurroundings);
    noStroke();
    fill(skyR, skyG, skyB);
    rect(-width/2-30, -height/2-30, width+60, 200);//sky

    for (int i=0; i < starPosX.length; i++) {   
      fill(255, 255, 255, starA-30);
      circle(starPosX[i], starPosY[i], 5);//small stars
    }

    for (int i=0; i < starPosX.length; i++) {   
      fill(255, 255, 255, starA);
      circle(starPosX[i], starPosY[i], 10);//big stars
    }

    fill(255);
    arc(450, moonPos, 50, 50, PI+QUARTER_PI, 3*PI-QUARTER_PI);//White part of the moon
    fill(skyR, skyG, skyB);
    ellipse(443, moonPos, 35, 47);//Sky part to give the moon a crescent

    for (int i=0; i < cloudX.length; i++) {  
      fill(cloudC); //clouds
      circle(cloudX[i], cloudY[i], 50);//right dot
      circle(cloudX[i]+30, cloudY[i], 50);//middle dot
      circle(cloudX[i]+60, cloudY[i], 50);//left dot
      cloudX[i]+=0.5;//moving the clouds
      if (cloudX[i]>650) {//cloud is at the end
        cloudX[i]=-700;//starting at the beginning again
        cloudY[i]=random(-400, -250);//other hight
      }
    }



    noStroke();
    fill(#E0D4C4);
    rect(-width/2-30, height/2-200, width+60, 300);//street
    for (int i =0; i<12; i++) {
      strokeWeight(2);
      stroke(#776E5F);
      line(500-i*100, 300, (500-i*100)+20, 400);//Lines on the street
    }

    textSize(20);
    fill(255);

    if (clockSecond < 10) {
      text(clockHour + ":" + "0" + clockSecond, -width/2+25, -height/2+125);
    } else {
      text(clockHour + ":" + clockSecond, -width/2+25, -height/2+125);
    }

    popMatrix();
  }

  int update() {

    //sets rgb values to 16,2,45 by decreasing them by 0.5 every time the class is called, turning night to day.
    //moves the 

    println("is changing");
    if (skyR > 16) {
      skyR-=0.5;
    }

    if (skyG > 2) {
      skyG-=0.5;
    } 

    if (skyB > 45) {
      skyB-=0.5;
    }
    if (starA<255) {
      starA+=0.5;
    }
    if (cloudC>100) {
      cloudC-=1;
    }

    if (skyR == 16 && skyG == 2 && skyB == 45) {
      return -1;
    } else {
      clockSecond+=1;
      if(clockSecond == 60){
        clockHour++;
        clockSecond = 0;
      }
      moonPos = moonPos - 0.5;
      return 1;
    }
  }

  void resetDay() {

    //sets rgb values back to day

    skyR = 105; 
    skyG = 156; 
    skyB = 245;
    starA = 0;
    cloudC=255;
    moonPos = -120;
    clockHour = 17;
    clockSecond = 20;
  }
}
