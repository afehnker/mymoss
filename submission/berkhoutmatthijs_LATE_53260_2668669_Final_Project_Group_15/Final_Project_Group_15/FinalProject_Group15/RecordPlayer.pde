class RecordPlayer {

  // declarations for x,y,radius of the area where planets can be in
  float recordPlayerX, recordPlayerY, recordPlayerAreaRadius;

  // x,y,radius for the play and pause button
  float xPlayButton, yPlayButton, xPauseButton, yPauseButton, radiusPauseButton, radiusPlayButton;

  // booleans from the methods inDiskArea, onDisk, isPlaying
  boolean inDiskArea, onDisk, isPlaying;

  // construct record player and ask for attributes x and y
  RecordPlayer(float initX, float initY) {
    recordPlayerX = initX;
    recordPlayerY = initY;
    recordPlayerAreaRadius = 200;

    // initialize values for the playbutton
    xPlayButton = recordPlayerX - 100;
    yPlayButton = recordPlayerY + 250;
    radiusPlayButton = 50;

    // initialize values for the pausebutton
    xPauseButton = recordPlayerX + 100;
    yPauseButton = recordPlayerY + 250;
    radiusPauseButton = 50;

    // boolean isPlaying to know if the music "was" playing or not
  }

  void display() {
    pushMatrix();
    translate(recordPlayerX, recordPlayerY);

    // draw blue circle as disk area, where you can drag the planets
    noFill();
    stroke(0, 200, 255);
    strokeWeight(3);
    circle(0, 0, recordPlayerAreaRadius*2);
    popMatrix();

    // draw the play button
    noStroke();
    fill(0, 100, 0);
    circle(xPlayButton, yPlayButton, radiusPlayButton);
    fill(0);
    circle(xPlayButton, yPlayButton, radiusPlayButton/2);

    // draw the pause button
    fill(100, 0, 0);
    circle(xPauseButton, yPauseButton, radiusPauseButton);
    fill(0);
    rectMode(CENTER);
    rect(xPauseButton, yPauseButton, radiusPauseButton/2, radiusPauseButton/2);
  }

  // method uses mouseX and mouseY to check if the mouse in on playbutton with its own method mouseOnPlayButton and if true, planet is going to rotate and playMusic function is called
  void playButtonClicked(float mousePosX, float mousePosY, Planet planet) {
    if (mouseOnPlayButton(mousePosX, mousePosY)) {
      planet.speed = 1;
      if (!isPlaying || onDisk) {
        isPlaying = true;
        planet.song.play();
      }
    }
  }

  // method uses mouseX and mouseY to check if the mouse is on the pausebutton with its own boolean method, if true: planet not going to rotate and music is paused.
  void pauseButtonClicked(float mousePosX, float mousePosY, Planet planet) {
    if (mouseOnPauseButton(mousePosX, mousePosY)) {
      planet.speed = 0;
      if (isPlaying) {
        isPlaying = false;
        planet.song.pause();
      }
    }
  }

  // this non-void method gives back a true value if the planet is in the record area (blue circle).
  boolean inDiskArea(Planet planet) {
    if (dist(planet.planetX, planet.planetY, recordPlayerX, recordPlayerY) <= recordPlayerAreaRadius) {
      inDiskArea = true;
    } else {
      inDiskArea = false;
    }
    return inDiskArea;
  }

  // non-void method gives true value if planet is on the disk (exact coordinates of center of blue circle)
  boolean onDisk(Planet planet) {
    boolean onDisk;
    if (dist(planet.planetX, planet.planetY, recordPlayerX, recordPlayerY) < 1) {  // dist equal to less than one, because 0 wouldnt work, I think of the 3D perspective.
      onDisk = true;
    } else {
      onDisk = false;
    }
    return onDisk;
  }

  // non-void method returns true if mouse is over the play-button
  boolean mouseOnPlayButton(float mousePosX, float mousePosY) {
    boolean onButton;
    if (dist(mousePosX, mousePosY, xPlayButton, yPlayButton) < radiusPlayButton) {
      onButton = true;
    } else {
      onButton = false;
    }
    return onButton;
  }

  // non-void method returns true if mouse is over the pause-button
  boolean mouseOnPauseButton(float mousePosX, float mousePosY) {
    boolean onButton;
    if (dist(mousePosX, mousePosY, xPauseButton, yPauseButton) < radiusPlayButton) {
      onButton = true;
    } else {
      onButton = false;
    }
    return onButton;
  }
}
