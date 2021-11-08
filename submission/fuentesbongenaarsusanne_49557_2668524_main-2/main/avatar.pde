/*
 The avatar is created with an image.
 It can change position.
 
 Code written by Susanne Fuentes Bongenaar
*/

class Avatar {
  float avatarX;
  float avatarY;
  float avatarSpeed;
  PImage avatarImage;

  Avatar(float initX, float initY) {
    avatarX = initX;
    avatarY = initY;
    avatarSpeed = 8;
    avatarImage = loadImage("avatar.png");
  }

  void display() {
    pushMatrix();
    translate(avatarX, avatarY);
    image(avatarImage, 0, 0, 100, 300);
    popMatrix();
  }

  //update the position values when certain keys are pressed
  void move() {
    if ((key == 'a' || key == 'A') && avatarX > -5) {
      avatarX = avatarX - avatarSpeed;
    }
    if ((key == 'd' || key == 'D') && avatarX < width-95) {
      avatarX = avatarX + avatarSpeed;
    }
    if ((key == 's' || key == 'S') && avatarY < height-300) {
      avatarY = avatarY + avatarSpeed;
    }
    if ((key == 'W' || key == 'w') && avatarY > height-390) {
      avatarY = avatarY - avatarSpeed;
    }
  }
}
