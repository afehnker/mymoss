/*
 Wing class.
 Important Functions: display()
 Important Variables: wingX, wingY, angle, side
 Author: Byron
 */

class Wing {

  int wingX;
  int wingY;

  float angle;
  
  int side; //1 for right side, -1 for left side

  Wing(int xPos, int yPos, float rotation, int leftOrRight) {
    wingX = xPos;
    wingY = yPos;
    side = leftOrRight; 
    angle = rotation;
  }

  //draws the wing pointing towards the right
  //the wing consists of 3 custom shapes that are layered atop eachother
  void display() {

    noStroke();
    strokeWeight(2);

    pushMatrix();
    
    translate(wingX, wingY);
    rotate(angle*side);

    
        
    //lower layer
    fill(#c2c2c2);
    beginShape();
    curveVertex(-5*side, 0);
    curveVertex(-5*side, 0);
    curveVertex(60*side, 5);

    curveVertex(120*side, -50);
    curveVertex(120*side, -50);

    endShape();
    
    //mid layer
    fill(#e6e6e6);
    beginShape();
    curveVertex(-5*side, 0);
    curveVertex(-5*side, 0);
    curveVertex(70*side, -5);

    curveVertex(120*side, -50);
    curveVertex(120*side, -50);

    endShape();
    
    //upper layer
    fill(#ffffff);
    beginShape();
    curveVertex(-5*side, 0);
    curveVertex(-5*side, 0);
    curveVertex(80*side, -20);

    curveVertex(120*side, -50);

    curveVertex(80*side, -60);

    curveVertex(-5*side, 0);
    curveVertex(-5*side, 0);

    endShape();




    popMatrix();
  }
}
