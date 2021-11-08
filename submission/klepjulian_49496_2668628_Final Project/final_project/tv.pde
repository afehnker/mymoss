class Tv {
  float tvY;
  float textX, textZ;
  PImage tvshelf;
  boolean tvOn;
  int indexProgram;
  boolean canTurnOn;

  PImage[] tvProgram;



  Tv() {
    tvY = 200;
    textX = 0;
    textZ = 0;
    tvOn = false;
    canTurnOn = true;
    indexProgram = 0;
//Loading all the images to the program
    tvProgram = new PImage[10];
    tvProgram[0] = loadImage("img/black.png");
    tvProgram[1] = loadImage("img/kingjulian.jpeg");
    tvProgram[2] = loadImage("img/dvd.png");
    tvProgram[3] = loadImage("img/lecture.png");
    tvProgram[4] = loadImage("img/rocket.png");
    tvProgram[5] = loadImage("img/signal.png");
    tvProgram[6] = loadImage("img/brandweer.png");
    tvProgram[7] = loadImage("img/nature.png");
    tvProgram[8] = loadImage("img/snow.png");
    tvProgram[9] = loadImage("img/medical.png");

    imageMode(CENTER);
    tvshelf = loadImage("img/kingjulian.jpeg");
  }

  void display() {
    if (!tvOn ) {
      indexProgram = 0; //Displaying the images on the tv
    }
    if (!canTurnOn) {
      indexProgram = 1;
    }

    beginShape();
    fill(255);
    texture(tvProgram[indexProgram]);

    vertex(-190, -200, 190, 100, 0);//Top left
    vertex(190, -200, 190, 2048, 0);//Top right
    vertex(220, -200, -45, 2048, 1365);//Bottom right 
    vertex(-220, -200, -45, 100, 1365);//Bottom left
    endShape();


    pushMatrix();
    translate(textX, -180, textZ);
    rotateX(radians(-90));
    if (!tvOn) { //Only if the TV is off, the text displays
      textFont(malgun, 24);
      fill(255);
      text("Press BACKSPACE to grab remote", 0, -5, 0); //Displaying help text on the TV
      text("Then press ENTER to turn TV on", 0, 25, 0);
    }


    if (tvOn) { //make the small light bottom right of TV to green or red
      fill(#03FF2A);
    } else {
      fill(#D33A3A);
    }
    ellipse(210, 41, 5, 5);
    popMatrix();
  }
}
