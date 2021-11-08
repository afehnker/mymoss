class FrikandelEating {

  PImage fh0, fh1, fh2, fh3, fh4, fh5;
  float locMouseX, locMouseY;
  boolean isOver;
  boolean bite1, bite2, bite3, bite4, bite5 = false;
  boolean bite0 = true;


  FrikandelEating() { //Loading of the frikandel images and setting the condition for where the X and y positions of the frikandel windows are
    fh0 = loadImage("frikandel.png");
    fh1 = loadImage("fh1.png");
    fh2 = loadImage("fh2.png");
    fh3 = loadImage("fh3.png");
    fh4 = loadImage("fh4.png");
    fh5 = loadImage("fh5.png");
    locMouseX = (3.5 * width / 10 + width / 100);
    locMouseY = (2 * (height / 6) + height / 5);
  }

  void display() { //Displaying the images and one lighter blue box which gives the appearance of an open snack window
    if (isOver) {
      if (bite0) {
        image(fh0, width / 2, height / 2, width / 2, height / 1.5);
        fill(color(210, 248, 250));
        rect((3.5 * width / 10 + width / 100), ((height / 6) + height / 5), width/5, height/8);
      }
    }
    if (bite1) {
      image(fh1, width / 2, height / 2, width / 2, height / 1.5);
      fill(color(210, 248, 250));
      rect((3.5 * width / 10 + width / 100), ((height / 6) + height / 5), width/5, height/8);
    }
    if (bite2) {
      image(fh2, width / 2, height / 2, width / 2, height / 1.5);
      fill(color(210, 248, 250));
      rect((3.5 * width / 10 + width / 100), ((height / 6) + height / 5), width/5, height/8);
    }
    if (bite3) {
      image(fh3, width / 2, height / 2, width / 2, height / 1.5);
      fill(color(210, 248, 250));
      rect((3.5 * width / 10 + width / 100), ((height / 6) + height / 5), width/5, height/8);
    }
    if (bite4) {
      image(fh4, width / 2, height / 2, width / 2, height / 1.5);
      fill(color(210, 248, 250));
      rect((3.5 * width / 10 + width / 100), ((height / 6) + height / 5), width/5, height/8);
    }
    if (bite5) {
      image(fh5, width / 2, height / 2, width / 2, height / 1.5);
      fill(color(210, 248, 250));
      rect((3.5 * width / 10 + width / 100), ((height / 6) + height / 5), width/5, height/8);
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

  void eatingFrikandel(int code) { //Progresses the eating of the frikandel when the keys 'snack' are entered in order
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
