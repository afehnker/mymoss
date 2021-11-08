Machine machine1;
Machine machine2;
Lamp lamp;
Background background;
Lamp[] lamps = new Lamp [60];
Coin[] coins = new Coin[200];
//Lamp[] lamps2 = new Lamp [40];
//Lamp[] lamps3 = new Lamp [40];


void setup() {
  size(1600, 900, P2D);
  background = new Background();
  machine1 = new Machine(50, 150);
  machine2 = new Machine(1150, 150);
  for (int i = 0; i <lamps.length; i++) {
    lamps[i] = new Lamp(i*27);
  }
  for (int a = 0; a <coins.length; a++) {
    if (a >= 100 ) {
      coins[a] = new Coin(int(random(0, width)), 0);
    } else {
      coins[a] = new Coin(int(random(0, width)), 45);
    }
  }
}

void draw() {
  //machine2.print();
  background.displayfloor();
  machine2.slots();
  machine1.slots();
  background.displaywall();
  machine1.displaymachine();
  machine2.displaymachine();

  for (int i = 0; i <lamps.length; i++) {
    if (i >= 60 ) {
      lamps[i].lampColor= color(#f72585);
    } else if ( i>50) {
      lamps[i].lampColor= color(#b5179e);
    } else if (i>40) {
      lamps[i].lampColor= color(#7209b7);
    } else if (i>30) {
      lamps[i].lampColor= color(#480ca8);
    } else if (i>20) {
      lamps[i].lampColor= color(#3a0ca3);
    } else if (i>10) {
      lamps[i].lampColor= color(#4361ee);
    } else if (i>=0) {
      lamps[i].lampColor= color(#4cc9f0);
    }
    lamps[i].display();
    lamps[i].move(width);
  }

  for (int a = 0; a <coins.length; a++) {
    if (machine1.win||machine2.win) {
      coins[a].display();
      coins[a].update(height);
    } else if (!machine1.win||!machine2.win) {
      coins[a].coinPosY = 0;
    }
  }
}

  void mousePressed() {
    machine1.changewin(mouseX, mouseY);
    machine2.changewin(mouseX, mouseY);
    //machine1.incUpdate(mouseX, mouseY);
    //machine2.incUpdate(mouseX, mouseY);
    machine1.mouseOver(mouseX, mouseY);
    machine2.mouseOver(mouseX, mouseY);
  }
