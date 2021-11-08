class VDPoel { //<>//
  PFont logo;
  void storeParallax() {
    int parallaxX = (mouseX-(width/2))/10;
    int parallaxY = (mouseY-(height/2))/10;
    imageMode(CENTER);
    //background = loadImage("assets/vdpoel_back.png");
    background(255);
    rectMode(CORNER);

    fill(180, 199, 231);
    strokeWeight(0);
    rect(125-(parallaxX/4), 280-(parallaxY/4), 875, 440);
    fill(189, 0, 25);
    rect(200-(parallaxX/4), 590-(parallaxY/4), 900, 50);
    fill(255);
    quad(200-(parallaxX/4), 590-(parallaxY/4), 250-(parallaxX/4), 540-(parallaxY/4), 1050-(parallaxX/4), 540-(parallaxY/4), 1100-(parallaxX/4), 590-(parallaxY/4));


    // Draw windows:
    fill(0, 0, 0, 75);
    strokeWeight(0);
    rect(0-parallaxX, 50-parallaxY, 450, 150);
    rect(450-parallaxX, 50-parallaxY, 850, 260);
    rect(825-parallaxX, 350-parallaxY, 450, 550);
    textSize(28);
    fill(255);
    text("espresso doppio macchiato espresso\ncappuccino macchiato latte thee", 1090-parallaxX, 600-parallaxY);

    // Draw wood structure:
    fill(226, 138, 68);
    strokeWeight(0);
    rect(-100-parallaxX, 0-parallaxY, 1400, 50);
    rect(-100-parallaxX, 0-parallaxY, 125, 900);
    rect(-100-parallaxX, 200-parallaxY, 550, 50);
    rect(420-parallaxX, 0-parallaxY, 40, 900);
    rect(420-parallaxX, 310-parallaxY, 980, 50);
    rect(790-parallaxX, 0-parallaxY, 40, 900);
    rect(790-parallaxX, 675-parallaxY, 780, 50);

    // Draw logo
    logo = createFont("assets/PlayfairDisplay-Bold.ttf", 128); // Using Playfair Display Font
    textFont(logo);
    textSize(100);
    textAlign(CENTER);
    fill(255);
    text("vanderpoel", 600-parallaxX, 140-parallaxY); 
    logo = createFont("Lucida Sans", 128); // Go back to default font from now on
    textFont(logo);

    // Show 'Enter shop' when hovering door
    if (mouseX < 800 && mouseY > 400) {
      image(ui_element[2], mouseX, mouseY);
      textSize(36);
      textAlign(CENTER);
      fill(0);
      text("ENTER SHOP", mouseX, mouseY+100);
      if (mousePressed) {
        background = loadImage("assets/bg.png"); // Load Scene 2 background
        scene = 2;
      }
    }
    
    

    
  }
}
