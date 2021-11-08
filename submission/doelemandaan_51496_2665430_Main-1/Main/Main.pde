//Van Delft shop window by Simon Wong Kee Choong and Daan Doeleman
//
//To control the big gray shop window “door”, a user can press the “w” key to open or close it.
//In order to light up the candles, logos and displays in the shop, the user should press the “s” key. If you press “s” again, everything will go off.
//To change the image on the TV screen / display, a user should press the “a” or “b” key to switch between pictures a and b.
//To start the pepernoten game, the user can press “shift” to display the game. If you press “shift” again, the game will close.
//
//Sources (images):
//https://www.vandelftchocolates.nl/nl/pepernoten/
//https://www.jutexpackaging.com/webwinkel/artikel/102-10013/jute-zakken-sint-pakket.html
//https://www.mamaliefde.nl/4-cadeautjes-regel-sinterklaas/
//https://nl.depositphotos.com/stock-photos/sinterklaas-eten.html
//https://www.sintgennep.nl/
//https://nl.vecteezy.com/png/1198619-geschenk
//https://www.simtric.net/SOFT/Arts/
//https://www.vectorstock.com/royalty-free-vector/business-open-closed-sign-shop-door-signs-boards-vector-23899356
//https://www.emojipng.com/preview/5216790
//https://www.pngwing.com/en/free-png-ywaki/download

ShopWindow shopWindow1;
Game game;

void setup() {
  size(2500, 1600, P2D);
  shopWindow1 = new ShopWindow(width/2, height/2);
  game = new Game();
}

void draw() {
  shopWindow1.display();
  shopWindow1.update();
  game.display();
}

void mouseMoved() {
  game.update(mouseX, mouseY);
}

void keyPressed() {
  if (key == 'w') {
    shopWindow1.open();
  }
  if (key == 'a') {
    shopWindow1.changeDisplayBtoA();
  }
  if (key== 'b') {
    shopWindow1.changeDisplayAtoB();
  }
  if (key == 's') {
    shopWindow1.lightUp();
  }
  if (keyCode == SHIFT) {
    game.showGame();
  }
}
