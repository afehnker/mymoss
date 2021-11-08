class storeFront {
  //variables for the brick background
  float brickOffset = 5;
  int brickWidth = 20;
  int brickHeight = 10;
  int horizontalBrick = 1060/brickHeight;
  int verticalBrick = 1120/brickWidth; 
  int offset;

  storeFront() {
  }

  void display() { 
    stroke(0);
    strokeWeight(1);
    fill(94, 79, 73);
    // Nested for loop in order to create brickwall
    for ( int j = 0; j < horizontalBrick; j++ ) {
      for ( int i = 0; i < verticalBrick; i++ ) {
        //makes it so every other row of bricks is offset in order to make it look like a wall
        if (j % 2 == 1) 
          offset = brickWidth / 2;
        else offset=0;  
        //iteration*width of the brick - an amount to make it fill the entire screen
        rect(i * brickWidth + offset-60, j * brickHeight, 54, 20);
      }
    }

    //large tiles around storefront
    for (int i =0; i<925; i = i+25) {
      for (int j=60; j<1025; j  = j+25) {
        fill(150, 81, 90);
        rect(i, j, 25, 25);
      }
    }

    fill(154, 103, 86);
    //top line of bricks around the shop
    for (int i = 0; i < 1000; i = i+10) {
      rect(i, 40, 10, 20);
    }




    // left column of yellow bricks circling the shop
    fill(225, 184, 69);
    for (int i = 60; i < 900; i = i+25) {
      rect(100, i, 25, 25);
    }

    //right column of yellow bricks circling the shop
    for (int i = 60; i < 1000; i = i+25) {
      rect(900, i, 25, 25);
    }


    //left part windowsill tiles angled right for perspective
    //translate refers to middle of the windowsill
    pushMatrix();
    translate(420, 860);

    for (int i =0; i < 160; i = i+20) {
      for ( int j = 0; j < 40; j= j+20) {
        quad(-270+i-(j/4), 20+j, -290+i-(j/4), 20+j, -285+i-(j/4), 0+j, -265+i-(j/4), 0+j);
        quad(-130-(j/4), 20+j, -110, 20+j, -110, 0+j, -125-(j/4), 0+j);
      }
    }

    quad(-130, 20, -110, 20, -110, 0, -125, 0);
    popMatrix();

    pushMatrix();
    translate(420, 860);
    for (int i =0; i < 200; i = i+20) {
      for ( int j = 0; j < 40; j= j+20) {
        rect(-110+i, 0+j, 20, 20);
      }
    }
    popMatrix();

    //right part of the windowsill angled left for perspective
    pushMatrix();
    translate(420, 860);
    for (int i =0; i < 160; i = i+20) {
      for ( int j = 0; j < 40; j= j+20) {
        quad(110+i+(j/4), 20+j, 105+i+(j/4), 0+j, 125+i+(j/4), 0+j, 130+i+(j/4), 20+j);
        quad(90, 20+j, 90, 0+j, 105+(j/4), 0+j, 110+(j/4), 20+j);
      }
    }
    popMatrix();

    //white windowsill around all windows and doors 

    //white border behind main window
    fill(255);
    rect(125, 60, 580, 805);

    //white border for doorframe
    rect(895, 60, 5, 940);
    noStroke();
    rect(685, 850, 20, 150);
    stroke(0);

    //window backdrop
    fill(145, 40, 33);
    
    //main windows
    rect(135, 120, 550, 720);
    
    //window above door
    rect(720,140,160,65);
    
    //blue windowframe
    fill(117, 187, 207);
    rect(705, 120, 15, 115);
    rect(880, 120, 15, 115);
    rect(705, 120, 190, 20);
    rect(705, 205, 190, 20);


    //frontdoor
    rect(705, 245, 190, 755);
    stroke(117, 187, 207);

    //outer part door infill
    strokeWeight(4);
    stroke(44, 70, 78);
    rect(715, 265, 170, 140);
    rect(715, 420, 170, 540);

    //infill door accents
    fill(44, 70, 78);
    rect(720, 270, 160, 130);
    rect(720, 425, 160, 530);

    //doorhandle
    stroke(0);
    strokeWeight(1);
    fill(116, 68, 42);
    rect(840, 650, 50, 20);


    //white border in front of the windows
    fill(255);
    noStroke();

    //top windowsill
    rect(130, 225, 770, 20);

    //white topboard
    rect(700, 61, 200, 60);

    //shading for white elements

    //border main window
    fill(194, 188, 170);
    quad(145, 845, 140, 855, 680, 855, 675, 845);
    quad(685, 230, 135, 230, 145, 240, 675, 240);

    //border for doorframe
    quad(690, 230, 690, 990, 700, 980, 700, 240);
    quad(695, 230, 710, 240, 885, 240, 895, 230);
    quad(690, 230, 690, 125, 700, 135, 700, 220);

    //border top board
    quad(135, 70, 895, 70, 885, 80, 145, 80);
    quad(135, 110, 895, 110, 885, 100, 145, 100);
    stroke(0);
  }
}
