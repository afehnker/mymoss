/*
Made and designed by Hugo and Mitchell
This tab is for importing sounds and displaying all objects on the screen.
It is also used to set the screen size and the ability to use the mouse for interaction.
*/
import processing.sound.*; //now we can use sounds in the program

//initialising variables, colors and classes
color backgroundColor;
Closet closet;
PaintBoard paintboard;
Painting painting;

//initialising all the sound files
SoundFile image0;
SoundFile image1;
SoundFile image2;
SoundFile image3;
SoundFile image4;
SoundFile drawerOpening;
SoundFile drawerClosing;
SoundFile ballsFall;
SoundFile wavingMan;
SoundFile pop;
SoundFile yoyo;

void setup() {
  size(1280, 720); //screen size
  backgroundColor = color(168, 212, 255); //light blue color
  
  //creating objects
  closet = new Closet();
  paintboard = new PaintBoard();
  painting = new Painting();
  
  //importing sound files
  image0 = new SoundFile(this, "Image0.mp3");
  image1 = new SoundFile(this, "Image1.mp3");
  image2 = new SoundFile(this, "Image2.mp3");
  image3 = new SoundFile(this, "Image3.mp3");
  image4 = new SoundFile(this, "Image4.mp3");
  drawerOpening = new SoundFile(this, "drawerOpen.mp3");
  drawerClosing = new SoundFile(this, "drawerClosing.mp3");
  ballsFall = new SoundFile(this, "ballsFall.mp3");
  wavingMan = new SoundFile(this, "wavingMan.mp3");
  pop = new SoundFile(this, "pop.mp3");
  yoyo = new SoundFile(this, "yoyo.mp3");
}

void draw() {
  background(backgroundColor);
  
  //displaying and updating closet, paintboard and painting and their classes
  closet.display();
  paintboard.display();
  paintboard.makePaint();
  painting.display();
  painting.update();
}

void mousePressed(){
  //interaction using mouse with objects
  painting.pressedPainting();
  paintboard.selectColor(); 
  paintboard.erasePaint();
  closet.interactCloset();
}
