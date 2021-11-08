/*
 Not very interesting counter stuff here :)
 */

class Time {

  int seconds;
  int timer = millis();
  int time = 120;

  //Using millis to get a timer in seconds.
  void count() {
    if (phase == 1) {
      timer = millis();
      seconds = round(timer/1000);
      println("Time: " + seconds);
    }
  }

  void display() {
    if (phase == 2) {
      fill(245);
      textSize(30);
      text("Time: " + round(seconds) + " seconds", width/2-70, height/2+50);
    }
  }

  //When you run out of time you lose, so phase becomes 3.
  void timeIsUp() {
    if (seconds >= time) {
      phase = 3;
    }
  }

  void resetTime() {
    time += time;
  }
}
