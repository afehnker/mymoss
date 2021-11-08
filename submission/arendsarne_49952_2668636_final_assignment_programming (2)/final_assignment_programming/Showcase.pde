class showCase {
  // in this class we created the shop itself
  float showcX;
  float showcY;


  showCase() {
    showcX = width/2;
    showcY = height/2;
  }

  void display() {
    noStroke();
    fill(#96987F);
    rect(0, showcY+200, width, showcY-200);

    rectMode(CENTER);

    stroke(0);
    strokeWeight(2);
    line(100, 600, 100, 102);
    line(1700, 600, 1700, 102);
    line(100, 600, 1700, 600);
    line(25, 800, 100, 600);
    line(1775, 800, 1700, 600);
    noStroke();
    fill(255);
    //top white bar
    rect(0, 0, showcX*4, showcY-200);
    //middle vertical bar
    rect(showcX, showcY, 50, 900);
    //left bar
    rect(showcX-showcX, showcY, 50, 900);
    //right bar
    rect(showcX*2, showcY, 50, 900);
    //grey bottom bars
    fill(#989898);
    stroke(0);
    strokeWeight(2);
    rect(showcX, showcY+400, 50, 75);
    rect(showcX-showcX, showcY+400, 50, 75);
    rect(showcX*2, showcY+400, 50, 75);
    noStroke();
    fill(#56835E);
    triangle(25, 800, 25, 600, 100, 600);
    triangle(1775, 800, 1775, 600, 1700, 600);
  }
}
