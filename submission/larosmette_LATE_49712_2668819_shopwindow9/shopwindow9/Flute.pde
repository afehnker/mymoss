//this class makes a flute
class Flute {
  //setup variables 
  float fluteX;
  float fluteY;

  //constructor of the flute
  Flute (float initX, float initY) {
    fluteX = initX;
    fluteY = initY;
  }

  void display () {
    pushMatrix ();
    translate (fluteX, fluteY);
    //body
    noStroke ();
    fill(#CFD5D6);
    rect (0, 0, 150, 13);

    //lipplate
    stroke(100);
    strokeWeight(1.5);
    noFill();
    ellipse (-60, -4, 9, 4);

    //keys
    ellipse (-40, -4, 4, 4);
    ellipse (-30, -4, 4, 4);
    ellipse (-20, -4, 4, 4);
    ellipse (-10, -4, 4, 4);
    ellipse (0, -4, 4, 4);
    ellipse (10, -4, 4, 4);
    ellipse (20, -4, 4, 4);
    ellipse (30, -4, 4, 4);
    ellipse (40, -4, 4, 4);
    popMatrix ();
  }

  //if the flute is clicked on, it starts playing, if you click on it again or on another instrument, the music stops
  void play (float mx, float my) {
    if (dist(mx, my, fluteX, fluteY)<=50) {
      if (notesPlaying ==true) {
        notesPlaying = false;
        banjoSong.stop();
        djembeSong.stop();
        fluteSong.stop();
        guitarSong.stop();
        saxSong.stop();
        tromSong.stop();
      } else {
        fluteSong.play(); 
        notesPlaying = true;
      }
    }
  }
}
