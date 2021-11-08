import processing.sound.*;
class Bat {
  float x, y, dx, dy;
  PShape batShape, wing, curve1, curve2, curve3, curve4, curve5, curve6;
  SoundFile batSound;


  Bat() {
    dx = 500;
    dy = 290;
    batSound = new SoundFile(Main.this, "LotsOfBats.mp3");
  }

  void display() {
    noStroke();
    fill(0);
    pushMatrix();
    translate(x, y);
    //wing
    triangle(0, 0, -30, 15, -10, 40);
    fill(0, 50, 100);
    //backside curves wing
    bezier(-31, 15, -25, 15, -20, 15, -26, 21.2);
    bezier(-27, 21.2, -21, 21.2, -15, 21.2, -20, 27.5);
    bezier(-21, 27.5, -15, 27.5, -10, 27.5, -15, 33.7);
    bezier(-16, 33.7, -10, 33.7, -5, 33.7, -10, 40);
    //front curves wing
    bezier(0, 0, -5, 0, -10, 0, -5, 20.6);
    fill(0);
    bezier(-7, 15.6, 5, 20.6, -5, 20.6, -10, 40);
    //head
    ellipse(-7, 3, 10, 10);
    triangle(-9.5, -1, -4.5, -1, -7, -6);
    popMatrix();
  }

  void removeBats(int i) {
    float xBat = swarm.get(i).x;
    float yBat = swarm.get(i).y;
    if (xBat > width + 5 || yBat < -5) {
      swarm.remove(i);
    }
  }

  void update() {
    x += dx;
    y += dy;
    dx = random(-1, 3);
    dy = random(-3, 2);
  }
}
