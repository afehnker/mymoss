class PosterButterfly {
  float posterButterflyX;
  float posterButterflyY;


  PosterButterfly(float x, float y) {
    posterButterflyX = x;
    posterButterflyY = y;
  }


  void display() {
    //Poster background
    stroke(0);
    fill(26, 189, 64);
    rect(posterButterflyX, posterButterflyY, 300, 300);

    //Grass
    noStroke();
    fill(176, 231, 245);
    rect(posterButterflyX, posterButterflyY - 100, 300, 100);

    //Cloud
    fill(255, 255, 255);
    circle(posterButterflyX-50, posterButterflyY - 100, 30);
    circle(posterButterflyX-35, posterButterflyY - 110, 40);
    circle(posterButterflyX-10, posterButterflyY - 110, 30);
    circle(posterButterflyX+10, posterButterflyY - 100, 30);
    rect(posterButterflyX-20, posterButterflyY - 100, 50, 30);

    //Flowers
    noFill();
    stroke(44, 242, 120);
    strokeWeight(5);
    arc(posterButterflyX-20, posterButterflyY + 115, 20, 70, PI/1.5, PI + PI/2);
    strokeWeight(1);
    noStroke();
    fill(219, 254, 255);
    circle(posterButterflyX-35, posterButterflyY + 85, 20);
    circle(posterButterflyX-25, posterButterflyY + 75, 20);
    circle(posterButterflyX-15, posterButterflyY + 85, 20);
    circle(posterButterflyX-25, posterButterflyY + 95, 20);
    fill(215, 245, 22);
    circle(posterButterflyX-25, posterButterflyY + 85, 20);

    noFill();
    stroke(44, 242, 120);
    strokeWeight(5);
    arc(posterButterflyX - 45, posterButterflyY + 148, 20, 70, PI + PI/2, TWO_PI);
    strokeWeight(1);
    noStroke();
    fill(219, 254, 255);
    circle(posterButterflyX-55, posterButterflyY + 118, 20);
    circle(posterButterflyX-45, posterButterflyY + 108, 20);
    circle(posterButterflyX-35, posterButterflyY + 118, 20);
    circle(posterButterflyX-45, posterButterflyY + 128, 20);
    fill(215, 245, 22);
    circle(posterButterflyX-45, posterButterflyY + 118, 20);

    //Poster border
    noFill();
    stroke(0);
    rect(1200, 250, 300, 300);
  }
}
