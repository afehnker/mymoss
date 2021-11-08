//this class makes the rubber ducks poster
class Poster {
  //setup variables
  float posterX;
  float posterY;

  //constructor of the poster
  Poster(float initX, float initY) {
    posterX = initX;
    posterY = initY;
  }

  void display () {
    //draws the poster itself
    pushMatrix ();
    translate (posterX, posterY);
    stroke (90);
    fill(100, 100, 200);
    rect (0, 0, 90, 130);

    //draws the middle duck
    noStroke ();
    fill (#facf58);
    ellipse (0, 10, 30, 15);
    ellipse (11, 0, 13, 13);
    fill(#ffb537);
    ellipse (15, 2, 7, 4);
    fill (70);
    ellipse (13, -1, 2, 2);

    //draws the left duck
    fill (#fa58d3);
    ellipse (-28, 0, 30, 15);
    ellipse (-17, -10, 13, 13);
    fill(#ffb537);
    ellipse (-13, -8, 7, 4);
    fill (70);
    ellipse (-15, -11, 2, 2);

    //draws the right duck
    fill (#58facf);
    ellipse (28, 30, 30, 15);
    ellipse (17, 20, 13, 13);
    fill(#ffb537);
    ellipse (13, 22, 7, 4);
    fill (70);
    ellipse (15, 21, 2, 2);
    popMatrix ();
  }
}
