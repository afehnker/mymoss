PImage hand;
PImage cola;
PImage logo;
PImage wood;

class Checkout {
  boolean handVisible = true;


  Checkout() {
    hand = loadImage("hand.png");
    cola = loadImage("cola.png");
    logo = loadImage("logo.png");
    wood = loadImage("wood.png");
  }
  void show() {
    rect(0, 300, 350, 300);

    if (handVisible == true) {
      image(hand, 96, 221, 156, 42);
    } else {
      image(cola, 200, 150, 150, 150 );
    }

    //check if coin is inserted when drawing
    if (dist(cX, cY, 182, 230) < 40) {
      serve();
    }

    //'Verse Patat' sign
    noStroke();
    fill(248, 213, 63);
    rect(0, 0, 100, height);
    textSize(50);
    stroke(0);
    fill(255, 0, 0);            //Red
    text("V", 40, 50);
    text("E", 40, 100);
    text("R", 40, 150);
    text("S", 40, 200);
    text("E", 40, 250);
    text("P", 40, 350);
    text("A", 40, 400);
    text("T", 40, 450);
    text("A", 40, 500);
    text("T", 40, 550);


    //Place logo at the top
    image(logo, 100, 0, 250, 125);
    image(wood, 100, 300, 250, 300);
  }



  void serve() {
    for (int i = 0; i < coin.length; i++) {
      coin[i].disappear();
    }
    delay(500);
    handVisible = false;
    delay(500);
  }
}
