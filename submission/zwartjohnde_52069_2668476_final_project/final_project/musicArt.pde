class musicArt {
  float xPos;
  float yPos;
  float size;
  float coverNum;
  float mX;
  float mY;
  boolean hover = false;
  boolean isDragging = false;
  boolean isHeld = false;
  boolean isSelected = false;
  disc d;
  //creates a PImage
  PImage albumCover;
  //array storing all  names
  String[] coverNames = { "cover1.jpg", "cover2.png", "cover3.jpg", "cover4.jpg", "cover5.jpg", "cover6.jpg"};
  
  musicArt(float x, float y, int coverNum) {
    size = 90;
    xPos = x-size;
    yPos = y-size;
    //loads the imagename from the array into the PImage
    albumCover = loadImage(coverNames[coverNum]);
  }

  void display() {
    //resizes image to fir covers in the shopwindow
    int coverSize = int(size);
    albumCover.resize(coverSize, coverSize);
    image(albumCover, xPos, yPos);
  }

  void hover(float mX, float mY, disc d) {

    // if the mouse is over the cover show cd
    if (dist(xPos+size/2, yPos+size/2, mX, mY) < size/2) {
      hover = true;
      d.display();
    } else {
      hover = false;
    }
  }

  void select(float mX, float mY) {
    //if mouse is pressed over cd mark as selected
    if (dist(xPos+size/2, yPos+size/2, mX, mY) < size/2) {
      isSelected = true;
      println(hover, isHeld, isDragging, isSelected);
    }
  }

  void hold(float mX, float mY, disc d) {

    //If the cd is dragged while selectd it is held
    if (isDragging && isSelected) {
      d.move(mX, mY);
      d.display();
    } // if it is let go it will return to default pos.
    else {
      d.move(xPos+size/2, yPos+size/2);
    }
  }

  void drag () {
    isDragging = true;

    // fixing issue of cd moving to mouse after hovering once then clicking
    if (dist(xPos+size/2, yPos+size/2, mX, mY) < size/2) {
      hover = false;
      isHeld = false;
    }
  }
  
  void deSelect(disc d) {
    //sets all values back to the default
    isHeld = false;
    isSelected = false;
    isDragging = false;
    hover = false;
    d.move(xPos+size/2, yPos+size/2);
  }
}
