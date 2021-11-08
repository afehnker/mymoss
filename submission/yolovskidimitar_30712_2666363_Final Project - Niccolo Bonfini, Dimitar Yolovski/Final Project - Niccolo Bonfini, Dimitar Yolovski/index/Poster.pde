class poster {
  float posterX;
  float posterY;
  float posterWidth;
  float posterHeight;
  color posterColor;
  poster(int initX, int initY) {
    posterX = initX;
    posterY = initY;
    posterWidth = 60;
    posterHeight = 90;
    posterColor = color(random(1, 255), random(1, 255), random(1, 255));
  }
  void display() {
    //draws the poster
    rectMode(CENTER);
    fill(posterColor);
    rect(posterX, posterY, posterWidth, posterHeight);
    for (float i = posterY - 30; i <= posterY+40; i = i +20) {
      line(posterX-20, i, posterX+20, i);
    }
    rectMode(CORNER);
    fill(120);
  }
  boolean isOver(float refX, float refY) {
    //checks if the mouse is over the poster
    if (dist(refX, refY, posterX, posterY)<=40) {
      return true;
    } else {
      return false;
    }
  }
}
