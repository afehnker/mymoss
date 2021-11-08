//Letters on the windows

class letters {

  //add textfont
  PFont font = loadFont("Harlow32.vlw");
  String s = "www.planetofsound.nl";
  float a;

  void display() {
    colorMode(HSB);
    textFont(font);
    textAlign(CENTER);
    textSize(24);
    text(s, width/2, height/2+270);

//make a rainbow fade color for the letters
    if (a >= 255)
      a=0;
    else  a++;
    fill(a, 255, 255);
  }
}
  
 
