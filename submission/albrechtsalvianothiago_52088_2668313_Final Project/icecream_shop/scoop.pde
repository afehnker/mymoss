float maxheight = 625;
class Scoop { 
  float xPos;
  float yPos;
  int flavour;
  boolean dragging;
  boolean stick;
  float gravity = 1;
  float speed;

  Scoop(int flavourIndex, float scoopPosX, float scoopPosY) {
    xPos = scoopPosX;
    yPos = scoopPosY;
    flavour = flavourIndex;
  }

  void display() {
    if ((xPos < 715 || xPos > 790) || yPos > 638) {
      tint(255, 175);
    }  
    image(scoop_flavours[flavour], xPos, yPos, 193, 166);
    noTint();
    if (!mousePressed) {
      if (yPos > 1000) {
        scoops.remove(this);
      } else {
        if (yPos < maxheight || (xPos < 715 || xPos > 790) || yPos > 638) {
          speed = speed + gravity;
          yPos = yPos + speed;
        } else if (!stick) {
          stick = true;
          yPos = maxheight; // Ensure the scoop yPos will be maxheight. Useful if the scoop is falling at higher speeds and when placing one scoop over the other
          maxheight = maxheight - 75;
        }
      }
    }
    if ((mouseX > xPos-(193/2) && mouseX < xPos+(193/2) && mouseY > yPos-((166/2.5)/2) && mouseY < yPos+((166/2.5)/2)) || dragging) {
      if (mousePressed && !stick) {
        xPos = mouseX;
        yPos = mouseY;
        dragging = true; // Once mouse pressed, this makes the main if-statement always true until mouse is released, ensuring the scoop will always follow mouse until released.
      } else {
        dragging = false; // Prevent moving scoops once they're placed
      }
    }
    if (keyPressed && key=='x') {
      scoops.remove(this);
      maxheight = 625;
    }
  }
}
