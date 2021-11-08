//this class makes the trombone 
class Trombone {
  //setup variables 
  float tromboX;
  float tromboY;

  //constructor of the trombone
  Trombone (float initX, float initY) {
    tromboX = initX;
    tromboY = initY;
  }

  void display () {
    pushMatrix ();
    translate (tromboX, tromboY);
    //slides 
    stroke (#E8A744);
    strokeWeight (7);
    fill (#E8A744);
    line (0, 0, 100, 0);
    line (0, 20, 100, 20);
    line (0, 40, 100, 40);

    //bell
    triangle (100, 0, 120, 7, 120, -7);

    //turning slide 
    noFill();
    arc (0, 10, 20, 20, HALF_PI, PI+HALF_PI);
    arc (100, 30, 20, 20, HALF_PI+PI, TWO_PI+HALF_PI);

    //bell braces
    fill (#E8A744);
    strokeWeight (3);
    line (30, 0, 30, 20);
    line (35, 0, 35, 20);

    //mouthpiece
    strokeWeight(1);
    triangle (0, 40, -10, 45, -10, 35);
    popMatrix ();
  }

  //if the trombone is clicked on, it starts playing, if you click on it again or on another instrument, the music stops
  void play (float mx, float my) {
    if (dist(mx, my, tromboX, tromboY)<=100) {
      if (notesPlaying ==true) {
        notesPlaying = false;
        banjoSong.stop();
        djembeSong.stop();
        fluteSong.stop();
        guitarSong.stop();
        saxSong.stop();
        tromSong.stop();
      } else {
        tromSong.play(); 
        notesPlaying = true;
      }
    }
  }
}
