/*Flowers class*/
class Flowers {
  color colorFlowers;  //declaring variables for flowers, creating boolean value for falling, and stopping the leaves
  float xFlowers;
  float yFlowers;
  float speedFlowers;
  float flowersRotation;
  String season;
  boolean update, stopfalling, stop;


  // flower creation conditions

  Flowers(float initX, float initY, float initSpeed, float initRotation) {
    season="autumn"; //set colour for flowers
    xFlowers=initX;
    yFlowers=initY;
    speedFlowers= initSpeed;
    flowersRotation= initRotation;
  }

  //displaying the flowers
  void display() {

    if (update==true) {
      xFlowers= random(100, 600);         //resetting the flowers with random X and Y pos
      yFlowers=random(600, 800);
      update=false;
      falling=false;
      growing =false;                     // setting the booleans to their initial value
      stop = false;
      stopfalling = false;
    }


    if ( season=="autumn") {
      colorFlowers= color(250, 78, 128);    //colour for flowers, initially there were more seasons and it 'cycled' between.
    }


    pushMatrix();                         //flowers drawn here
    translate(xFlowers, yFlowers);
    rotate(flowersRotation);
    fill(colorFlowers);
    ellipse(0, 0, 12, 40);
    ellipse(0, 0, 40, 12);

    noStroke();
    fill(0);
    circle(0, 0, 12); //flower center
    popMatrix();
  }

  //Flowers falling
  void fall() {
    yFlowers= yFlowers+2*speedFlowers;  //updating the Y value of the flowers (adding velocity to the yPos of flowers)
    stop = false;
    if (yFlowers > height) {      //collision detection for the ground

      stopfalling = true;
    }
    if ( stopfalling ==true) {
      yFlowers = height-10;
    }
  }
  void grow() {                         //flowers 'growing' opposite of the void fall

    yFlowers = yFlowers-2*speedFlowers;
    stopfalling =false;
    if (yFlowers < height/2) {
      stop = true;
    }
    if ( stop ==true) {
      yFlowers = height/2;
    }
  }


  void reset() {
    update=true;  //resetting the flower position with a boolean (changes value through classes)
  }
}
// end of class
