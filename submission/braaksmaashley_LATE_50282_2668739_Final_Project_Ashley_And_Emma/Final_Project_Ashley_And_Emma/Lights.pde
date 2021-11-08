class Lights {

  /*
  This class creates the lights over the background and makes it turn off and on again with the letter "o".
   
   */

  boolean button = false;
  color lamps, lightsOn, lightsOff, On, Off, red, grey;

  Lights() {
    lightsOn = color(237, 227, 223, 40);
    lightsOff = color(178, 172, 169, 50);
    grey = #ADADAD;
    red = #FC7878;

    lamps = lightsOn;
    On = red;
    Off = grey;
  }


  void display() {
    noStroke();

    fill(lamps);
    rect(0, 0, width, height);

    fill(On);
    rect((width/10)*1.5, (height/10)*6, 30, 35);
    fill(Off);
    rect((width/10)*1.5, (height/10)*6 + 35, 30, 35);
  }


  void turnOnOff() {
    if (key=='o') {
      if (button) {
        lamps = lightsOff;
        On = grey;
        Off = red;
        button = false;
      } else {
        lamps = lightsOn;
        On = red;
        Off = grey;
        button = true;
      }
    }
  }
}
  
