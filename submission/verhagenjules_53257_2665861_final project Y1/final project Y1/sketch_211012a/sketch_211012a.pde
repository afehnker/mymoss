 Paintings paintings;
Canvas canvas01;
FunArt funArt;
PImage img;
boolean pressed;
void setup() {
  //frameRate(1);
  size(1200, 677);
  img = loadImage("shop window.png");
  paintings=new Paintings(false, 255, 255, 255, 255);
  canvas01=new Canvas(false, 10, false);
  funArt=new FunArt(false);
  funArt.funArtCanvas();
  canvas01.canvas();
}

void draw() {
 noStroke();
  canvas01.display();
  canvas01.paintBottle();
  paintings.paintings();
  funArt.circlesArt();

  image(img, 0, 0);
  //canvas01.margin();
  paintings.button();
  funArt.buttonDisplay();
  canvas01.buttonDisplay();
  
  funArt.paintSplash();
  
}

void mouseClicked() {
  paintings.clickValue();
  println (mouseX +"," + mouseY);
  paintings.resetClickValue();
  
  canvas01.buttonLogic();
  funArt.buttonLogic();
  funArt.PaintSplashValue();
  canvas01.brushSizeValue();
  canvas01.brushValue ();
  canvas01.brushPaint();
}

void mousePressed() {
  
  
  canvas01.brushPressedValue();
  
}

void mouseDragged(){
   canvas01.brushPaint();
}

//void mouseDragged(){
//canvas01.brushPressedValue();
//}
void mouseReleased() {
  pressed=false;
  canvas01.setColour(false);
}
