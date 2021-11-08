//this class makes the guitar
class Guitar {
  //setup of variables
  float guitarX;
  float guitarY;

  //constructor of the guitar
  Guitar(float initX, float initY) {
    guitarX = initX;
    guitarY = initY;
  }

  void display () {
    pushMatrix ();
    translate (guitarX, guitarY);
    //body
    fill (#A06308);
    noStroke ();
    ellipse (0, 0, 150, 150);
    ellipse (0, -75, 120, 120);

    //neck
    fill (100, 50, 0);
    rect (0, -155, 40, 225);
    rect (0, -250, 50, 50);

    //soundhole
    fill(#764904);
    ellipse (0, -20, 70, 70);
    fill (150);

    //strings
    stroke (0);
    strokeWeight (1);
    line (0, 50, 0, -270);
    line (12, 50, 12, -270);
    line (-12, 50, -12, -270);
    line (6, 50, 6, -270);
    line (-6, 50, -6, -270);

    //turning pegs
    fill (50);
    triangle (25, -250, 28, -253, 28, -247);
    triangle (25, -240, 28, -243, 28, -237);
    triangle (25, -260, 28, -263, 28, -257);
    triangle (-25, -250, -28, -253, -28, -247);
    triangle (-25, -240, -28, -243, -28, -237);
    triangle (-25, -260, -28, -263, -28, -257);

    //bridge
    rect (0, 50, 30, 5);
    popMatrix ();
  }

  // if the guitar is clicked on, it starts playing, if you click on it again or on another instrument, the music stops
  void play (float mx, float my) {
    if (dist(mx, my, guitarX, guitarY)<=100) {
      if (notesPlaying ==true) {
        ;        
        notesPlaying = false;
        banjoSong.stop();
        djembeSong.stop();
        fluteSong.stop();
        guitarSong.stop();
        saxSong.stop();
        tromSong.stop();
      } else {
        guitarSong.play(); 
        notesPlaying = true;
      }
    }
  }
}
