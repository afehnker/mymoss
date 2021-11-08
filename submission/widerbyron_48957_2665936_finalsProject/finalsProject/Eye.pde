/*
 Eye class.
 Important Functions: display(), blink()
 Important Variables: eyeX, eyeY, sizeX, angle
 Author: Byron
 */


class Eye {

  int eyeX;
  int eyeY;

  int sizeX;

  float angle;


  Eye(int xPos, int yPos, int eyeSize, float rotation) {
    eyeX = xPos;
    eyeY = yPos;
    sizeX = eyeSize;
    angle = rotation;
  }

  //draws the eye two custom shapes, to get the typical eye shape, instead of using an ellipse. in the middle is a pupil.
  void display() {

    //eyes
    noStroke();
    fill(#000000);

    
    pushMatrix();
    //I rotate before the translation, in order to be able to rotate the eye around the center of the circle-body of the angel.
    rotate(angle);
    translate(eyeX, eyeY);

    //bottom half
    beginShape();
    curveVertex(-sizeX, 0);
    curveVertex(-sizeX, 0);

    curveVertex(0, -sizeX/2);

    curveVertex(sizeX, 0);
    curveVertex(sizeX, 0);

    endShape();

    //top half
    beginShape();
    curveVertex(-sizeX, 0);
    curveVertex(-sizeX, 0);

    curveVertex(0, sizeX/2);

    curveVertex(sizeX, 0);
    curveVertex(sizeX, 0);

    endShape();


    fill(#ffd6fe);
    ellipse(0, 0, (int)sizeX-sizeX/4, (int)sizeX-sizeX/4);

    popMatrix();
  }

  //draws the eye two custom shapes, to get the typical eye shape, instead of using an ellipse. in the middle is a line to represent a closed eye-lid, in order to let the eye blink.
  void blink() {


    //eyes
    noStroke();
    fill(#000000);

    pushMatrix();
    rotate(angle);
    translate(eyeX, eyeY);


    //bottom half
    beginShape();
    curveVertex(-sizeX, 0);
    curveVertex(-sizeX, 0);

    curveVertex(0, -sizeX/2);

    curveVertex(sizeX, 0);
    curveVertex(sizeX, 0);

    endShape();

    //top half
    beginShape();
    curveVertex(-sizeX, 0);
    curveVertex(-sizeX, 0);

    curveVertex(0, sizeX/2);

    curveVertex(sizeX, 0);
    curveVertex(sizeX, 0);

    endShape();

    //closed eye lid
    strokeWeight(2);
    stroke(#ffd6fe);
    line(-sizeX+2, 0, sizeX-2, 0);

    popMatrix();
  }
}
