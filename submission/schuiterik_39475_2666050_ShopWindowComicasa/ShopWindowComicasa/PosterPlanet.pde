/*
  This class is used to fill the background of the planet poster.
 */
class PosterPlanet {
  //position
  float xPosPosterPlanet;
  float yPosPosterPlanet;

  PosterPlanet (float newX, float newY) {
    xPosPosterPlanet = newX;   
    yPosPosterPlanet = newY;
  }

  void display() {
    //background
    fill(1, 5, 64);
    rect(300, 700, 350, 250);
    pushMatrix();
    translate(300, 700);
    fill(255);
    //astronaut 1 (right)
    pushMatrix();
    translate(xPosPosterPlanet+150, yPosPosterPlanet+100);
    rotate(radians(45));
    rect(0, 0, 20, 30);
    popMatrix();
    circle(xPosPosterPlanet+130, yPosPosterPlanet+80, 50);
    triangle(xPosPosterPlanet+175, yPosPosterPlanet+125, xPosPosterPlanet+125, yPosPosterPlanet+125, xPosPosterPlanet+175, yPosPosterPlanet+75);
    pushMatrix();
    translate(xPosPosterPlanet+125, yPosPosterPlanet+75);
    rotate(radians(40));
    fill(0);
    ellipse(0, 0, 20, 30);
    fill(219);
    ellipse(-4, -5, 8, 14);
    popMatrix();
    circle(xPosPosterPlanet+165, yPosPosterPlanet+95, 5);
    circle(xPosPosterPlanet+150, yPosPosterPlanet+110, 5);
    //astronaut 2 (left)
    pushMatrix();
    translate(xPosPosterPlanet-150, yPosPosterPlanet+100);
    rotate(radians(-45));
    rect(0, 0, 20, 30);
    popMatrix();
    fill(255);
    circle(xPosPosterPlanet-130, yPosPosterPlanet+80, 50);
    triangle(xPosPosterPlanet-175, yPosPosterPlanet+125, xPosPosterPlanet-125, yPosPosterPlanet+125, xPosPosterPlanet-175, yPosPosterPlanet+75);
    pushMatrix();
    translate(xPosPosterPlanet-125, yPosPosterPlanet+75);
    rotate(radians(-40));
    fill(0);
    ellipse(0, 0, 20, 30);
    fill(219);
    ellipse(4, -5, 8, 14);
    popMatrix();
    fill(178);
    circle(xPosPosterPlanet-165, yPosPosterPlanet+95, 5);
    circle(xPosPosterPlanet-150, yPosPosterPlanet+110, 5);
  }
}
