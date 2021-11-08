class Remote {
 
  float remoteX, remoteY, remoteZ;
  float remoteGoneY;
  float remoteRotateZ, remoteRotateX;
  float remoteWidth, remoteLength, remoteHeight;
  int numberSidesGrip;
  float radiusGrip;
  float lengthGripRemote;
  boolean remoteUse;


  Remote() {
    remoteX = 0;
    remoteGoneY = 500;
    remoteY = remoteGoneY;
    remoteZ = 0;
    remoteRotateZ = 0;
    remoteWidth = 120;
    remoteLength = 300;
    remoteHeight = 30;
    numberSidesGrip = 30;
    radiusGrip = remoteWidth / 2;
    lengthGripRemote = remoteLength / 3;
    remoteUse = false;
  }

  void display() { 
    
    pushMatrix();
    //rotation for the remote
    rotateZ(radians(remoteRotateZ));
    rotateX(radians(remoteRotateX));
    
    //laserbeam from the remote to the tv 
    for (int i = 0; i < buttons.length; i ++) {
      if (buttons[i].buttonPressed && remoteUse) {
        stroke(255, 50, 50);
        strokeWeight(5);
        line(remoteX, remoteY, remoteZ, remoteX, -330, remoteZ);
      }
    }
    
    //appearance of the remote
    noStroke();
    fill(70);

    pushMatrix();
    //location of the remote
    translate(remoteX, remoteY, remoteZ);
    box(remoteWidth, remoteLength, remoteHeight);
    popMatrix();
    
    //round underside of the remote
    scale(1, 1, 0.25);
    rotateX(radians(-90));
    translate(remoteX, remoteZ + 60, remoteY + remoteLength /3);
    float angle = 360 / numberSidesGrip;
    float halfHeight = lengthGripRemote / 2;

    //draw top of the cylinder
    beginShape();
    for (int i = 0; i < numberSidesGrip; i++) {
      float x = cos( radians( i * angle ) ) * radiusGrip;
      float y = sin( radians( i * angle ) ) * radiusGrip;
      vertex( x, y, -halfHeight);
    }
    endShape(CLOSE);

    // draw bottom of the cylinder
    beginShape();
    for (int i = 0; i < numberSidesGrip; i++) {
      float x = cos( radians( i * angle ) ) * radiusGrip;
      float y = sin( radians( i * angle ) ) * radiusGrip;
      vertex( x, y, halfHeight);
    }
    endShape(CLOSE);

    // draw sides
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < numberSidesGrip + 1; i++) {
      float x = cos( radians( i * angle ) ) * radiusGrip;
      float y = sin( radians( i * angle ) ) * radiusGrip;
      vertex( x, y, halfHeight);
      vertex( x, y, -halfHeight);
    }
    endShape(CLOSE);

    popMatrix();
  }

  void rotateRemote(float mx, float my) {
    //remote rotates by changing the position of the mouse
    remoteRotateZ = (width / 2 - mx) / 10;
    remoteRotateX = (height / 2 - my) / 10;
  }

  void remoteGrab(char whichKey) {
    //if BACKSPACE is pressed the remote will appear or dissappear
    if (whichKey == BACKSPACE && remoteUse == false) {
      remoteY = 100;
      remoteUse = true;
    } else if (whichKey == BACKSPACE && remoteUse) {
      remoteY = remoteGoneY;
      remoteUse = false;
    }
  }
}
