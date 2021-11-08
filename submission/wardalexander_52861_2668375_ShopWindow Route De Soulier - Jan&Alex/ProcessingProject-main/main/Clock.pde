/*Class which displays the clock
 Creates an internalised clock, using inbuilt functions
 Moves the tick hand in real time
 */
class Clock {
  float clockRadius = 250;
  float h, m, s;
  float clockSpeedSecs = 60.0;          //global variables of class Clock
  float clockSpeedMins;
  int time;
  int list;

  Clock() {
  }


  void display() {
    translate(width/2, height/4);
    fill( color(177, 230, 224));
    strokeWeight(16);                  //draws the background of the clock
    stroke(237, 212, 123);
    circle(0, 0, clockRadius);
    image(clockNums, 0, 0);            //portays the numbers and lines of the clock as an image
  }

  void clockTick() {
    h = hour();
    m = minute();                    //sets values of h,m,s to the real life amounts of hours, minutes and seconds
    s = second();
    noFill();
    stroke(0, 0, 0);               //colour of stroke
    strokeWeight(1);
    s += clockSpeedSecs;
    float tickAngle = (30-s)*6*PI/180;
    float sinAngle = sin(tickAngle)  ;
    float cosAngle = cos(tickAngle) ;
    circle(0, 5, 8);
    // SECONDS

    int secondY= (int)(0 +clockRadius/2.3 * cosAngle);
    int secondX = (int)(0 + clockRadius/2.3 * sinAngle);            //updates the clock arm seconds
    line(0, 5, secondX, secondY);
    strokeWeight(3);


    // MINUTES

    m+= (s/60.0);
    m += clockSpeedMins;                                //updates the clock minute clock arm every minute
    tickAngle = (30-m) * 6*PI/180;
    sinAngle = sin(tickAngle);
    cosAngle = cos(tickAngle);

    int minuteY = (int)(0 + clockRadius / 2.5 * cosAngle);
    int minuteX = (int)(0 + clockRadius / 2.5 * sinAngle);

    line(0, 5, minuteX, minuteY);

    // HOURS

    strokeWeight(4);
    h += (m/60.0);
    tickAngle = (30-h)*30*PI/180;
    sinAngle = sin(tickAngle);                        //updates the hours clock arm every hour
    cosAngle = cos(tickAngle);

    int hourY= (int)(0 + clockRadius / 3 * cosAngle);
    int hourX= (int)(0 + clockRadius / 3 * sinAngle);

    line(0, 5, hourX, hourY);
  }
}

//END OF CLOCK
