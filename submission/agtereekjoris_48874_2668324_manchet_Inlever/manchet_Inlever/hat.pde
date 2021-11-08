class Hat { //<>//

  float xHat = random(500, 1405);
  float yHat = height/2;
  float vy = 0;
  float ax = 0;
  float ay = 0;
  color r = color(random(0, 255), random(0, 255), random(0, 255) );
  boolean hit = false;

  boolean[] keys = { false, false };
//code for the hitbox
  void hit(float hatmouseX, float hatmouseY) {
    if (hatmouseX > xHat+20-150 && hatmouseX < xHat+20+150) {   
      if (hatmouseY > yHat-70 && hatmouseY < yHat + 50) {
        hit = true;
        vy = -10;
      }
    }
  }


  void jump() {
    println(hit);
    if (hit) {
      ay = .32;
      vy+=ay;
      yHat+=vy;

      if (yHat>height/2) { 
        yHat=height/2; 
        vy=0; 
        ay=0;
      }
      if ( yHat>800 ) {
        yHat = -100;
        vy = 10;
      }
    }
  }

  void display() {
    image(img3, xHat-1200,127,2500,1150);
    strokeWeight(3);
    fill(r);
    ellipse(xHat+20, yHat+20, 300, 80);
    arc(xHat+20, yHat+20, 200, 200, PI, 2*PI);
    arc(xHat+20, yHat+20, 200, 30, 0, PI);
    ellipse(xHat+20, yHat+50, 20, 20);
  }
}
