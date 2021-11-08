boolean showBill = false;


class Wallet {
  PImage wallet;

  Wallet() {
    wallet = loadImage("wallet.png");
  }

  void show() {
    image(wallet, 720, 520, 50, 50);

    if (showBill == true) {
      bill.show(750, 550);
    }
  }
  void clicked() {
    if (mouseX > 750 & mouseY > 500);
    showBill = true;
  }
}
