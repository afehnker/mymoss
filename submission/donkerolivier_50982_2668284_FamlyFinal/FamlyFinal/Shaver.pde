class Shaver {
  //class vars; only defined once on run.
  float xShaver, yShaver, shaverwidth, shaverheight;
  PVector shaverVelocityVector;
  PVector deltasVector;
  float deltax, deltay;
  float[] xhistory = new float[2]; //new float array with length 2.
  float[] yhistory = new float[2];
  float headingToRotateBy;    //if mouse is used
  float headingFromRoll;      //if wiimote is used
  float xShaverWithVibration, yShaverWithVibration;

  Shaver(float initX, float initY, float initwidth, float initheight) { 
    xShaver = initX;
    yShaver = initY;
    shaverwidth = initwidth;
    shaverheight = initheight;
    shaverVelocityVector = new PVector(0, 0);
    deltasVector = new PVector(0,0);
  }

  void display() {
    fill(230);
    strokeWeight(8);
    pushMatrix();
    translate(xShaverWithVibration, yShaverWithVibration);
    
    if (mouseMode == true) {      //two ifs is faster than an AND in one if (I think?): If first if is false, skip everything immediately! No need to compare in the AND gate, which takes more time.
      if (shaverVelocityVector.y < 0) {
        rotate(headingToRotateBy + HALF_PI); //in mouseMode, this is proper rotation from the deltax/y algorithm.
      }
    } else {
      rotate(headingFromRoll);         //with wiimote, i.e. not-mouseMode.
    }

    arc(0, 0, shaverwidth, shaverheight, PI, TWO_PI);  //shapes that make up the shaver
    rectMode(CORNER);
    rect(-shaverwidth/2, 0, shaverwidth, shaverheight/3); //xShaver - arc radius for correct position in corner mode.
    fill(0);
    rect(-shaverwidth/6, -shaverheight/4, shaverwidth/3, shaverheight);
    popMatrix();
  }

  void changePos() {    //change position according to mousex & mousey
    xShaver = mousex;      //see below why these coords are defined twice.
    yShaver = mousey;
    xShaverWithVibration = mousex;
    yShaverWithVibration = mousey;
  }

  void velocityVector() {
    //Goal: find the velocity vector of the shaver:
    //v_x = dx/dt, v_y = dy/dt
    //Or, discretely, v_x ~= deltax/deltat, deltax = x_current - x_previous and deltat = t_current - t_previous = frame_current - frame_previous = 1 frame. Idem dito for vy.
    //Algorithm: 
    //create empty list,
    //Put x_current into it,
    //Put x_previous into it (now 2 elements int there),
    //take their difference,
    //x_previous becomes x_current, x_current becomes the new x_current. Third list element is removed.

    //OR: after having calculated xShaver for a frame (so just in changePos), add it to the empty list. Keep adding, and remove the third element. This ensures a list with x_current and x_previous.
    //So:

    xhistory[0] = xhistory[1];      //x_previous becomes x_current
    xhistory[1] = xShaver;          //and x_current is updated ! 
  
    yhistory[0] = yhistory[1];
    yhistory[1] = yShaver;
    
    deltax = xhistory[1] - xhistory[0];
    deltay = yhistory[1] - yhistory[0];

    ////Now put these components into a velocity vector by adding them to shaverVelocityVector:
    if (abs(deltax) > 2 || abs(deltay) > 2) {    //This fixes some jittering in the displaying of the shaver heading at small shaver velocities (which is computed from shaverVelocityVector below).
      shaverVelocityVector.x = deltax;          //the jittering is caused by the fact that the mouse can never really move in a diagonal line, it always "steps".
      shaverVelocityVector.y = deltay;
    }
    
    headingToRotateBy = shaverVelocityVector.heading();    //Again, with the jitter fix!
    
    //for calculating raw shaver movement (i.e. without the jitter fix, since that's just a visual thing).
    deltasVector.x = deltax;
    deltasVector.y = deltay;
  }

  void wiiRollHeadingStepAnticlockwise() {
    headingFromRoll = lerp(headingFromRoll, -3.1416/8, 0.1);  //lerp to smoothly transition between headings.
  }

  void wiiRollHeadingStepClockwise() {
    headingFromRoll = lerp(headingFromRoll, 3.1416/8, 0.1);
  }

  void wiiRollHeadingStepCentre() {
    headingFromRoll = lerp(headingFromRoll, 0, 0.1);

   
  }

  void vibrate() {
    //add random positive and negative values to xShaver and yShaver (equally distributed) to keep it centered on average, yet siumulate vibration.
    //doing this might interfere with the calulation of the shaver velocityvector, so I decided to have two sets of coords: One with vibration (which are just visual), and one without (which is for calculation).
    if (shaverVibrating == true) {
      xShaverWithVibration += random(-5, 5);    //add random velocties between -5 and 5
      yShaverWithVibration += random(-1, 1);               
    }                                                        
  }
}
