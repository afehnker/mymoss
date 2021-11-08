//Shop window for Manchet accessoires
//Makes the shopping experience more interactive
//Code by Bart and Joris
Hat[] hats = new Hat[4];
PImage img;
PImage img2;
PImage dark;
PImage img3;
Text myText;
Window myWindow;
Closer myCloser;
Lights light;

void setup() {
  size(1920, 1080);
  myWindow = new Window();
  img = loadImage("Manchet.png");
  img2 = loadImage("Lamellen.png");
  dark = loadImage("dark.png");
  img3 = loadImage("Hatstand.png");
  size (1920, 1080);
  myText = new Text();
  myCloser = new Closer();
  light = new Lights();

  for (int i = 0; i < hats.length; i++) {
    hats[i] =  new Hat();
  }
}
void draw() {
  background(39, 64, 92);
  
  for (int i= 0; i< hats.length; i++) {
    hats[i].display();
    hats[i].jump();
  }  
  light.display();
  myWindow.display(); 
  myText.display(); 
  myText.update(); 
  myCloser.display();

}
// to import the mouse coordinates to the hat class
void mousePressed() {
  for (int i = 0; i < hats.length; i++) {
    hats[i].hit(mouseX, mouseY);
  }
}
// to import the pressed keys to the dedicated classes
void keyPressed() {
  if (key == BACKSPACE) {
    myCloser.down();
  }
  if (key== ENTER) {
    myCloser.up();
  }
  if (key== DELETE){
    light.onoff();
  }
}
