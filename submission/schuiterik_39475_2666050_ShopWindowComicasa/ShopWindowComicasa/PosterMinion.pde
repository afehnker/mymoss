/*
  This class displays the 2 different backgrounds
  for the minion. The first is the poster on the shopwindow.
  The second one is the background inside the game.
 */

class PosterMinion {
  float posterMinionX;
  float posterMinionY;
  float speed = 0.009;
  float xCursor;
  float yCursor;


  PosterMinion(float x, float y) {
    posterMinionX = x;
    posterMinionY = y;
  }

  void displayPoster() {
    fill(175, 175, 175);
    rect(posterMinionX, posterMinionY+50, 200, 300);
    
    //Banana
    stroke(255, 255, 31);
    strokeWeight(15);
    arc(posterMinionX, posterMinionY-50, 50, 30, PI/4, PI);
    stroke(0);
    strokeWeight(1);
    
    //Rope
    line(posterMinionX, posterMinionY-45, posterMinionX, posterMinionY -100);
    

  }

  void displayBackground() {
    //Background room
    stroke(0);
    strokeWeight(1);
    fill(175, 175, 175);
    rect(width/2, 900, width, 600);
    rect(1000, height/2 - 150, 1000, 600);
    quad(500, 0, 0, 0, 0, 900, 500, 600);

    //Conveyorbelt
    noStroke();
    fill(50);
    rect(800, 650, 40, 200);
    rect(1200, 650, 40, 200);
    rect(800, 650, 50, 50);
    rect(1200, 650, 50, 50);
    rect(800, 750, 50, 50);
    rect(1200, 750, 50, 50);
    rect(1000, 500, 800, 20);
    rect(1000, 550, 800, 20);

    //Left rotor
    pushMatrix();
    translate(600, 525);
    rotate(-speed * millis());
    circle(0, 0, 70);
    fill(150);
    circle(0, 0, 50);
    fill(100);
    rect(0, 10, 10, 20);
    popMatrix();

    //Right rotor
    pushMatrix();
    translate(1400, 525);
    rotate(-speed * millis());
    fill(50);
    circle(0, 0, 70);
    fill(150);
    circle(0, 0, 50);
    fill(100);
    rect(0, 10, 10, 20);
    popMatrix();
    
    fill(75);
    rect(350, 100, 10, 300);
    noFill();
    stroke(120);
    strokeWeight(12);
    arc(350, 300, 50, 100, PI/1.2, PI + PI/2);
    arc(350, 300, 50, 100, 0-PI/2, PI-PI/1.2);
    stroke(0);
    strokeWeight(1);
    
    
    
  }
}
