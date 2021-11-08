Vending vending;
Checkout checkout;
Popup popup;
Pocket pocket;
Wallet wallet;
Bill bill;

SoundFile file;

void setup() {
  frameRate(250);
  file = new SoundFile(this, "coins.mp3");

  size(800, 600);
  vending = new Vending();
  checkout = new Checkout();
  popup = new Popup();
  pocket = new Pocket();

  wallet = new Wallet();
  bill = new Bill();
}


void draw() {
  background(100);
  vending.show();
  checkout.show();

  wallet.show();
  popup.show();
}


void mouseClicked() {

  //Close popup button
  popup.closeBtn();

  //Info button click
  vending.infoBtnClick();
}

void mousePressed() {
  for (int i = 0; i < coin.length; i++) {
    coin[i].clicked();
  }
  bill.clicked();
}

void mouseDragged() {
  for (int i = 0; i < coin.length; i++) {
    coin[i].dragged();
  }
  bill.dragged();
}

void mouseReleased() {
  for (int i = 0; i < coin.length; i++) {
    coin[i].released();
  }
  bill.released();
}
