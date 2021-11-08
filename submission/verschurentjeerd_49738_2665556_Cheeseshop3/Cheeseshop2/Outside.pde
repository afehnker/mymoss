//Oh look at all that nice stuff standing outside. These are displayed in this class

class Outside {
  float yKart;
  float xKart;
  float kartThickness;
  float kartHeight;
  float cheeseHeight;
  float xSign;
  float ySign;

  Outside() {
    xKart = 6*width/7;
    yKart = height-height/10;
    kartThickness = width/4;
    kartHeight = kartThickness/2; 
    cheeseHeight = kartHeight/5;
    xSign = 150;
    ySign = 700;
  }


//We have a kart on the left outside. 
  void kartDisplay() {
    fill(#BC9059);
    rect(xKart, 0.94*yKart, 0.9*kartThickness, kartThickness/17);
    rect(xKart - kartHeight + kartThickness/20, yKart - 0.9*kartHeight/2, kartThickness/13, kartHeight);
    rect(xKart + kartHeight - kartThickness/20, yKart - 0.9*kartHeight/2, kartThickness/13, kartHeight);
    rect(xKart, yKart - kartHeight, kartThickness, kartThickness/13);

    fill(#FFE940);
    rect(xKart + kartHeight/2, yKart-kartHeight - kartHeight/13 - cheeseHeight/2, cheeseHeight*4, cheeseHeight, cheeseHeight);
    rect(xKart + kartHeight/2, yKart-kartHeight - kartHeight/13 - 3*cheeseHeight/2, cheeseHeight*4, cheeseHeight, cheeseHeight);
    rect(xKart + kartHeight/2, yKart-kartHeight - kartHeight/13 - 5*cheeseHeight/2, cheeseHeight*4, cheeseHeight, cheeseHeight);
    rect(xKart + kartHeight/2, yKart-kartHeight - kartHeight/13 - 7*cheeseHeight/2, cheeseHeight*4, cheeseHeight, cheeseHeight);
  }

//There is also a sign on the right.
  void signDisplay() {
    fill(0);
    rect(xSign, ySign, kartHeight, kartHeight);
    fill(#BC9059);
    rect(xSign - kartHeight/2, ySign + kartHeight*0.2, kartHeight/13, kartHeight + kartHeight*0.4);
    rect(xSign + kartHeight/2, ySign + kartHeight*0.2, kartHeight/13, kartHeight + kartHeight*0.4);
    rect(xSign, ySign - kartHeight/2, kartHeight + kartHeight/13, kartHeight/13);
    rect(xSign, ySign + kartHeight/2 + kartHeight*0.4, kartHeight + kartHeight/13, kartHeight/2);
  }
}
