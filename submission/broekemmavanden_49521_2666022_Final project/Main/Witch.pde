import processing.sound.*;

class Witch {
  float xPos;
  float yPos;
  color bodyColor;
  float dx;
  float xSpeed;
  float armX;
  float armY;

  SoundFile sound;

  Pan pan;

  Witch() {
    xPos = width/2+200;
    yPos = height/2+30;
    armX = xPos;
    armY = yPos;
    rectMode(CENTER);
    ellipseMode(CENTER);
    bodyColor = color(58, 181, 76);
    sound = new SoundFile(Main.this, "cackle3.mp3");
    pan = new Pan();
    dx = 1;
    xSpeed = 1;
  }

  void display() {

    pan.display();

    //back hair
    fill(color(181, 115, 0));
    ellipse(xPos-65, yPos+10, 11, 100);
    ellipse(xPos+65, yPos+10, 11, 100);

    //head
    noStroke();
    fill(bodyColor);
    ellipse(xPos, yPos, 150, 120);

    //front hair
    fill(color(219, 139, 0));
    ellipse(xPos-75, yPos+10, 11, 100);
    ellipse(xPos+75, yPos+10, 11, 100);

    //hat
    fill(0);
    ellipse(xPos, yPos-50, 200, 75);
    triangle(xPos-70, yPos-30, xPos+70, yPos-30, xPos, yPos-200);

    //eyes
    fill(255);
    ellipse(xPos-30, yPos+5, 30, 30);//left eye white
    ellipse(xPos+30, yPos+5, 30, 30); //right eye white
    fill(0);
    ellipse(xPos-30, yPos+5, 10, 10); //left pupil
    ellipse(xPos+30, yPos+5, 10, 10); //right pupil

    //nose
    fill(color(45, 145, 60));
    ellipse(xPos, yPos+20, 10, 20);
    fill(color(31, 105, 42));
    ellipse(xPos+4, yPos+20, 5, 5);

    //legs
    fill(bodyColor);
    rect(xPos-35, yPos+320, 40, 80); //left leg
    rect(xPos+35, yPos+320, 40, 80); //right leg

    //arms
    strokeWeight(20);
    stroke(bodyColor);
    line(armX-240, armY+100, xPos-125, yPos+100); //left arm
    line(armX+240, armY+100, xPos+125, yPos+100); //right arm

    //dress
    noStroke();
    fill(color(114, 29, 145));
    rect(xPos, yPos+175, 150, 200);
    ellipse(xPos, yPos+275, 150, 50);
    rect(xPos+100, yPos+100, 75, 50, 10);
    rect(xPos-100, yPos+100, 75, 50, 10);

    //neck
    fill(bodyColor);
    rect(xPos, yPos+60, 30, 50);  
    ellipse(xPos, yPos+85, 30, 10);

    //feet
    fill(0);
    ellipse(xPos-46, yPos+350, 70, 40); //left feet
    ellipse(xPos+46, yPos+350, 70, 40); //right feet

    //broom
    fill(color(99, 49, 5));
    pushMatrix();
    translate(xPos, yPos);
    rotate(0.2);
    rect(-200, +150, 10, 300);
    fill(color(161, 116, 77));
    ellipse(-200, +325, 60, 80);
    popMatrix();


    //hands
    fill(bodyColor);
    ellipse(armX-240, armY+100, 30, 30); //left hand
    ellipse(armX+240, armY+100, 30, 30); //right hand
  }

  void mouseOver(float initX, float initY) {
    //loops a sound if mouse is over the witch
    if (initX > xPos-75 && initX < xPos+75 && initY > yPos -12.5 && initY < yPos+300) {
    } else {
      sound.loop();
    }
  }

  void move() {
    armY = armY + dx;
    armX = armX - dx/6;

    //makes arms go up and down
    if (armY >= 500) {
      dx = dx * -1;
    } else if (armY < 400) {
      dx = dx * -1;
    }
  }
}
