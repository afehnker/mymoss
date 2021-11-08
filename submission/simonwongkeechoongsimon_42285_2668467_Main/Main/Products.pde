class Products {
  int x;
  int y;

  PImage kruidnotenNaturel;
  PImage kruidnotenGreen;
  PImage kruidnotenRed;
  PImage kruidnotenWhite;
  PImage kruidnotenUnicorn;
  PImage kruidnotenColored;
  PImage kruidnotenMix;
  PImage kruidnotenChocolate;
  PImage shelf;
  PImage wallShelf;

  Products(int xPos, int yPos) {
    this.x = xPos;
    this.y = yPos;

    //load all the different products and resize them
    kruidnotenNaturel = loadImage("kruidnoten-500gr.png");
    kruidnotenGreen = loadImage("pistache-white-choc-kruidnoten.png");
    kruidnotenRed = loadImage("raspberry-cheesecake-kruidnoten.png");
    kruidnotenWhite = loadImage("full-white-kruidnoten.png");
    kruidnotenUnicorn = loadImage("unicorn-kruidnoten.png");
    kruidnotenColored = loadImage("coloured-chocolate.png");
    kruidnotenMix = loadImage("luxe-mix-kruidnoten.png");
    kruidnotenChocolate = loadImage("appeltaart-kruidnoten.png");
    shelf = loadImage("shelf.png");
    wallShelf = loadImage("wallshelf.png");

    kruidnotenNaturel.resize(160, 160);
    kruidnotenGreen.resize(120, 120);
    kruidnotenMix.resize(160, 160);
    kruidnotenColored.resize(160, 160);
    kruidnotenRed.resize(160, 160);
    kruidnotenChocolate.resize(120, 120);
    kruidnotenUnicorn.resize(120, 120);
    kruidnotenWhite.resize(120, 120);
    wallShelf.resize(600, 280);
    shelf.resize(1000, 1000);
  }

  void display() {
    pushMatrix();
    translate(x, y);

    //the three wall shelves
    wallShelf(70, 0);
    wallShelf(700, 0);
    wallShelf(-560, 0);

    //the right shelf
    image(shelf, +300, -150);

    //the first row of products on the right shelf
    for (int i = 0; i<7; i++) {
      image(kruidnotenNaturel, +550+i*50, +20+i*2);
    }

    //the second row of products on the right shelf
    for (int i = 0; i<7; i++) {
      image(kruidnotenMix, +550+i*50, +200+i*3);
    }

    //the third row of products on the rightshelf
    for (int i = 0; i<7; i++) {
      image(kruidnotenColored, +550+i*50, +380+i*4);
    }

    //the fourth row of products on the right shelf
    for (int i = 0; i<7; i++) {
      image(kruidnotenRed, +550+i*50, +540+i*6);
    }

    //the black desk
    fill(0, 0, 0);
    stroke(100, 100, 100);
    rect(-100, +350, 500, 190);
    quad(-100, +350, -100, +540, -150, +450, -150, +300);
    quad(-100, +350, -150, +300, +340, +300, +400, +350);

    //the last row of pepernoten on the desk (when you start from the left)
    for (int i = 0; i<5; i++) {
      image(kruidnotenUnicorn, +90+i*7, +200+i*6);
    }

    //the fifth row of pepernoten on the desk (when you start from the left)
    for (int i = 0; i<5; i++) {
      image(kruidnotenGreen, +40+i*7, +200+i*6);
    }

    //the fourth row of pepernoten on the desk (when you start from the left)
    for (int i = 0; i<5; i++) {
      image(kruidnotenWhite, -10+i*7, +200+i*6);
    }

    //the third row of pepernoten on the desk (when you start from the left)
    for (int i = 0; i<5; i++) {
      image(kruidnotenChocolate, -60+i*7, +200+i*6);
    }

    //the second row of pepernoten on the desk (when you start from the left)
    for (int i = 0; i<5; i++) {
      image(kruidnotenUnicorn, -110+i*7, +200+i*6);
    }

    //the first row of pepernoten on the desk (when you start from the left)
    for (int i = 0; i<5; i++) {
      image(kruidnotenGreen, -160+i*7, +200+i*6);
    }

    popMatrix();
  }

  void wallShelf(int xPos, int yPos) {
    pushMatrix();
    translate(xPos, yPos);

    //the left wall shelf
    image(wallShelf, -350, -40);

    //the pepernoten on the first wall shelf
    for (int i = 0; i<10; i++) {
      image(kruidnotenUnicorn, -350+i*50, -80);
    }

    //the pepernoten on the second wall shelf
    for (int i = 0; i<10; i++) {
      image(kruidnotenChocolate, -350+i*50, 0);
    }

    //the pepernoten on the third wall shelf
    for (int i = 0; i<10; i++) {
      image(kruidnotenWhite, -350+i*50, +70);
    }
    popMatrix();
  }
}
