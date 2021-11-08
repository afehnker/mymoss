import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class final_project extends PApplet {

/*=================
Storefront designed and created by Nina Vroom, inspired by
Het Lichtatelier storefront at Walstraat 18, Enschede.
Select and toggle lamps on/off by clicking on them, type numbers
to give a lamp a color. Swing the corded lamp by click not on a lamp.
Written in Processing, using Processing documentation
=================*/

PFont font;
PShape hourHand;
PShape minuteHand;

boolean somethingClicked = false;

CordedLamp cordedLamp;
Lamp[] lamps = new Lamp[5];
Lamp selectedLamp;
Clock clock;

String userColorStr;
int userColor;

PImage stand;
PGraphics frame;

public void setup() {
  
  font = createFont("impact.ttf", 16);

  lamps[0] = new Lamp(300, 100, 0, color(246, 241, 143), true);
  lamps[1] = new Lamp(500, 120, 0, color(246, 241, 143), true);
  lamps[2] = new Lamp(550, 500, PI, color(246, 241, 143), true);
  lamps[3] = new Lamp(630, 600, PI, color(246, 241, 143), false);
  lamps[4] = new Lamp(200, 500, PI, color(246, 241, 143), true);

  cordedLamp = new CordedLamp(700, 100, color(246, 241, 143), 20, false);
  clock = new Clock(400, 600);
  userColorStr = "(,,)";
  userColor = color(255, 255, 255);
  stand = loadImage("stand2.png");
  stand.resize((int)(stand.width*0.25f), (int)(stand.height*0.25f));
  createFrame();
}

public void draw() {
  background(0);
  
  //door
  fill(67, 55, 41);
  quad(80, 180, 250, 160, 250, 740, 80, 740);
  
  //clock
  clock.display();

  //lamps
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

public void mousePressed() {
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

public void keyPressed() {
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
  }

  if(key == BACKSPACE) {
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

public void createFrame() {
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
class Clock {

    float x;
    float y;
    PVector initTime;
    PShape hourHand;
    PShape minuteHand;
    
    Clock(float initX, float initY) {
        x = initX;
        y = initY;

        initTime = new PVector(hour(), minute());
        
        hourHand = loadShape("hourhand.svg");
        hourHand.disableStyle();
        hourHand.scale(0.1f);
        hourHand.setFill(color(255, 255, 255));

        minuteHand = loadShape("minutehand.svg");
        minuteHand.disableStyle();
        minuteHand.scale(0.1f);
        minuteHand.setFill(color(255, 255, 255));
    }

    public void display() {
        pushMatrix();
        translate(x, y);
        
        noStroke();

        //face of the clock
        fill(100);
        circle(0, 0, 200);
        fill(255);
        circle(0, 0, 170);
        

        rectMode(CENTER);

        fill(0);
        //ticks on the clock
        pushMatrix();
        for(int i = 0; i <= 12; i++) {
            rotate(PI/6);
            if(i % 3 == 2) {
            rect(0, 65, 5, 23);
            }
            else {
            rect(0, 68, 5, 17);
            }
        }
        for(int i = 0; i <= 60; i++) {
            rotate(PI/30);
            rect(0, 73, 3, 7);
        }
        popMatrix();
        circle(0, 0, 10);
        
        //hands of the clock, rotate based on time
        pushMatrix();
        rotate((initTime.x+millis()/1000/60/60)*PI/6);
        rotate((initTime.y)*PI/360);
        shape(hourHand, -hourHand.width*0.1f*.5f, -50);
        popMatrix();
        
        pushMatrix();
        rotate((initTime.y+millis()/1000/60)*PI/30);
        shape(minuteHand, -minuteHand.width*0.1f*.5f, -77);
        popMatrix();

        rectMode(CORNER);
        popMatrix();
    }
}
class Cord {

  int numUnits;
  CordUnit[] units;
  float x;
  float y;
  
  PVector totalTranslation;

  Cord(float initX, float initY, int cableLength) {
    x = initX;
    y = initY;

    numUnits = cableLength;
    units = new CordUnit[numUnits];
    totalTranslation = new PVector(0,0);

    for (int i = 0; i < numUnits; i++) {
      units[i] = new CordUnit(random(-PI, PI));
      totalTranslation.add(new PVector(-units[i].l*sin(units[i].rotation), units[i].l*cos(units[i].rotation)));
    }
  }

  public void display() {
    pushMatrix();
    translate(x, y);
    for (int i = 0; i < numUnits; i++) {
      units[i].display();
    }
    popMatrix();
  }

  public void update() {
    totalTranslation = new PVector(0,0);
    for (int i = 0; i < numUnits; i++) {
      units[i].update(totalTranslation.x, totalTranslation.y);
      totalTranslation.add(new PVector(-units[i].l*sin(units[i].rotation), units[i].l*cos(units[i].rotation)));
    }
  }
  
  public void drag(float mx, float my) {
    PVector mousePos = new PVector(mx-x, my-y);
    //mousePos.sub(totalTranslation);
    for (int i = 0; i < numUnits; i++) {
      if(mousePos.heading() < -PI/2) {
        units[i] = new CordUnit(mousePos.heading()-PI/2+random(-1, 1)+2*PI);
      } else {
        units[i] = new CordUnit(mousePos.heading()-PI/2+random(-1, 1));
      }
    }
  }
}
class CordUnit {
    float x;
    float y;
    float w;
    float l;
    float rotation;
    float av;

    CordUnit(float initR) {
        w = 3;
        l = 10;
        rotation = initR;
        av = 0;
    }

    public void display() {
        pushMatrix();
        translate(x, y);
        rotate(rotation);
        
        rect(-w/2, 0, w, l+1);
        popMatrix();
    }
    
    public void update(float newX, float newY) {
      
      x = newX;
      y = newY;
      
      if(abs(rotation) < 0.01f && abs(av) < 0.01f) {
        av =+ 0;
      } else if(rotation > 0) {
        av -= 0.001f;
      } else if(rotation < 0) {
        av += 0.001f;
      }
      av *= .99f;
      rotation += av;
    }
}
class CordedLamp {
    float x;
    float y;

    Lamp lamp;
    Cord cord;
    
    int lightC;
    int cableLength;

    CordedLamp(float initX, float initY, int initColor, int initLength, boolean startLit) {
        x = initX;
        y = initY;
        cableLength = initLength;
        lightC = initColor;

        cord = new Cord(700, 100, cableLength);
        lamp = new Lamp(cord.totalTranslation.x, cord.totalTranslation.y, 0, lightC, startLit);
    }

    public void display() {
        cord.update();
        lamp.update(x+cord.totalTranslation.x, y+cord.totalTranslation.y, cord.units[cord.numUnits-1].rotation);
        cord.display();
        lamp.display();
        fill(255, 0, 0);
    }
}
class Lamp {
  
  Light light;
  boolean lit;
  PShape texture;

  float x;
  float y;
  float rotation;
  String shapeName;
  int lightC;
  float scale;
  
  Lamp(float initX, float initY, float initR, int lightColor, boolean startLit) {
    x = initX;
    y = initY;
    rotation = initR;
    shapeName = "lamp.svg";
    
    scale = 0.7f;
    texture = loadShape(shapeName);
    texture.disableStyle();
    texture.scale(scale);
    
    lit = startLit;
    lightC = lightColor;
    light = new Light(shapeName, lightC);
  }
  
  public void display() {
    pushMatrix();
    translate(x, y);
    rotate(rotation+PI);
    
    if(lit) {
      fill(255, 255, 255);
    } else {
      fill(150, 150, 150);
    }
    shape(texture, -texture.width/2*scale, -texture.height*scale);
  
    if(lit) {
      translate(0, -texture.height*scale/2);
      light.display();
    }

    popMatrix();
  }

  public void update(float newX, float newY, float newR) {
    x = newX;
    y = newY;
    rotation = newR;
  }
}
class Light {
  PShape texture;
  PGraphics light;
  float scale;

  int lightColor;
  
  Light(String shapeName, int c) {
    light = createGraphics(500, 500);
    lightColor = c;

    scale = 1.1f;
    texture = loadShape(shapeName);
    texture.scale(scale);
    texture.disableStyle();
    
    makeLight(lightColor);
  }
  
  public void display() {
    blendMode(SCREEN);
    image(light, -light.width/2, -light.height/2);
    blendMode(BLEND);
  }

  public void makeLight(int c) {
    lightColor = c;
    
    light.beginDraw();
    light.fill(lightColor);
    light.shape(texture, light.width/2-texture.width/2*scale, light.height/2-texture.height/2*scale); // offsets light into the middle of the 500px * 500px image so it doesn't get cut off on blur
    light.filter(BLUR, 5);
    light.filter(BLUR, 5);
    light.filter(BLUR, 5);
    light.filter(BLUR, 5);
    light.endDraw();
  }
}
  public void settings() {  size(800, 800, FX2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "final_project" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
