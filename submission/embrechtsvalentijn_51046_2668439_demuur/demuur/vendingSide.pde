class Vending {
  //Pocket pocket;
  Pocket [] pocket = new Pocket[4];
  Exchanger exchanger;
  Bricks bricks;

  int xGlobal;
  float textRotation = 270;
  float textHeight = 80;
  int rotateDirection = 0;

  Vending() {
    exchanger = new Exchanger();
    bricks = new Bricks();
    for (int i = 0; i < pocket.length; i++) {
      pocket[i] = new Pocket();
    }
  }

  void show() {
    //pocket = new Pocket();

    fill(248, 210, 62);            //Yellow

    rect(350, 0, 450, 100);


    //Metallic under part
    fill(196, 202, 206);
    rect(350, 400, 450, 200);

    //Machine 1 (Frikandel)
    vendingEntity(350, 180, 1);

    //Machine 2 (Kroket)
    vendingEntity(500, 180, 2);

    //Coin exchanger
    exchanger.show(650, 100);
  }

  void vendingEntity(int x, int pocketHeight, int dish) {
    //Vending machine 1
    textSize(20);
    fill(196, 202, 206);
    rect(x, 100, 150, 300);
    rect(x + 15, 115, 120, 285);
    fill(248, 213, 63);            //Yellow
    rect(x + 15, 115, 120, 50);
    fill(196, 202, 206);
    rect(x + 15, 165, 120, 15);
    rect(x + 105, 180, 30, 220);

    fill(255, 0, 0);            //Red

    //Generate title dish text
    if (dish == 1) {
      text("Frikandel", x + 35, 145);
    } else if (dish == 2) {
      text("Kroket", x + 50, 145);
    }

    //Place cubbies (pockets) in there
    fill(196, 202, 206);
    for (int i = 0; i < pocket.length; i++) {
      pocket[i].show(x + 15, pocketHeight, dish);
      pocketHeight = pocketHeight + 55;
    }

    //Info button
    fill(255);
    noStroke();
    ellipse(x + 123, 153, 17, 17);
    fill(0);
    stroke(0);
    textSize(15);
    text("i", x + 121.3, 157.5);

    fill(196, 202, 206);
    bricks.show(500, 500);
    bricks.show(750, 450);

    eetSign();
  }
  void infoBtnClick() {

    if (dist(mouseX, mouseY, 350 + 123, 153) < 15) {
      popupVisible = true;
      popupDish = 1;
    }
    if (dist(mouseX, mouseY, 500 + 123, 153) < 15) {
      println("openin");
      popupVisible = true;
      popupDish = 2;
    }
  }
  void eetSign() {
    //"eet smakelijk" sign

    textSize(30);
    pushMatrix();
    translate(375, textHeight);
    rotate(textRotation);
    noStroke();
    fill(148, 23, 25);
    text("EET SMAKELIJK", 0, 0);
    rect(0, 5, 200, 5);
    popMatrix();
    if (textRotation <= 270) {
      rotateDirection = 0;
    }

    if (textRotation >= 270.5) {
      rotateDirection = 1;
    }
    if (rotateDirection == 0) {
      textRotation += 0.01;
      textHeight -= 1.05;
    }
    if (rotateDirection == 1) {
      textRotation -= 0.01;
      textHeight += 1.05;
    }
  }
}
