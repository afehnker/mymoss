import processing.sound.*;

storeFront front;

overlay mainWindow;
overlay topWindow;
overlay doorWindow;

shelves shelf1;
shelves shelf2;
shelves bottom;

musicArt Yves;
musicArt Uchis;
musicArt Tanuki;
musicArt Aphex;
musicArt Garden;
musicArt Venus;


disc  cd1;
disc  cd2;
disc  cd3;
disc  cd4;
disc  cd5;
disc  cd6;


playSymbol buttonTest;

musicSelect cdPlayer;
float selectX;
float selectY;

void setup() {
  size(1000, 1000);
  front = new storeFront();

  mainWindow = new overlay(135, 245, 550, 595);
  topWindow = new overlay(135, 120, 550, 105);
  doorWindow = new overlay(720, 140, 160, 65);

  shelf2 = new shelves(135, 600);
  shelf1 = new shelves(135, 400);
  bottom = new shelves(135, 820);

  Yves = new musicArt(660, 400, 0);
  Uchis = new musicArt(460, 400, 1);
  Tanuki = new musicArt(260, 400, 2);

  Aphex = new musicArt(660, 600, 3);
  Garden = new musicArt(460, 600, 4);
  Venus = new musicArt(260, 600, 5);

  cd1 = new disc(660, 400, 0);
  cd2 = new disc(460, 400, 1);
  cd3 = new disc(260, 400, 2);
  cd4 = new disc(660, 600, 3);
  cd5 = new disc(460, 600, 4);
  cd6 = new disc(260, 600, 5);


  selectX = 310;
  selectY = 770;
  cdPlayer = new musicSelect(selectX, selectY);
}

void draw() {
  front.display();
  shelf2.display();
  shelf1.display();
  bottom.display();
  cdPlayer.display();

  //top shelf
  Yves.display();
  Yves.hover(mouseX, mouseY, cd1);

  Uchis.display();
  Uchis.hover(mouseX, mouseY, cd2);

  Tanuki.display();
  Tanuki.hover(mouseX, mouseY, cd3);
  //bottom shelf
  Aphex.display();
  Aphex.hover(mouseX, mouseY, cd4);

  Garden.display();
  Garden.hover(mouseX, mouseY, cd5);

  Venus.display();
  Venus.hover(mouseX, mouseY, cd6);
  //window overlays
  topWindow.display();
  mainWindow.display();
  doorWindow.display();
  //yves
  cd1.select(selectX, selectY, width/2, height/2);

  //uchis
  cd2.select(selectX, selectY, width/2, height/2);

  //tanuki
  cd3.select(selectX, selectY, width/2, height/2);

  //aphex twin
  cd4.select(selectX, selectY, width/2, height/2);

  //the garden
  cd5.select(selectX, selectY, width/2, height/2);

  //venus
  cd6.select(selectX, selectY, width/2, height/2);
}

void mouseDragged() {
  Yves.drag();
  Yves.hold(mouseX, mouseY, cd1);

  Uchis.drag();
  Uchis.hold(mouseX, mouseY, cd2);

  Tanuki.drag();
  Tanuki.hold(mouseX, mouseY, cd3);

  Aphex.drag();
  Aphex.hold(mouseX, mouseY, cd4);

  Garden.drag();
  Garden.hold(mouseX, mouseY, cd5);

  Venus.drag();
  Venus.hold(mouseX, mouseY, cd6);
}

void mouseReleased() {
  Yves.deSelect(cd1);
  Uchis.deSelect(cd2);
  Tanuki.deSelect(cd3);
  Aphex.deSelect(cd4);
  Garden.deSelect(cd5);
  Venus.deSelect(cd6);
}

void mousePressed() {
  cd1.buttonClick(mouseX, mouseY);
  Yves.select(mouseX, mouseY);

  cd2.buttonClick(mouseX, mouseY);
  Uchis.select(mouseX, mouseY);

  cd3.buttonClick(mouseX, mouseY);
  Tanuki.select(mouseX, mouseY);
  
  cd4.buttonClick(mouseX, mouseY);
  Aphex.select(mouseX, mouseY);
  
  cd5.buttonClick(mouseX, mouseY);
  Garden.select(mouseX, mouseY);
  
  cd6.buttonClick(mouseX, mouseY);
  Venus.select(mouseX, mouseY);
}


void keyPressed() {
  if (keyPressed) {
    if (key == 'r' || key=='R') {
      cd1.timerReset();
      cd2.timerReset();
      cd3.timerReset();
      cd4.timerReset();
      cd5.timerReset();
      cd6.timerReset();
    }
    if (keyPressed) {
      if (key == 'x'|| key=='X') {
        cd1.playerClose();
        cd2.playerClose();
        cd3.playerClose();
        cd4.playerClose();
        cd5.playerClose();
        cd6.playerClose();
      }
    }
  }
}
