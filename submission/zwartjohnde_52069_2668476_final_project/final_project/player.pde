class musicPlayer {

  float xPos;
  float yPos;
  float timeElapse;
  playSymbol start;
  pauseSymbol stop;
  boolean isClicked = false;
  float playX;
  float playY;
  SoundFile song;
  PImage albumCover;
  //loads all song names into an array
  String[] songNames = {"song1.mp3", "song2.mp3", "song3.mp3", "song4.mp3", "song5.mp3", "song6.mp3"};
  //loads all imagenames into an array
  String[] coverNames = { "cover1.jpg", "cover2.png", "cover3.jpg", "cover4.jpg", "cover5.jpg", "cover6.jpg"};
  boolean playable = false;
  musicPlayer(float x, float y, int songNum) {
    xPos = x;
    yPos = y;
    playX = x;
    playY = y;
    start = new playSymbol();
    stop = new pauseSymbol(xPos, yPos);
    song = new SoundFile(final_project.this, songNames[songNum], false);
    albumCover = loadImage(coverNames[songNum]);
    timeElapse = -360;
  }

  void display(float x, float y) {
    xPos = x;
    yPos = y;
    fill(255);
    //albumcover goes here
    pushMatrix();
    translate(xPos, yPos);
    albumCover.resize(500, 500);
    image(albumCover, -250, -350);
    popMatrix();

    //play/pause button
    pushMatrix();
    translate(xPos, yPos);
    noFill();
    stroke(255);
    strokeWeight(3);
    ellipse(0, 195, 80, 80);
    popMatrix();

    //timeline
    pushMatrix();
    translate(xPos, yPos);
    line(-360, 250, 360, 250);
    popMatrix();

    //timeindicator
    stroke(255, 0, 0);
    pushMatrix();
    translate(xPos, yPos);
    line(-360, 250, timeElapse, 250);
    ellipse(timeElapse, 250, 10, 10);
    popMatrix();
    println(playable);
    stroke(255);
  }
  //If the button is pressed it moves the play button out of frame and replaces it with a pause button
  //It also marks the file as playable as to not have any sound files play at the same time
  void button() {
    if (isClicked == true) {
      playX=1200;
      playY = 1200;
      stop.display();
      playable = true;
      if (!song.isPlaying() && playable) { 
        song.play();
      }
    } else {
      playX = xPos;
      playY = yPos;
      start.display(playX, playY);
      if (song.isPlaying()) {
        song.pause();
      }
    }
  }

  void click(float mX, float mY) {
    if (dist(xPos, yPos+195, mX, mY) < 40) {
      isClicked = !isClicked;
    }
  }

  void reset() {
    if (playable) {
      timeElapse = -360;
      song.jump(0);
    }
  }

  void timer() {
    float duration;
    duration = song.duration()*60;
    if (isClicked && playable) {
      timeElapse = constrain(timeElapse, -360, 360);
      timeElapse = (720/duration)+timeElapse;
    }
  }

  void quit() {
    xPos = 1500;
    yPos = 1500;
    song.pause();
    song.jump(0);
    timeElapse = -360;
    song.stop();
    playable = false;
  }
}
