class Marvel {
  Marvel(float x, float y) {
    this.x = x;
    this.y = y;
    this.scale = 1;
    this.img = loadImage("img/marvel.png"); // 106, 346
    this.overlay = loadImage("img/P4WCI.png"); // Middle of the screen
    this.width = img.width;
    this.height = img.height;
    this.intro = false;
    this.selected = false;
    amountLines = 12; // You can change this on the spot if you want
  }
  float x;
  float y;
  float scale;
  PImage img;
  PImage overlay;
  float width;
  float height;

  int amountLines;
  boolean intro;
  boolean selected;
  float ms;

  String[] binaryStrings;
  String[] stringsToAdd = {"1", "0"}; // Can't add this in the constructor because compiling reasons


  void display() {
    if (!intro) {
      pushMatrix();
      translate(x, y);
      scale(scale);
      image(img, 0, 0); // Display the poster
      popMatrix();
    } else {
      pushMatrix();
      pushStyle();
      fill(255);
      rect(0, 0, overlay.width, overlay.height); // Create a white background
      fill(0);
      textSize(overlay.height/amountLines);
      for (int i = 0; i < binaryStrings.length; i++) {
        pushMatrix();
        translate(-(i*500 + (binaryStrings[i].length() * 3)), i*(overlay.height/amountLines)); // Stagger the text slightly so it looks cooler
        text(binaryStrings[i], 0, 0);
        popMatrix();
      }
      popStyle();
      translate(overlay.width/2, overlay.height/2);
      image(overlay, 0, 0);
      popMatrix();
      intro();
    }
  }

  void intro() {
    if (selected) {
      if (!intro) { // In
        avengers.play();
        intro = true;
        ms = millis();
        binaryStrings = new String[amountLines]; // Create a new array
        for (int i = 0; i < binaryStrings.length; i++) {
          binaryStrings[i] = ""; // Fill it with empty strings
        }
      } else {
        if (millis()-ms > 6000) {
          intro = false;
        } else {
          for (int i = 0; i < binaryStrings.length; i++) {
            binaryStrings[i] = binaryStrings[i] + stringsToAdd[floor((float)(Math.random()*2))]; // Add a 1 or 0 to the string
          }
        }
      }
    }
  }

  void isSelected(float mX, float mY) { // Selection box is slightly bigger than the image, for ease of use and ease of programming
    if (!intro) { // Shouldn't affect much but it's a failsafe
      if ((mX > x - width && mX < x + width) && (mY > y - height && mY < y + height)) {
        scale = 1.2; // Become bigger
        selected = true;
      } else {
        scale = 1; // Go normal size
        selected = false;
      }
    }
  }
}
