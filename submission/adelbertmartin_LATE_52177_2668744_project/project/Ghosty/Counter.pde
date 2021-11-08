class Counter {
  int counterNumber = 0;


  void display() {
    textAlign(CENTER);
    fill(0);
    textSize(20);
    text("Cookie count:" + counterNumber, width/2, height-900);
  }
}
