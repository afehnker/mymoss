/* Shopwindow assignment by Inèz Hemme and Mette Laros
 Music store: van Weersel & ZN.
 23-10-2021 - 01-11-2021
 
 Interactivity:
 - if the green switch button is clicked, the lights go out and a discobal appears
 - if a key is pressed while the lights are out, discomusic starts playing
 - if you click the red switch button, the lights go on and the discomusic stops 
 - the instruments make music if you click them and different kinds of music notes appear
 - if you click on the instruments again or on another instrument, the music stops and the music notes disappear
 
 For the program to work, the library "Sound" has to be added
 (Sketch-button on the top of the navigation bar in processing, Import Library, Add Library, Sound (Provides a simple way to work with audio.))
 */

//enables the use of sound files
import processing.sound.*;

//the instruments and sounds get introduced
Background shop; 
Guitar jimmyGuitar;
Guitar edwardGuitar;
SoundFile guitarSong;
Banjo ericBanjo;
SoundFile banjoSong;
Saxophone mindiSaxophone;
SoundFile saxSong;
Flute jamesFlute;
Flute johnFlute;
SoundFile fluteSong;
Trombone jorgenTrombone;
SoundFile tromSong;
Djembe adamaDjembe;
SoundFile djembeSong;
SoundFile discoSong;

//the notes get introduced
Quarter[] quarters = new Quarter[10];
Eighth[] eighths = new Eighth[10];
Deighth[] deighths = new Deighth[10];

//the objects get introduced
Stand andreStand;
Poster duckie;
Switch click;

float switchX = 1300;
float switchY = 500;
float switchSize = 20;
boolean greenOver = false;
boolean redOver = false;
boolean notesPlaying = false;

void setup () {
  //setup screen
  size (1500, 900);
  ellipseMode (CENTER);
  rectMode (CENTER);

  //background being made
  shop = new Background (0, 0);

  //swich being made
  click = new Switch ();

  //poster being made 
  duckie = new Poster (100, 300);

  // instruments and their sounds being made
  jimmyGuitar = new Guitar (1400, 300);
  edwardGuitar = new Guitar (1225, 300);
  guitarSong = new SoundFile(this, "Guitar.wav");
  ericBanjo = new Banjo (1075, 200);
  banjoSong = new SoundFile(this, "Banjo.wav");
  mindiSaxophone = new Saxophone (400, 150);
  saxSong = new SoundFile(this, "Sax.wav");
  jamesFlute = new Flute (700, 750);
  johnFlute = new Flute (700, 800);
  fluteSong = new SoundFile(this, "Flute.wav");
  jorgenTrombone = new Trombone (600, 605);
  tromSong = new SoundFile(this, "Trom.wav");
  adamaDjembe = new Djembe (800, 450);
  djembeSong = new SoundFile(this, "Djembe.wav");
  andreStand = new Stand (100, 860);
  discoSong = new SoundFile(this, "Disco.wav");

  //music notes being made at random places
  for (int k=0; k<quarters.length; k++) {
    quarters[k] = new Quarter(random(10, width-10), random(10, height-10));
  }  
  for (int k=0; k<eighths.length; k++) {
    eighths[k] = new Eighth(random(10, width-10), random(10, height-10));
  }  
  for (int i=0; i<deighths.length; i++) {
    deighths[i] = new Deighth(random(10, width-10), random(10, height-10));
  }
}

void draw () {
  //display of the background 
  shop.display ();

  //display and update of the switch
  click.display ();
  //click.update ();

  //display of the poster
  duckie.display();

  //display of the instruments
  jimmyGuitar.display ();
  edwardGuitar.display ();
  ericBanjo.display ();
  mindiSaxophone.display ();
  jamesFlute.display ();
  johnFlute.display ();
  jorgenTrombone.display ();
  adamaDjembe.display ();
  andreStand.display ();

  //display and moving around of the music notes
  if (notesPlaying == true) {
    for (int k=0; k < quarters.length; k++) {
      quarters[k].display();
    }
    for (int k=0; k < quarters.length; k++) {
      quarters[k].move();
    }

    for (int k=0; k < eighths.length; k++) {
      eighths[k].display();
    }
    for (int k=0; k < eighths.length; k++) {
      eighths[k].move();
    }

    for (int k=0; k < deighths.length; k++) {
      deighths[k].display();
    }
    for (int k=0; k < deighths.length; k++) {
      deighths[k].move();
    }
  }
}

void mouseClicked () {
  //mouseClicked on red button; if you press the red button, the disco song stops
  if (mouseX >= switchX-10 && mouseX <= switchX+10 && mouseY >= switchY-23 && mouseY <= switchY-3) {
    redOver = true;
    discoSong.stop();
  } else {
    redOver = false;
  }

  //mouseClicked on green button 
  if (mouseX >= switchX-10 && mouseX <= switchX+10 && mouseY >= switchY+3 && mouseY <= switchY+23) {
    greenOver = true;
  } else {
    greenOver = false;
  }
}

//if an instrument is clicked on with the mouse, it starts to play music
void mousePressed () {
  mindiSaxophone.play(mouseX, mouseY);
  jamesFlute.play(mouseX, mouseY);
  johnFlute.play(mouseX, mouseY);
  jimmyGuitar.play(mouseX, mouseY);
  edwardGuitar.play(mouseX, mouseY);
  ericBanjo.play(mouseX, mouseY);
  jorgenTrombone.play(mouseX, mouseY);
  adamaDjembe.play(mouseX, mouseY);
}

//if you press a key while the lights are off, the disco song starts playing
void keyPressed() {
  if (greenOver == true) {
    discoSong.play();
  }
}
