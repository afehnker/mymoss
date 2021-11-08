class disc {
  float xPos;
  float yPos;
  float size;
  int cdNum;
  musicPlayer musicPlayer;

  disc(float x, float y, int discNum) {
    size = 80;
    xPos = x-86;
    yPos = y-86;
    musicPlayer = new musicPlayer(500, 500, discNum);
  }

  void display() {

    //main cd circle
    pushMatrix();
    translate(xPos+size/2, yPos+size/2);
    fill(195, 199, 208);
    ellipse(0, 0, size, size);
    popMatrix();

    //hole in center
    pushMatrix();
    translate(xPos+size/2, yPos+size/2);
    fill(0);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }

  void move(float moveX, float moveY) {
    //used to click and drag the cd's to the player
    moveX = constrain(moveX, 136+size/2, 605+size/2);
    moveY = constrain(moveY, 120+size/2, 759+size/2);
    xPos = moveX-size/2;
    yPos = moveY-size/2;
  }

  void select(float selectX, float selectY, float playerX, float playerY) {
    //if the cd gets to the player it loads the entire musicplayer
    if (dist(xPos+size/2, yPos-size/2, selectX, selectY)<200 && dist(xPos+size/2, yPos-size/2, selectX+200, selectY+50)<200) {
      musicPlayer.display(playerX, playerY);
      musicPlayer.button();
      musicPlayer.timer();
    }
  }


  void buttonClick(float mX, float mY) {
    //when the mouse is clicked the player checks to see if the button was clicked
    musicPlayer.click(mX, mY);
  }

  void timerReset() {
    //resets the timer for the music
    musicPlayer.reset();
  }

  void playerClose() {
    //closes the player
    musicPlayer.quit();
  }
}
