/* this is the class of the Radio, the radio can play two diffrent songs. By clicking on the play symbol (square with
 triangle in it), a song will play. If you click on the stop symbol (square with square in it) the song will stop playing.
 If you click the play symbol after stopping the previous song, the other (of the 2 songs) will sound.*/

class Radio {
  int xRadio;
  int yRadio;
  int xRadioSize;
  int yRadioSize;
  int xButton;
  int yButton;
  int xRecButton;
  int yRecButton;
  boolean file1playing = false; //needed for not playing multiple songs interchangeably
  boolean file2playing = false; //needed for not playing multiple songs interchangeably
  boolean radioOn= false;
  boolean playSong1 = true; // ensures that the 2 songs alternate

  Radio(int initXRadio, int initYRadio, int initxRadioSize, int inityRadioSize) {
    xRadio = initXRadio;
    yRadio = initYRadio;
    xRadioSize = initxRadioSize;
    yRadioSize = inityRadioSize;
  }

  void display() {
    pushMatrix();
    translate(xRadio, yRadio-15);
    fill(215, 172, 98);
    rect(0, 0, xRadioSize, yRadioSize, 5);//back layer of radio
    fill(0);
    rect(-0.5*xRadioSize+20, 0.5*yRadioSize+10, 20, 20); //foot on the right
    rect(0.5*xRadioSize-20, 0.5*yRadioSize+10, 20, 20); //foot on the left
    strokeWeight(3);
    fill(134);
    rect(0, -18, (xRadioSize+10)*0.75, yRadioSize*0.6, 20, 20, 0, 0);//space of the speakers(with grid on top of it)

    // speaker line/grid details
    for (int i=0; i<6; i++) {
      line(-0.5*(xRadioSize+10)*0.75, -65+(i*15), 0.5*(xRadioSize+10)*0.75, -65+(i*15));//vertical
    }
    for (int i=0; i<14; i++) {
      line((14-0.5*(xRadioSize+10)*0.75)+(i*16), -0.5*yRadioSize*0.6-17, (14-0.5*(xRadioSize+10)*0.75)+(i*16), 0.5*yRadioSize*0.6-45);//horizontal
    }
    fill(222, 222, 222);
    rect(0, 45, (xRadioSize+10)*0.75, yRadioSize*0.3, 0, 0, 20, 20);//space for the knobs/buttons
    strokeWeight(1);

    //buttons of the radio
    xButton = -85;
    yButton = 40;
    fill(80);
    ellipse(xButton, yButton, 26, 26);//button on the left
    ellipse(-xButton, yButton, 26, 26);//button on the right

    //interactive buttons of the radio
    xRecButton = -15;
    yRecButton = 55;
    fill(190);
    //Play button
    rect(xRecButton, yRecButton, 15, 15);
    fill(0);
    triangle(xRecButton-4, yRecButton+4, xRecButton-4, yRecButton-4, xRecButton+4, yRecButton);
    //Pause Button
    fill(190);
    rect(xRecButton+25, yRecButton, 15, 15);
    fill(0);
    rect(xRecButton+25, yRecButton, 8.5, 8.5);

    popMatrix();
    fill(0);
  }

  void updateAudio(int initXmouse, int initYmouse) {
    int xMouse= initXmouse ;
    int yMouse= initYmouse;

    //play music
    if (xMouse<=(xRadio+xRecButton+6) && xMouse >=(xRadio+xRecButton-6)&& yMouse>= (yRadio-15+yRecButton-6)&& yMouse <=(yRadio-15+yRecButton+6)) {
      radioOn=true;
      if (file1playing==false && playSong1 ==true) {
        file1.play();
        file1playing = true;
      }
      if (file2playing==false && playSong1 == false) {
        file2.play();
        file2playing = true;
      }
    }

    //stop playing music
    if (xMouse<=(xRadio+xRecButton+6+25) && xMouse >=(xRadio+xRecButton-6+25)&& yMouse>= (yRadio-15+yRecButton-6)&& yMouse <=(yRadio-15+yRecButton+6)) {//krijg dit voor elkaar
      radioOn=false;
      if (file1playing == true) {
        file1.stop();
        file1playing = false;
        playSong1 = false;
      }
      if (file2playing ==true) {
        file2.stop();
        file2playing = false;
        playSong1 = true;
      }
    }
  }
}
