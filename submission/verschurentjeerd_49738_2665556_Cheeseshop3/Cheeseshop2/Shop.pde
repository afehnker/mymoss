//In this class everything is put together. This is also the "haven" between the classes for exchanging data.

class Shop {
  Game action;
  Tim tim;
  Outside outsideDecoration;

  Shop() {
    action = new Game();
    tim = new Tim();
    outsideDecoration = new Outside();
  }

  void display() {
    cheeseStand();
    tim.eat1();
    tim.eat3();
    cheeseTable();
    cupboard();
    tim.eat2();
    tim.blockDisplay();
    tim.timDisplay();
    action.gate();
    shopFront(); 
    tim.update();
    tim.move();
    outsideDecoration.kartDisplay();
    outsideDecoration.signDisplay();
    action.update();
    action.timer();
    tim.failScreen();
    tim.winScreen();
  }

  void clickLock(float initX, float initY) { //When the lock is clicked, we'll execute openLock. 
    action.openLock(initX, initY);
  }
  void buttonPressed() { //When button is pressed, we'll execute controlPressed.
    tim.controlPressed = true;
  }
  void eataway() { //When you are allowed to eat, the program will start to check whether you've already eaten all the cheeses.
    tim.hasWon();
  }

  void fail() { //The program keeps checking whether you've failed. 
    tim.hasLost();
  }
}
