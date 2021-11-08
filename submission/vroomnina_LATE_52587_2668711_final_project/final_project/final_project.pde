/*=================
Storefront designed and created by Nina Vroom, inspired by
Het Lichtatelier storefront at Walstraat 18, Enschede.
Select and toggle lamps on/off by clicking on them, type numbers
to give a lamp a color. Swing the corded lamp by click not on a lamp.
Written in Processing, using Processing documentation
=================*/

// External resources
PFont font;
PImage stand;
PGraphics frame;

// Check for swinging the corded lamp
boolean somethingClicked = false;
// string and color for what the user types in
String userColorStr;
color userColor;

// Other objects on screen
CordedLamp cordedLamp;
Lamp[] lamps = new Lamp[5];
Lamp selectedLamp;
Clock clock;

// initialize lamps, the clock, get external resources
void setup() {
  size(800, 800, FX2D);
  font = createFont("impact.ttf", 16);
  stand = loadImage("stand2.png");
  stand.resize((int)(stand.width*0.25), (int)(stand.height*0.25));
  createFrame();
  
  lamps[0] = new Lamp(300, 100, 0, color(246, 241, 143), true);
  lamps[1] = new Lamp(500, 120, 0, color(246, 241, 143), true);
  lamps[2] = new Lamp(550, 500, PI, color(246, 241, 143), true);
  lamps[3] = new Lamp(630, 600, PI, color(246, 241, 143), false);
  lamps[4] = new Lamp(200, 500, PI, color(246, 241, 143), true);
  cordedLamp = new CordedLamp(700, 100, color(246, 241, 143), 20, false);

  clock = new Clock(400, 600);
  
  userColorStr = "(,,)";
  userColor = color(255, 255, 255);
}

void draw() {
  background(0);
  
  //door
  fill(67, 55, 41);
  quad(80, 180, 250, 160, 250, 740, 80, 740);
  
  //clock
  clock.display();

  //lamps array
  for(int i = 0; i < lamps.length; i++) {
    lamps[i].display();
  }
  cordedLamp.display();

  //light stands
  image(stand, lamps[2].x-stand.width/2+2, lamps[2].y);
  image(stand, lamps[3].x-stand.width/2+2, lamps[3].y);
  image(stand, lamps[4].x-stand.width/2+2, lamps[4].y);

  //frame of the window
  image(frame, 0, 0);
  
  //user-entered color text + lamp color update
  fill(255, 255, 255);
  textSize(30);
  if(userColorStr.length() == 13) {
    userColor = color(Integer.parseInt(userColorStr.substring(1,4)), Integer.parseInt(userColorStr.substring(5,8)), Integer.parseInt(userColorStr.substring(9,12)));
    if(selectedLamp != null) {
      if (userColor != selectedLamp.light.lightColor) {
        selectedLamp.light.makeLight(userColor);
        selectedLamp.lit = true;
      }
    }
  }
  text(userColorStr, 5, 30);

  //address text
  fill(200);
  textFont(font);
  textSize(60);
  text("Walstraat 18", 120, 710);
}

//check if a lamp is clicked, otherwise swing the lamp
void mousePressed() {
  for(int i = 0; i < lamps.length; i++) {
    if(dist(mouseX, mouseY, lamps[i].x-lamps[i].texture.height * lamps[i].scale/2*sin(lamps[i].rotation), lamps[i].y+lamps[i].texture.height * lamps[i].scale/2*cos(lamps[i].rotation)) <= 20) {
      somethingClicked = true;
      lamps[i].lit = !lamps[i].lit;
      selectedLamp = lamps[i];
    }
  }
  if(dist(mouseX, mouseY, cordedLamp.lamp.x-cordedLamp.lamp.texture.height * cordedLamp.lamp.scale/2*sin(cordedLamp.lamp.rotation), cordedLamp.lamp.y+cordedLamp.lamp.texture.height * cordedLamp.lamp.scale/2*cos(cordedLamp.lamp.rotation)) <= 20) {
    somethingClicked = true;
    cordedLamp.lamp.lit = !cordedLamp.lamp.lit;
    selectedLamp = cordedLamp.lamp;
  }

  if(!somethingClicked) {
    cordedLamp.cord.drag(mouseX, mouseY);
  }

  somethingClicked = false;
}

//check if the key pressed is a number, add into the string in the appropirate location
//remove if backspace is pressed at the appropirate location
void keyPressed() {
  if(key=='0' || key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9') {
    if(userColorStr.length() == 4){
      userColorStr = userColorStr.substring(0,1)+key+userColorStr.substring(1,4);
    } else if(userColorStr.length() == 5) {
      userColorStr = userColorStr.substring(0,2)+key+userColorStr.substring(2,5);
    } else if(userColorStr.length() == 6) {
      userColorStr = userColorStr.substring(0,3)+key+userColorStr.substring(3,6);
    }
    else if(userColorStr.length() == 7) {
      userColorStr = userColorStr.substring(0,5)+key+userColorStr.substring(5,7);
    } else if(userColorStr.length() == 8) {
      userColorStr = userColorStr.substring(0,6)+key+userColorStr.substring(6,8);
    } else if(userColorStr.length() == 9) {
      userColorStr = userColorStr.substring(0,7)+key+userColorStr.substring(7,9);
    }
    else if(userColorStr.length() == 10) {
      userColorStr = userColorStr.substring(0,9)+key+userColorStr.substring(9,10);
    } else if(userColorStr.length() == 11) {
      userColorStr = userColorStr.substring(0,10)+key+userColorStr.substring(10,11);
    } else if(userColorStr.length() == 12) {
      userColorStr = userColorStr.substring(0,11)+key+userColorStr.substring(11,12);
    }
  } else if(key == BACKSPACE) {
    if(userColorStr.length() == 5) {
      userColorStr = userColorStr.substring(0,1)+userColorStr.substring(2,5);
    } else if(userColorStr.length() == 6) {
      userColorStr = userColorStr.substring(0,2)+userColorStr.substring(3,6);
    } else if(userColorStr.length() == 7) {
      userColorStr = userColorStr.substring(0,3)+userColorStr.substring(4,7);
    }
    else if(userColorStr.length() == 8) {
      userColorStr = userColorStr.substring(0,5)+userColorStr.substring(6,8);
    } else if(userColorStr.length() == 9) {
      userColorStr = userColorStr.substring(0,6)+userColorStr.substring(7,9);
    } else if(userColorStr.length() == 10) {
      userColorStr = userColorStr.substring(0,7)+userColorStr.substring(8,10);
    }
    else if(userColorStr.length() == 11) {
      userColorStr = userColorStr.substring(0,9)+userColorStr.substring(10,11);
    } else if(userColorStr.length() == 12) {
      userColorStr = userColorStr.substring(0,10)+userColorStr.substring(11,12);
    } else if(userColorStr.length() == 13) {
      userColorStr = userColorStr.substring(0,11)+userColorStr.substring(12,13);
    }
  }
}

// create the frame that draws on top of everything
void createFrame() {
  frame = createGraphics(width, height);
  frame.beginDraw();
  frame.noStroke();
  frame.fill(200, 50, 10);
  frame.rect(0, 0, width-40, 40);
  frame.rect(width-40, 0, 40, height-40);
  frame.rect(0, 40, 40, height-40);
  frame.rect(40, height-40, width-40, 40);
  frame.fill(230);
  frame.rect(40, 40, width-80, 40);
  frame.rect(width-80, 40, 40, height-80);
  frame.rect(40, 80, 40, height-120);
  frame.rect(80, height-80, width-120, 40);
  frame.endDraw();
}