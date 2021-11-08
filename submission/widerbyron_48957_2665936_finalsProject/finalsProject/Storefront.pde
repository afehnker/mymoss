/*
 Storefront Class
 Storefront, draws the storefront, with bricks, windows, montblanc text and portal.
 when activataed by a button ins LeftSymbol, the storefront will release angels into the world.
 Author: Byron and Door
 */

class Storefront {

  float storeX;
  float storeY;

  PortalParts[] portalPart = new PortalParts[3];

  Angel [] angels = new Angel[10]; //angels are used for the 

  boolean spawnAngels;

  int angelTimer;


  Storefront(float xPos, float yPos) {
    storeX = xPos;
    storeY = yPos;

    for (int i=0; i<portalPart.length; i++) {
      portalPart[i] = new PortalParts(0, 20, 0, HALF_PI-(PI/(5-i)), 10+5*i, random(0.01, 0.1), i+2); //first where the protal is and the begin than te end dependent on which part, 
      //distance dependent on which part it is
      //random speed and a strokeWeight based on part
    }


    //spawns the angels outside the screen
    for (int i = 0; i < 10; i++) {
      angels[i] = new Angel(600, 600, 0.5);
    }

    angelTimer = 0;
  }


  void display() {

    float aSide = width/2; //repeatedly used value for x dimension and position
    float bSide = height*0.7; //repeatedly used value for y dimension and position

    pushMatrix();
    translate(storeX, storeY);
    rectMode(CENTER);
    fill(#2E3131);
    noStroke();
    rect(0, 20, width, bSide); //glass front

    //draws the portal
    for (int i = 0; i<portalPart.length; i++) {
      portalPart[i].display(); //portal display
    }

    noStroke();
    rectMode(CORNER);
    fill(#2E3131);
    rect(-width*0.25, -(bSide)/2+20, 80, bSide); //left divider
    rect(width*0.25-80, -(bSide)/2+20, 80, bSide); //right ddivider

    fill(#6D5B47);
    rect(-width*0.25+80, -(bSide)/2+20, 15, bSide); //left divider
    rect(width*0.25-95, -(bSide)/2+20, 15, bSide); //right ddivider


    rect(-aSide+50, -(bSide)/2+20, 15, bSide); //left divider
    rect(aSide-65, -(bSide)/2+20, 15, bSide); //right ddivider

    rect(-aSide, -(bSide)/2+20, width, 15); //top line
    rect(-aSide, (bSide)/2+5, width, 15); //bottom line

    //bricks on the side of the store front
    fill(#919191);
    rect(-aSide, -(bSide)/2+20, 50, bSide); //left brick side
    rect(aSide-50, -(bSide)/2+20, 50, bSide); //left brick side

    float brickHeight = (bSide)/12-2; //-2 to account for the gap between bricks, and devided by 12 to get 12 bricks to fit evenly
    fill(0);
    //for loops creates spaces between bricks
    for (int i = 0; i < 11; i++) {
      rect(-aSide, -(bSide)/2+21+(brickHeight+2)*(1+i), 50, 2); //left brick spaces
      rect(aSide-50, -(bSide)/2+21+(brickHeight+2)*(1+i), 50, 2); //right brick spaces
    }
    fill(255);
    PFont montBlancFont;
    montBlancFont = createFont("LEMONMILK-Bold.otf", 15); //creating the font
    textFont(montBlancFont);
    text("montblanc", -width*0.365, -200); //left montblanc letters
    text("montblanc", +width*0.280, -200); //right montblanc letters
    popMatrix();
  }

  void update() {

    for (int i = 0; i<portalPart.length; i++) {
      portalPart[i].update();
    }

    if (spawnAngels) {
      println("SPAWNING");
      for (int i = 0; i < 10; i++) {
        angels[i].display();
        angels[i].update();

        if (angelTimer == 0 || angelTimer == 60) {
          angels[i].startTracking(random(0, width), random(0, height));
          angelTimer = 0;
        }
      }
      angelTimer++;
    }
  }

  void activateAngels() {
    spawnAngels = true;
    println("Angel activated");
  }
  
  void resetAngels() {

    for (int i = 0; i < 10; i++) {


      angels[i].startTracking(-1500, -500);
      angels[i].update();
    }

    spawnAngels = false;
    angelTimer = 0;
  }

  //sets new portal speed to slow
  void portalSpeed() {
    for (int i=0; i < portalPart.length; i++) {
      portalPart[i].setNewSpeed(random(0.005, 0.01));
    }
  }
  
  //resets portal speed
  void portalReset() {
    for (int i=0; i < portalPart.length; i++) {
      portalPart[i].setNewSpeed(random(0.01, 0.1));
    }
  }
}
