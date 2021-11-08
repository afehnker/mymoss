//this class makes the switch
class Switch {
  //constructor of the background
  Switch () {
  }

  void display () {
    //draws the switch
    stroke (150);
    fill (200);
    rect (switchX, switchY, 40, 60);

    //red button
    fill (255, 0, 0);
    rect (switchX, switchY-13, 20, 20);

    //green button 
    fill (0, 255, 0);
    rect (switchX, switchY+13, 20, 20);
  }
}
