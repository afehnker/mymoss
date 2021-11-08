class Standinglamp {
  float x;
  float y;

  color c;

  Standinglamp(float posX, float posY) {
    x = posX;
    y = posY;
    c=color(255, 253, 188); //lamp color when it's off
  }

  void display() {
    //three lamps are drawn
    strokeWeight(1);

    //lamp 1 (right)
    //lamp foot
    fill(200, 154, 107);                      
    rect(x-110, y+100-47, 8, 60);
    fill(193, 154, 107);
    rect(x+194-310, y+155-47, 20, 5);
    //light part
    fill(c);
    arc(x+207-310, y+112-47, 80, 80, PI, TWO_PI);
    line(x+168-310, y+111-47, x+246-310, y+111-47);

    //lamp 2 (center)
    //lamp foot
    fill(193, 154, 107);              
    rect(x+53-310+20, y+100-47, 5, 60);
    fill(193, 154, 107);
    rect(x+45-310+20, y+155-47, 20, 5);
    //light part
    fill(c);
    beginShape();
    vertex(x+67-310+20, y+60-47);
    vertex(x+47-310+20, y+60-47);
    vertex(x+30-310+20, y+130-47);
    vertex(x+82-310+20, y+130-47);
    endShape(CLOSE);

    //lamp 3 (left)
    //lamp foot
    fill(193, 154, 107);              
    rect(x-91-310+40, y+100-47, 15, 60);
    fill(193, 154, 107);
    rect(x-100-310+40, y+153-47, 33, 8);
    //light part
    fill(c);
    beginShape();
    vertex(x-63-310+40, y+80-47);
    vertex(x-103-310+40, y+80-47);
    vertex(x-120-310+40, y+130-47);
    vertex(x-48-310+40, y+130-47);
    endShape(CLOSE);
  }


  void light() {
      if (c==color(255, 253, 188)) {     //if off, change color to on
        c=color(255, 255, 0);            //lamp color when it's on
      } else {                           //viceversa
        c=color(255, 253, 188);
      }
  }
}
