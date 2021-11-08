class People {

  float x, y, xSpeed, ySpeed;
  color baseColor;
  boolean isCharged, clicked = false;
  int xPos, yPos, len, wid ;
  float xdirection = -0.001;
  color shirtColor, hairColor, trouserColor, hatColor;
  int changeDirectionTimer;
  boolean differentTimeToChangeDirection ;
  int randomTime;

  People(float initX, float initY) {
    x = initX;
    y = initY;
    xSpeed = 0;
    ySpeed = 0;
    baseColor=color(148, 96, 55);
    shirtColor= color(random(00, 255), random(0, 255), random(0, 250));
    hatColor= color(random(00, 255), random(0, 255), random(0, 250));
    trouserColor= color(random(00, 10), random(0, 20), random(60, 150));
    hairColor= color(random(52, 180), random(28, 162), random(2, 130));
    changeDirectionTimer=120;
    differentTimeToChangeDirection=false;
  }


  void display() {
    pushStyle();
    rectMode(CENTER);
    ellipseMode(CENTER);
    pushMatrix();

    fill(232, 190, 172);//skin color
    ellipse(x-10, y+60, 15, 50);//left leg
    ellipse(x+10, y+60, 15, 50);//right leg


    ellipse(x+20, y-6, 15, 60);//arm left
    ellipse(x-20, y-6, 15, 60);//arm right


    fill( shirtColor);
    rect(x, y-10, +40, +59);//body


    fill(trouserColor);
    rect(x-10, y+34, 19.5, 30);//trouser left
    rect(x+10, y+34, 19.5, 30);//trouser right


    fill(232, 190, 172);//skin color
    circle(x, y-50, 47);//head

    line(x-9, y-42, x+9, y-42);//mouth

    fill(255, 255, 255);
    circle(x-11, y-49, 10);//eye left
    circle(x+11, y-49, 10);//eye right


    fill(30, 30, 30);
    circle(x-10, y-49, 3);//eye left
    circle(x+10, y-49, 3);//eye right


    fill(hairColor);
    triangle(x-24, y-59, x-22, y-40, x-10, y-62)  ;//hair left

    triangle(x+10, y-62, x+23, y-40, x+24, y-59)  ;//hair right

    triangle(x-7, y-62, x, y-52, x+2, y-62)  ;//hair center


    fill(hatColor);
    ellipse(x, y-69, 45, 20);//hat top
    rect(x, y-64, 49, 10);//hat bottom
    popMatrix();
    popStyle();
  }

  void update() {


    x= x+xdirection;

    //Check the boundaries
    if (x<-50) {//reset people to the right border
      x=width+100;
      //xdirection = x;
    }


    xdirection = constrain(xdirection+random(-0.4, 0.4), -3, -1);



    if (clicked==true) {//check if clicked to stop person
      xdirection=0;//stationary

      changeDirectionTimer --;//countdown

      if (changeDirectionTimer<0) {//when time stationary ends
        clicked=false;//resets condition
        changeDirectionTimer = 600 ;//timer reset
        differentTimeToChangeDirection=true;
        xdirection = constrain(xdirection+random(-0.4, 0.4), -3, -1);   // speed after it was stationary
      }
    }
  }


  void PeoplePressed() {

    //because of scale 1.6 from before
    if ((mouseX >=(x-30)*1.6 && mouseX<=(x+30)*1.6)&&(mouseY >(365))) {
      clicked=true;
    }
  }
}
