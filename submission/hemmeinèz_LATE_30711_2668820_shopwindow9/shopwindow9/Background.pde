//this class makes the background
class Background {
  float x;
  float y;
  //constructor of the background
  Background (float initX, float initY) {
    x = initX;
    y = initY;
  }

  void display () {
    //if the green button on the switch is pressed, the room is dark
    if (greenOver == true) {
      background (0, 0, 50); // dark blue of the dark room
      // if no button is pressed or the red button is pressed, the room is lit up
    } else {
      background(255, 255, 200); // light yellow of the lit up room
    }

    //draws cabinet
    fill (#7E5A26); // brown
    rect(750, 800, 400, 300);
    if (greenOver == true) {
      //if the lights are out, a discobal appears
      fill(230);
      ellipse(750, 25, 50, 50);
      line(750, 0, 750, 50);
      line(740, 6, 740, 44);
      line(760, 6, 760, 44);
      line(725, 25, 775, 25);
      line(731, 15, 769, 15);
      line(731, 35, 769, 35);
    }
  }
}
