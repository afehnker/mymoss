/*Controls class */
class Control {





  Control() {
  }


  void controls() {
    cog.cogMovment(-0.05, 0.01);            //sets values for the rotation of the cogs
    if (keyCode==LEFT) {
      car.left();                              //car moves left
      clock.clockSpeedSecs += 1.5;              //increases the rotational speed of the clock arms
      clock.clockSpeedMins += 1;
      cog.cogMovment( -.2, .1);              //increases rotationspeed for the cogs

      falling = true;                      //makes the flowers fall down
      growing = false;
    }
    if (keyCode==RIGHT) {
      car.right();                            //car moves right
      clock.clockSpeedSecs -= 1.5;
      clock.clockSpeedMins -= 1;              //increases and reverses rotation of the clock arms
      cog.cogMovment( .2, -.1);                //increases rotaion of the cogs

      falling = false;
      growing =true;                        //makes the flowers fly upwards
    }
  }
}

//END OF CONTROL
