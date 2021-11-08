//this class makes the djembe 
class Djembe {
  //setup variables
  float djembeX;
  float djembeY;
  color djembeColor;

  //constructor of the djembe
  Djembe(float initX, float initY) {
    djembeX = initX;
    djembeY = initY;
    djembeColor= color(random(200, 255), random(50, 200), 0); // yellowish/orangeish/brownish
  }

  void display() {
    pushMatrix();
    translate(djembeX, djembeY);

    //shell/foot
    fill(djembeColor);
    quad(100, 120, 20, 120, 0, 0, 120, 0);

    //vertical stripes
    stroke (50);
    line(16, 0, 26, 120);
    line(40, 0, 40, 120);
    line(60, 0, 60, 120);
    line(80, 0, 80, 120);
    line(104, 0, 94, 120);

    //foot/shell
    noStroke();
    quad(30, 120, 90, 120, 100, 200, 20, 200);
    popMatrix();
  }

  //if the djembe is clicked on, it starts playing, if you click on it again or on another instrument, the music stopst
  void play (float mx, float my) {
    if (dist(mx, my, djembeX, djembeY)<=100) {
      if (notesPlaying ==true) {
        notesPlaying = false;
        banjoSong.stop();
        djembeSong.stop();
        fluteSong.stop();
        guitarSong.stop();
        saxSong.stop();
        tromSong.stop();
      } else {
        djembeSong.play(); 
        notesPlaying = true;
      }
    }
  }
}
