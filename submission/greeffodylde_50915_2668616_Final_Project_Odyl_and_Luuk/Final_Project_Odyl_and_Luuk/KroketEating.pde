class KroketEating {

  PImage kh0, kh1, kh2, kh3, kh4, kh5;
  float locMouseX, locMouseY;
  boolean isOver;
  boolean bite1, bite2, bite3, bite4, bite5 = false;
  boolean bite0 = true;


  KroketEating() { //Loading of the kroket images and setting the condition for where the X and y positions of the kroket windows are
    kh0 = loadImage("kroket.png");
    kh1 = loadImage("kh1.png");
    kh2 = loadImage("kh2.png");
    kh3 = loadImage("kh3.png");
    kh4 = loadImage("kh4.png");
    kh5 = loadImage("kh5.png");
    locMouseX = (width / 10 + width / 100);
    locMouseY = (2 * (height / 6) + height / 5);
  }

  void display() { //Displaying the images and one lighter blue box which gives the appearance of an open snack window
    if (isOver) {
      if (bite0) {
        image(kh0, width / 2, height / 2, width / 2, height / 1.5);
        fill(color(210, 248, 250));
        rect((width / 10 + width / 100), (3 * (height / 6) + height / 5), width/5, height/8);
      }
    }
    if (bite1) {
      image(kh1, width / 2, height / 2, width / 2, height / 1.5);
      fill(color(210, 248, 250));
      rect((width / 10 + width / 100), (3 * (height / 6) + height / 5), width/5, height/8);
    }
    if (bite2) {
      image(kh2, width / 2, height / 2, width / 2, height / 1.5);
      fill(color(210, 248, 250));
      rect((width / 10 + width / 100), (3 * (height / 6) + height / 5), width/5, height/8);
    }
    if (bite3) {
      image(kh3, width / 2, height / 2, width / 2, height / 1.5);
      fill(color(210, 248, 250));
      rect((width / 10 + width / 100), (3 * (height / 6) + height / 5), width/5, height/8);
    }
    if (bite4) {
      image(kh4, width / 2, height / 2, width / 2, height / 1.5);
      fill(color(210, 248, 250));
      rect((width / 10 + width / 100), (3 * (height / 6) + height / 5), width/5, height/8);
    }
    if (bite5) {
      image(kh5, width / 2, height / 2, width / 2, height / 1.5);
      fill(color(210, 248, 250));
      rect((width / 10 + width / 100), (3 * (height / 6) + height / 5), width/5, height/8);
    }
  }

  void update() { //Ensures nothing is displayed when the location of the mouse press does not meet the condition
    if (!isOver) {
      bite1 = false;
      bite2 = false;
      bite3 = false;
      bite4 = false;
      bite5 = false;
    }
  }

  void isOver(int x, int y) { //Checks if the location of the mouse press is within the set limits, which are within the windows
    if (x >= locMouseX - (width / 10) && x <= locMouseX + (width / 10)) {
      if (y >= locMouseY - (height / 2.55) && y <= locMouseY + (height / 2.55)) {
        isOver = true;
      }
    } else {
      isOver = false;
    }
  }

  void eatingKroket(int code) { //Progresses the eating of the kroket when the keys 'snack' are entered in order
    if (isOver) {
      if (code == 83 && !bite2 && !bite3 && !bite4 && !bite5) {
        bite0 = false;
        bite1 = true;
      }    
      if (code == 78 && bite1) {
        bite1 = false;
        bite2 = true;
      }    
      if (code == 65 && bite2) {
        bite2 = false;
        bite3 = true;
      }    
      if (code == 67 && bite3) {
        bite3 = false;
        bite4 = true;
      }    
      if (code == 75 && bite4) {
        bite4 = false;
        bite5 = true;
      }
      if (bite5 && code >= 0) {
        bite5 = false;
      }
    }
  }
}
