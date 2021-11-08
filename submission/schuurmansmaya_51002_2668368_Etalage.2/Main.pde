Shoppingwindow  s;
Mascotte m;
//Platform p;
//MascotteCube mc;
Mario ma;


boolean newletter;
boolean direction;
boolean jump;
float velocity;
float velocityconst;


void setup() {

  m = new Mascotte ();
   s = new Shoppingwindow();
 //  p= new Platform(500,750);
   ma = new Mario();

  size (1500, 800);
  velocityconst = -5.5;
  velocity = velocityconst;
}


void draw() {

  s.display();
  m.display();
  ma.display();

  
  newletter = false;
  if (newletter == true) {
    m.drive(direction);
  }
  if (jump == true) {
    m.jump();
  }
  
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      m.moveLeft();
    } else if (keyCode == RIGHT) {
      m.moveRight();
    } else if (keyCode == UP) {
      jump = true;
    }
  }
}
