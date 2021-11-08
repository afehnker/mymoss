/*
  StarClass
  Draws the star, size can be changed. This class gets called by the Symbol classes in order to create the montblanc symbol.
  Author: Byron
*/

class Star {

  float starX;
  float starY;
  float size;
  float angle;
  
  color fillC;

  Star (float xPos, float yPos, float starSize, color fillColor, float rotationAngle) {

    starX = xPos;
    starY = yPos;
    size = starSize;
    fillC = fillColor;
    angle = rotationAngle;
  }

  void display() {

    strokeWeight(5);
    noFill();

    pushMatrix();

    translate(starX, starY);

    rotate(radians(angle));

    scale(size);
    stroke(fillC+fillC);
    fill(fillC);


    //draws curves at the position of the starpoints, the gaps get automatically filled by the the shape.
    curveTightness(-0.3);
    beginShape();
    curveVertex(-25, -50); 
    curveVertex(-12.5, -75);
    curveVertex(12.5, -75);
    curveVertex(25, -50); 


    curveVertex(52.5, -50);
    curveVertex(67.5, -25);
    curveVertex(55, 0);

    curveVertex(67.5, 25);
    curveVertex(52.5, 50);
    curveVertex(25, 50);

    curveVertex(12.5, 75);
    curveVertex(-12.5, 75);
    curveVertex(-25, 50);

    curveVertex(-52.5, 50);
    curveVertex(-67.5, 25);
    curveVertex(-55, 0);

    curveVertex(-67.5, -25);
    curveVertex(-52.5, -50);
    curveVertex(-25, -50);
    curveVertex(-12.5, -75);
    curveVertex(12.5, -75);

    endShape();




    popMatrix();
  }
  

  
}
