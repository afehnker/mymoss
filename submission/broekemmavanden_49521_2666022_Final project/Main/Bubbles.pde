class Bubbles {
  float x;
  float y; 
  float radius; 
  float transparancy;
  float xSpeed;
  float ySpeed;


  Bubbles() {
    x = random((width/2+300), (width/2+500));
    y = height/2+195+30;
    radius = random(5, 15);
    transparancy = random(100, 200);
    xSpeed = random(-0.5, 0.5);
    ySpeed = random(-0.5, 0);
    ellipseMode(CENTER);
  }


  void display() {
    //Bubble
    noStroke();
    fill(color(40, 201, 0, transparancy));
    ellipse(x, y, radius, radius);
  }

  void move() {
    x = x + xSpeed;
    y = y + ySpeed; 
    transparancy = transparancy - 0.5;
  }
}
