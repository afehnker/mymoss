//startscreen for the game. the shoppingwindow of the intertoys.
class Shoppingwindow {

  PImage Intertoyslogo;
  float factor = 0.5;


  void display() {
    background(255);
    Intertoyslogo = loadImage("Intertoyslogo.png");
    image(Intertoyslogo, 200, 80);//Logo

    fill(51, 187, 255); //Sky
    rect(0, 0, factor*1500, factor*140);

    fill(51, 187, 255, 60);//Glass
    rect(0, factor*170, factor*1500, factor*630);
    fill(150);//Roof and pillars
    noStroke();
    rect(0, factor*170, factor*50, factor*630);
    rect(factor*1450, factor*170, factor*50, factor*630);
    rect(0, factor*140, factor*1500, factor*50);
    rect(0, factor*480, factor*1300, factor*20);
    stroke(10);
    {
      fill(54, 190, 245);
      rect(factor*650, factor*550, factor*100, factor*250);
      rect(factor*750, factor*550, factor*100, factor*250);
    }
    fill(0);
    circle(factor*720, factor*675, factor*15);
    circle(factor*780, factor*675, factor*15);

    stroke(1);
    fill(180);

    rect(1350, 600, 50, 250);
    rect(1400, 550, 50, 300);
    rect(1450, 500, 50, 350);

    stroke(1);
    fill(180);
    rect(1300, 650, 50, 200);
    rect(1250, 700, 50, 150);
    rect(1200, 750, 50, 100);
  }
}
