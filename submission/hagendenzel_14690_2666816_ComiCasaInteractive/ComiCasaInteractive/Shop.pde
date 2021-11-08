/**
 This class will handle the displaying of the storefront.
 **/

class Shop {
  color pillars = color(201, 76, 92);
  color pillarShadow = color(161, 66, 72);
  color framing = color(244, 244, 242);
  color framelight = color(250, 250, 250);
  color framedark = color(224, 224, 232);
  color base = color(36, 36, 36);
  color window = color(48, 48, 72, 128);
  color windowlight = color(172, 172, 216);
  color metal = color(196,196,204);

  Doors doors;
  
  public Shop() {
    doors = new Doors();
  }

  void display() {
    // drawing the doors
    doors.display();
    
    // drawing the frame
    frames();

    // drawing the pillars
    pillar(450);
    pillar(900);
    pillar(1350);

    // drawing the florets
    float floretDist = 112.5; //1800/16;
    for (int i = 1; i < 16; i++) {
      floral(floretDist*i);
    }
    
    // drawing the doors
    doors.display();
  }

  void frames() {
    pushMatrix();
    // setup
    fill(framing);
    noStroke();


    float frameHeight = 250;
    float frameWidth = 450;
    // upper windows
    fill(framing);
    pushMatrix();
    translate(5*225, 180);
    fill(framing);
    rect(0, 0, frameWidth, frameHeight);
    fill(framedark);
    rect(0, 0, frameWidth-10, frameHeight-10);
    fill(framing);
    rect(0, 0, frameWidth-20, frameHeight-20);
    fill(framedark);
    rect(0, 0, frameWidth-35, frameHeight-35);
    fill(window);
    rect(0, 0, frameWidth-45, frameHeight-45);
    fill(windowlight);
    quad(20, -102.5, -92.5, 102.5, -72.5, 102.5, 40, -102.5);
    quad(50, -102.5, -62.5, 102.5, -52.5, 102.5, 40, -102.5);
    popMatrix();

    frameWidth = 225;
    for (int i = 0; i < 8; i++) {
      if (i <4 || i > 5) {
        pushMatrix();
        translate(i*225+112.5, 180);
        fill(framing);
        rect(0, 0, frameWidth, frameHeight);
        fill(framedark);
        rect(0, 0, frameWidth-10, frameHeight-10);
        fill(framing);
        rect(0, 0, frameWidth-20, frameHeight-20);
        fill(framedark);
        rect(0, 0, frameWidth-35, frameHeight-35);
        fill(window);
        rect(0, 0, frameWidth-45, frameHeight-45);
        fill(windowlight);
        quad(20, -102.5, -92.5, 102.5, -72.5, 102.5, 40, -102.5);
        quad(50, -102.5, -62.5, 102.5, -52.5, 102.5, 40, -102.5);
        popMatrix();
      }
    }
    
    // side door
    frameHeight = 520;
    frameWidth = 220;
    fill(framing);
    pushMatrix();
    translate(115, 600);
    fill(framedark);
    rect(0, 0, frameWidth, frameHeight);
    fill(framing);
    rect(0, 5, frameWidth-15, frameHeight-15);
    fill(framedark);
    rect(0, 40, frameWidth-20, frameHeight-85);
    fill(framing);
    rect(0, 40, frameWidth-22, frameHeight-87);
    rect(-113,0,6,frameHeight);
    fill(metal);
    rect(0,40,140,20);
    popMatrix();
    
    // lower left window
    frameHeight = 520;
    frameWidth = 220;
    fill(framing);
    pushMatrix();
    translate(340, 600);
    fill(framing);
    rect(0, 0, frameWidth, frameHeight);
    fill(framedark);
    rect(0, 0, frameWidth-10, frameHeight-10);
    fill(framing);
    rect(0, 0, frameWidth-20, frameHeight-20);
    fill(framedark);
    rect(0, 0, frameWidth-35, frameHeight-35);
    fill(window);
    rect(0, 0, frameWidth-45, frameHeight-45);
    fill(windowlight);
    quad(20, -237.5, -92.5, 237.5, -72.5, 237.5, 40, -237.5);
    quad(50, -237.5, -62.5, 237.5, -52.5, 237.5, 40, -237.5);
    
    fill(framing);
    rect(-110,0,10,frameHeight);
    popMatrix();
    
    // lower middle window
    frameWidth = 450;
    fill(framing);
    pushMatrix();
    translate(675, 600);
    fill(framing);
    rect(0, 0, frameWidth, frameHeight);
    fill(framedark);
    rect(0, 0, frameWidth-10, frameHeight-10);
    fill(framing);
    rect(0, 0, frameWidth-20, frameHeight-20);
    fill(framedark);
    rect(0, 0, frameWidth-35, frameHeight-35);
    fill(window);
    rect(0, 0, frameWidth-45, frameHeight-45);
    fill(windowlight);
    quad(20, -237.5, -92.5, 237.5, -72.5, 237.5, 40, -237.5);
    quad(50, -237.5, -62.5, 237.5, -52.5, 237.5, 40, -237.5);
    popMatrix();
    
    // lower right window
    frameWidth = 450;
    fill(framing);
    pushMatrix();
    translate(1575, 600);
    fill(framing);
    rect(0, 0, frameWidth, frameHeight);
    fill(framedark);
    rect(0, 0, frameWidth-10, frameHeight-10);
    fill(framing);
    rect(0, 0, frameWidth-20, frameHeight-20);
    fill(framedark);
    rect(0, 0, frameWidth-35, frameHeight-35);
    fill(window);
    rect(0, 0, frameWidth-45, frameHeight-45);
    fill(windowlight);
    quad(20, -237.5, -92.5, 237.5, -72.5, 237.5, 40, -237.5);
    quad(50, -237.5, -62.5, 237.5, -52.5, 237.5, 40, -237.5);
    popMatrix();
    
    // middle frame
    //305->340
    fill(framelight);
    pushMatrix();
    translate(450,322.5);
    rect(0,0,900,35);
    fill(framing);
    rect(0,0,895,30);
    fill(framedark);
    rect(0,0,895,20);
    fill(framing);
    rect(0,0,890,15);
    popMatrix();
    
    fill(framelight);
    pushMatrix();
    translate(1575,322.5);
    rect(0,0,450,35);
    fill(framing);
    rect(0,0,445,30);
    fill(framedark);
    rect(0,0,445,20);
    fill(framing);
    rect(0,0,440,15);
    popMatrix();
    
    //door edges
    fill(framing);
    rect(1335,600,10,520);
    rect(915,600,10,520);
    
    //doorcap
    pushMatrix();
    translate(1125,322.5);
    fill(framing);
    rect(0,0,450,35);
    fill(framedark);
    rect(0,25,450,20);
    popMatrix();

    //top frames
    fill(framing);
    rect(width/2, 30, width, 60);
    fill(framedark);
    rect(width/2, 30, width-5, 55);
    fill(framing);
    rect(width/2, 30, width-12, 48);
    fill(framedark);
    rect(width/2, 30, width-15, 45);
    fill(framing);
    rect(width/2, 30, width-20, 40);
    
    // steps
    fill(base);
    rect(width/2,880,width,40);

    popMatrix();
  }

  void pillar(float posX) {
    // setup
    pushMatrix();
    rectMode(CENTER);
    ellipseMode(CENTER);
    noStroke();

    // main pillar
    fill(pillars);
    rect(posX, 350, 20, 500);

    //middle deco
    fill(pillarShadow);
    ellipse(posX, 460, 25, 5);
    ellipse(posX, 440, 25, 5);

    // lower bits
    fill(pillars);
    rect(posX, 610, 26, 20);
    fill(pillarShadow);
    rect(posX, 640, 25, 38);
    ellipse(posX, 600, 29, 5);
    ellipse(posX, 620, 29, 5);

    // floral bits
    fill(pillarShadow);
    ellipse(posX, 610, 13, 13);
    fill(pillars);
    ellipse(posX, 610, 9, 9);
    fill(pillarShadow);
    ellipse(posX, 610, 7, 7);
    ellipse(posX, 610+6, 7, 4);
    ellipse(posX, 610-6, 7, 4);
    ellipse(posX+6, 610, 4, 7);
    ellipse(posX-6, 610, 4, 7);

    fill(pillars);
    ellipse(posX, 625, 15, 10);
    ellipse(posX+14, 625, 5, 10);
    ellipse(posX-14, 625, 5, 10);
    rect(posX, 640, 10, 30);
    rect(posX+13, 640, 2, 30);
    rect(posX-13, 640, 2, 30);
    ellipse(posX, 655, 33, 8);

    // bottom parts
    fill(pillars);
    rect(posX, 670, 29, 30, 360, 360, 0, 0);
    fill(pillarShadow);
    ellipse(posX, 660, 29, 5);
    fill(pillars);
    ellipse(posX, 685, 33, 7);
    fill(pillarShadow);
    ellipse(posX, 688, 38, 5);
    fill(pillars);
    rect(posX, 695, 35, 10, 360, 360, 0, 0);
    rect(posX, 700, 40, 10, 360, 360, 0, 0);

    fill(pillarShadow);
    triangle(posX-23, 700, posX, 760, posX+23, 700);
    triangle(posX-21, 820, posX, 780, posX+21, 820);
    fill(pillars);
    rect(posX, 765, 35, 100);
    fill(pillarShadow);
    rect(posX, 765, 25, 85);
    fill(pillars);
    rect(posX, 765, 20, 80);
    rect(posX, 840, 42, 40);

    //top
    fill(pillarShadow);
    ellipse(posX, 98, 23, 7);
    triangle(posX-21, 60, posX, 90, posX+21, 60);
    ellipse(posX-17, 70, 10, 10);
    ellipse(posX+17, 70, 10, 10);

    fill(pillars);
    rect(posX, 85, 22, 20);

    popMatrix();
  }

  void floral(float posX) {
    fill(pillars);
    circle(posX-7, 30, 10);
    circle(posX+7, 30, 10);
    circle(posX+4, 36, 10);
    circle(posX-4, 36, 10);
    circle(posX+4, 24, 10);
    circle(posX-4, 24, 10);

    fill(pillarShadow);
    circle(posX, 30, 10);
  }
}
