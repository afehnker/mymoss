//this class makes the banjo
class Banjo {
  //setup variables
  float banjoX;
  float banjoY;
  Deighth deighthB;

  //constructor of the banjo
  Banjo(float initX, float initY) {
    banjoX = initX;
    banjoY = initY;
    deighthB = new Deighth(banjoX, banjoY);
  }

  void display () {
    pushMatrix ();
    translate (banjoX, banjoY);
    //head
    fill(155, 100, 155);
    ellipse (0, 0, 120, 120);
    noFill();
    stroke (50);
    strokeWeight (3);
    ellipse (0, 0, 120, 120);

    //neck
    noStroke ();
    fill(105, 50, 105);
    rect (0, -100, 30, 100);
    rect (0, -150, 40, 50);

    //strings
    stroke (50);
    strokeWeight (2);
    line (0, 50, 0, -170);
    line (-5, 50, -5, -170);
    line (5, 50, 5, -170);

    //bridge
    fill (50);
    rect (0, 15, 15, 3);

    //tailpiece
    rect (0, 50, 15, 20);

    //pegs
    triangle (20, -160, 23, -163, 23, -157);
    triangle (20, -140, 23, -143, 23, -137);
    triangle (-20, -160, -23, -163, -23, -157);
    triangle (-20, -140, -23, -143, -23, -137);
    popMatrix ();
  }

  // if the banjo is clicked on, it starts playing, if you click on it again or on another instrument, the music stops
  void play (float mx, float my) {
    if (dist(mx, my, banjoX, banjoY)<=100) { 
      if (notesPlaying ==true) {
        notesPlaying = false;
        banjoSong.stop();
        djembeSong.stop();
        fluteSong.stop();
        guitarSong.stop();
        saxSong.stop();
        tromSong.stop();
      } else {
        banjoSong.play(); 
        notesPlaying = true;
      }
    }
  }
}
