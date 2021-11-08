class Button {

  float buttonHeightClicked;
  boolean buttonPressed;
  int index;
  float buttonX, buttonY, buttonZ;

  Button(int indx) {
    buttonHeightClicked = 0;
    index = indx;
    buttonPressed = false;

    textAlign(CENTER);
  }

  void display(float initX, float initY, int numberSides, float buttonRadius, float buttonHeight, color buttonColor) {

    buttonX = remote.remoteX - 40 + initX;
    buttonY = remote.remoteY - 80 + initY; 
    buttonZ = remote.remoteZ + 10 + buttonHeightClicked;

    pushMatrix();
    rotateZ(radians(remote.remoteRotateZ));
    rotateX(radians(remote.remoteRotateX));

    pushMatrix();
    translate(buttonX, buttonY, buttonZ);

    fill(buttonColor, 240);

    float angle = 360 / numberSides;
    float halfHeight = buttonHeight / 2;

    // draw top of the tube
    beginShape();
    for (int i = 0; i < numberSides; i++) {
      float x = cos( radians( i * angle ) ) * buttonRadius;
      float y = sin( radians( i * angle ) ) * buttonRadius;
      vertex( x, y, -halfHeight);
    }
    endShape(CLOSE);

    // draw bottom of the tube
    beginShape();
    for (int i = 0; i < numberSides; i++) {
      float x = cos( radians( i * angle ) ) * buttonRadius;
      float y = sin( radians( i * angle ) ) * buttonRadius;
      vertex( x, y, halfHeight);
    }
    endShape(CLOSE);

    // draw sides
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < numberSides + 1; i++) {
      float x = cos( radians( i * angle ) ) * buttonRadius;
      float y = sin( radians( i * angle ) ) * buttonRadius;
      vertex( x, y, halfHeight);
      vertex( x, y, -halfHeight);
    }
    endShape(CLOSE);

    popMatrix();

    if (index == 9) { 
      noFill();
      stroke(240);
      strokeWeight(3);
      pushMatrix();
      translate( buttonX, buttonY, buttonZ + 10.1);
      arc(0, 0, 15, 15, radians(-75), radians(245));

      noStroke();
      fill(240);
      rect(0, -5, 1, 10);
      popMatrix();
    }

    if (index<9) {
      pushMatrix();
      translate( buttonX, buttonY, buttonZ);
      fill(255, 0, 0);
      textSize(13);
      text(index + 1, 0, 5, 10.1);
      popMatrix();
    }

    popMatrix();
  }

  void buttonPress(int index, char whichKey) { //If button is pressed, using the value and adding plus one due to the array starting at 0
    if (remote.remoteUse) {
      if (whichKey == index + '1') {
        buttons[index].buttonHeightClicked = -4;
        buttonPressed = true; //Button pressed
        tv.indexProgram = index + 1; //Loading the image
      }

      if (whichKey == ENTER && tv.canTurnOn) { //If key is enter TV can turn on
        buttons[9].buttonHeightClicked = -4;
        buttonPressed = true;
        tv.tvOn = !tv.tvOn;
        tv.canTurnOn = false;
      }
    }
  }

  void buttonUp(int index, char whichKey) { 
    if (remote.remoteUse) { //If remote is already up, use the key for a channelswitch
      if (whichKey == index + '1') {
        buttons[index].buttonHeightClicked = 0;
        buttonPressed = false;
      }

      if (whichKey == ENTER) { //If key is ENTER TV can turn off or on
        buttons[9].buttonHeightClicked = 0;
        buttonPressed = false;
        tv.canTurnOn = true;
      }
    }
  }
}
