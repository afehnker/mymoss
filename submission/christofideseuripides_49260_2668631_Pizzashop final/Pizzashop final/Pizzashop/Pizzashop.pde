//Adding a font for the text
PFont font_2;

// Creating an array of 300 smoke
Smoke[] smoke = new Smoke[300];
// the number of smoke created already
int smokeCreated=0; 

// Assigning Global variables 

FrontDesk background;
Plain pizzaButton;
Pepperoni pepperoniButton;
Olive oliveButton;
Mushroom mushroomButton;
Basil basilButton;
Olive_2 olive_2_Button;
Mushroom_2 mushroom_2_Button;
Basil_2 basil_2_Button;
Pepperoni_2 pepperoni_2_Button;

End endButton;
TvFrame Tv;

//This allows information from the library to load in
import ddf.minim.*;
//The class of minim loading in
Minim minim;
//Name of the copy we are making, audio player is a file that is loading into it's memory
AudioPlayer song;


void setup() {
  size(1200, 800);


// declaring classes
  background = new FrontDesk();

  pizzaButton = new Plain();
  pepperoniButton = new Pepperoni();
  oliveButton = new Olive();
  mushroomButton = new Mushroom();
  basilButton = new Basil();
  olive_2_Button = new Olive_2();
  mushroom_2_Button = new Mushroom_2();
  basil_2_Button = new Basil_2();
  pepperoni_2_Button = new Pepperoni_2();
  endButton = new End();

  Tv = new TvFrame();

  // we pass this to Minim so that it can load files from the drectory
  minim = new Minim(this);
  // refering to the soundfile that is located in the data folder
  song = minim.loadFile("song.MP3");
}
void draw() {
  song.play();

  background.display();

  // updating smoke
  for (int i=0; i < smokeCreated; i++) {
    smoke[i].display();
    smoke[i].update();
  }

  pizzaButton.display();
  pepperoniButton.display();
  oliveButton.display();
  mushroomButton.display();
  basilButton.display();
  olive_2_Button.display();
  mushroom_2_Button.display();
  basil_2_Button.display();
  pepperoni_2_Button.display();

  endButton.display();

  Tv.display();
  Tv.update();
}

void mouseClicked() {

  pizzaButton.update(mouseX, mouseY);

  pepperoniButton.update(mouseX, mouseY);

  oliveButton.update(mouseX, mouseY);

  mushroomButton.update(mouseX, mouseY);

  basilButton.update(mouseX, mouseY);

  olive_2_Button.update(mouseX, mouseY);

  basil_2_Button.update(mouseX, mouseY);

  mushroom_2_Button.update(mouseX, mouseY);

  pepperoni_2_Button.update(mouseX, mouseY);

  endButton.update(mouseX, mouseY);
}
