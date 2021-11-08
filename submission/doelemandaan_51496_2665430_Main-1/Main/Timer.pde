class Timer {

  int timeStart; // time when the timer begins
  int timerLength; // duration of timer

  Timer(int initTime) {
    timerLength = initTime; // Initalise timer when it starts
  }

  // Start the timer
  void start() {
    timeStart = millis(); // store time in milliseconds
  }
  // Check if the timer is done
  boolean isDone() {
    int timeTaken = millis() - timeStart; // calculate how much time taken.
    if (timeTaken > timerLength) {
      return true;
    } else {
      return false;
    }
  }
}
