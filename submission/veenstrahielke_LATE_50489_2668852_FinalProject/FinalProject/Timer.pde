/*=================
 The timer code is written and designed by An.
 
 ==================
 This is the timer class.
 
 This will simulate the orginal clock, start from 0:00 hour to 3:00 am in the morning.
 If it hits 1 o'clock, the rain method will be triggered and it will start rainning.
 =================*/

class Timer {

  Rain rain = new Rain();

  int hour = 0;
  int minute = 0;
  float i = 0;
  float timeX = width - 200;
  float timeY = height - 100;

  void display() {
    fill(255);
    textSize(100);
    text(nf(hour, 2)+":"+ nf(minute, 2) + " am", timeX, timeY);
  }

  void count() {

    // algorithm to calculate the time
    float count = millis()/1000;
    if ( count - i == 60.000 && count != 0 ) {
      i = count;
      hour ++;
    }
    minute = int(count - i);

    // if the time hit 3 am, you will lose the game
    if ( hour == 3 && minute == 1) {
      gameState = "GAMEOVER";
      hour = 0;
    }

    //if the time hit 1:00 am, it will start raining
    if ( hour == 1) {
      rain.rainFall();
    }
  }
}
