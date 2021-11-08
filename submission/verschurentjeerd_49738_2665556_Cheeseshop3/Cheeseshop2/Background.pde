//In this file I put all the stuff that is displayed, but does not have a function. 
//Such as the cupboard, the background, the table etc. I called this the Background.


class Background {
  float xPos;
  float yPos;
  float cheeseWidth;
  float cheeseHeight;

  Background(float xPos, float yPos) {
    cheeseWidth = 80;
    cheeseHeight = 30;
  }
  
  //This is the array for the wall in the back with the cheeses. 
  void shopBackground() {
    background(255);
    rectMode(CORNER);
    fill(#E5F7FF);
    rect(0, 0, width, 800 + cheeseHeight);
    rectMode(CENTER);
    for (int x = 0; x<14; x++) {
      for (int y = 0; y<9; y++) {
        stroke(100);
        fill(#FFF5AF);
        rect(50 + 100*x, 100*y, cheeseWidth, cheeseHeight, cheeseHeight/2);
        line(0, cheeseHeight/2 + 100*y, width, cheeseHeight/2 + 100*y);
        line(0, cheeseHeight + 100*y, width, cheeseHeight + 100*y);
      }
    }
    line(0, height/2+0.4*height, width, height/2+0.4*height);
  }
}

//This is the stand in the middle of the room, with a few cheeses on it. 
void cheeseStand() {
  float xStand = width/2;
  float yStand = 800;
  float standWidth = 180;
  float standHeight = 162;
  rectMode(CENTER);
  stroke(0);
  fill(#BC9059);
  rect(xStand, yStand, standWidth, standHeight);
  rect(xStand, yStand - 0.8*standHeight, standWidth/10, 0.7*standHeight);
  rect(xStand, yStand - 0.5*standHeight, 1.2*standWidth, standHeight/10);
  fill(#674B2A);
  rect(xStand, yStand, 0.8*standWidth, standHeight/2);
  fill(#BC9059);
  rect(xStand, yStand - 1.2*standHeight, 0.6*standWidth, standHeight/10);
  fill(#FFE940);
  rect(xStand, yStand - 1.2*standHeight - 0.15*standWidth, 0.5*standWidth, 0.2*standWidth, standWidth);
  rect(xStand - 40, yStand - 0.5*standHeight - standWidth/7, standWidth/2, standWidth/5, standWidth); 
  rect(xStand + 45, yStand - 0.5*standHeight - standWidth/6, standWidth/1.5, standWidth/4, standWidth);
}

//This is the table on the left with a few cheeses on it. 
void cheeseTable() {
  float xTable = width/4;
  float yTable = 3.1*height/4;
  float tableWidth = 300;
  float tableHeight = 200;
  float cheeseHeight = 50;
  float cheeseWidth = 100;
rectMode(CENTER);
  stroke(0);
  fill(#BC9059); 
  rect(xTable+tableWidth/2, yTable, tableWidth/10, tableHeight);
  rect(xTable-tableWidth/2, yTable, tableWidth/10, tableHeight);
  rect(xTable, yTable - tableHeight/2, 1.2*tableWidth, tableHeight/10);
  fill(#FFE940);
  rect(xTable, yTable-0.5*tableHeight - 0.5*cheeseHeight - tableHeight/20, cheeseWidth, cheeseHeight, 0.5*cheeseHeight);
  rect(xTable-100, yTable-0.5*tableHeight - 0.5*cheeseHeight - tableHeight/20, cheeseWidth, cheeseHeight, 0.5*cheeseHeight);
  rect(xTable-50, yTable-0.5*tableHeight - 1.5*cheeseHeight - tableHeight/20, cheeseWidth, cheeseHeight, 0.5*cheeseHeight);
}

//This is the front of the shop.
void shopFront() {
  rectMode(CORNER);
  stroke(0);
  fill(100);
  rect(-5, -5, width/2 - 0.4*width + 5, height/2 + 0.4*height + 5);
  rect(width - (width/2-0.4*width), -5, width + 5, height/2 + 0.4*height + 5);
  fill(220);
  rect(-5, -5, width+10, height/1.8-0.5*height + 5);
  rectMode(CENTER);
  strokeWeight(4);
  fill(70);
  rect(width/2, height/1.8-0.42*height, 0.9*width, 0.2*height);
  fill(255);
  textSize(69);
  textAlign(CENTER);
  text("de leckernij", width/2, height/1.8-0.4*height);
}

//This is the cupboard on the left side of the shop.
void cupboard() {
  float xCupboard = 0.82*width;
  float yCupboard = 0.6*height;
  float cupboardWidth = 350;
  float cupboardHeight = 500;
  float plankThickness = 30;

  stroke(0);
  fill(#BC9059);
  rect(xCupboard, yCupboard, cupboardWidth, cupboardHeight);
  rect(xCupboard, yCupboard + plankThickness/2, cupboardWidth - plankThickness*2, cupboardHeight - plankThickness);
  rect(xCupboard - cupboardWidth/2 + plankThickness/2, yCupboard + plankThickness, plankThickness, cupboardHeight);
  rect(xCupboard + cupboardWidth/2 - plankThickness/2, yCupboard + plankThickness, plankThickness, cupboardHeight);
}
