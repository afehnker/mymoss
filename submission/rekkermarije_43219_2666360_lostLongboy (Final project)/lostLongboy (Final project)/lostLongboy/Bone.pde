/*
displayBone makes a single bone for the array.
 pickBone detects if you are near a bone and if so makes a sound and increases the speed with which the dog moves
 */

class Bone {
  float boneX;
  float boneY;
  int boneSizeX;
  int boneSizeY;
  int boneRadius = 12;
  color boneColor = #D8CE95;

  Bone(float x, float y) {
    boneX = x;
    boneY = y;
    boneSizeX = 30;
    boneSizeY = 10;
  }

  void displayBone() {
    fill(boneColor);
    rectMode(CENTER);
    ellipseMode(CENTER);

    //Make a beautifull bone
    rect(boneX, boneY, boneSizeX, boneSizeY);
    ellipse(boneX - 15, boneY - 4, boneRadius, boneRadius);
    ellipse(boneX - 15, boneY + 4, boneRadius, boneRadius);
    ellipse(boneX + 15, boneY - 4, boneRadius, boneRadius);
    ellipse(boneX + 15, boneY + 4, boneRadius, boneRadius);

    rectMode(CORNER);
  }

  //detect if Longboy is in reach of a bone, so he can eat it
  void pickBone(float dogXpos, float dogYpos, Dog teckel) {
    if (dogXpos >=  boneX-30 && dogXpos <=  boneX + 30 && dogYpos >=  boneY-25 && dogYpos <=  boneY +25) {
      boneX = -100;
      eating.play();
      teckel.speedUp();
    }
  }
}
