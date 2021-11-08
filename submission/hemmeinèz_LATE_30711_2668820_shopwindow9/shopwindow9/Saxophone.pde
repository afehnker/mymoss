//this makes the saxophone
class Saxophone {
  //setup variables
  float saxX;
  float saxY;

  //constructor of the saxophone
  Saxophone (float initX, float initY) {
    saxX = initX;
    saxY = initY;
  }

  void display () {
    pushMatrix ();
    translate (saxX, saxY);
    //mouthpiece
    noStroke ();
    fill (#E8C01E);
    rect (30, -5, 20, 7);

    //body
    rect (0, -5, 50, 15);
    rect (-15, 35, 20, 90);
    ellipse (-19, 90, 25, 45);
    triangle (-25, 110, -65, 70, 0-30, 60);

    //keys 
    stroke (100);
    strokeWeight (0.5);
    noFill();
    ellipse (-20, 20, 5, 7);
    ellipse (-20, 30, 5, 7);
    ellipse (-20, 40, 5, 7);
    ellipse (-20, 50, 5, 7);
    popMatrix ();
  }

  // if the saxophone is clicked on, it starts playing, if you click on it again or on another instrument, the music stops
  void play (float mx, float my) {
    if (dist(mx, my, saxX, saxY)<=100) {
      if (notesPlaying ==true) {
        notesPlaying = false;
        banjoSong.stop();
        djembeSong.stop();
        fluteSong.stop();
        guitarSong.stop();
        saxSong.stop();
        tromSong.stop();
      } else {
        saxSong.play(); 
        notesPlaying = true;
      }
    }
  }
}
