/* 
All images used have been made or taken by us
*/

Background background;
Frame frame;
Athena athena;
Girl girl;
Housewife housewife;
Robe robe;

void setup() {
  size(1000, 1000);
  rectMode(CENTER);
  background = new Background(width/2, height/2);
  frame = new Frame(width/2, height/2);
  athena = new Athena(300, 730);
  girl= new Girl(600, 720);
  housewife= new Housewife(450, 720);
  robe= new Robe(width/2, height/2);
}

void draw() {
  background.display();
  frame.display();
  athena.display();
  girl.display();
  housewife.display();
  robe.display();
}
void mousePressed() {
  if (athena.isMouseOver(mouseX, mouseY)) {
    println("does this work?");
    athena.update();
  }
  if (housewife.isMouseOver(mouseX,mouseY)) {
    println("does this work?");
    housewife.update();
}
if (girl.isMouseOver(mouseX,mouseY)) {
    println("does this work?");
    girl.update();
}
}
