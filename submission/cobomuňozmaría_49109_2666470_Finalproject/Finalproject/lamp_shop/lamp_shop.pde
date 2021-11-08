//Gijs de Waal & María Cobo
//Final Programming project
//Lampen paleis, Enschede
//This program contains sound files. To play them, go to Sketch → Import Library→ Add Library → search and select “Sound" → and click ↓Install.
//And remember to turn up the volume ;)

Remote remote;
Switch swit;
Hanglamp[] hangingLamp = new Hanglamp[11];

import processing.sound.*;

void setup() {
  size(900, 500);
  remote = new Remote(45, 321);
  swit= new Switch(750, 300);
  for (int i =0; i<10; i++) {
    hangingLamp[0] = new Hanglamp(new PVector(90, 0), 120);
    hangingLamp[1] = new Hanglamp(new PVector(100, 0), 220);
    hangingLamp[2] = new Hanglamp(new PVector(120, 0), 80);
    hangingLamp[3] = new Hanglamp(new PVector(140, 0), 150);
    hangingLamp[4] = new Hanglamp(new PVector(175, 0), 180);
    hangingLamp[5] = new Hanglamp(new PVector(490, 0), 150);
    hangingLamp[6] = new Hanglamp(new PVector(555, 0), 100);
    hangingLamp[7] = new Hanglamp(new PVector(620, 0), 150);
    hangingLamp[8] = new Hanglamp(new PVector(685, 0), 100);
    hangingLamp[9] = new Hanglamp(new PVector(750, 0), 150);
    hangingLamp[10] = new Hanglamp(new PVector(815, 0), 125);
  }
}

void draw() {
  remote.display();
  swit.display();
  for (int i = 0; i < 10; i++) {
    hangingLamp[i].display();
  }

    //text
  fill(0, 0, 0);
  text ("Press 'b' to open the back door", 300, 250);
  text ("Please, be careful. It's windy outside!", 300, 270);
}

void mouseClicked() {
  remote.changeColor(mouseX, mouseY);
  swit.turn(mouseX, mouseY);
  for (int i = 0; i < 10; i++) {
    hangingLamp[i].light(mouseX, mouseY);
  }
}

void keyPressed() {
    //when you press 'b' lamps move and it plays the wind sound
  if (key == 'b') {
    hangingLamp[1].sound();
    for (int i = 0; i < 10; i++) {
      hangingLamp[i].movement();
    }
  }
}
