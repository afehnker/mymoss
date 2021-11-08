class Background2 {    

  float background2X;    
  float background2Y;    
  float background2W;    
  float background2H;    

  Background2 (float initX, float initY, float initW, float initH) {    
    background2X = initX;    
    background2Y = initY;    
    background2W = initW;    
    background2H = initH;
  }    

  void display() {
    //Background2

    //Windows
    fill(189, 189, 189);
    rect(background2X, background2Y, background2W, background2H); 
    fill(0, 0, 0);
    rect(background2X +20, background2Y +20, background2W -125, background2H -40);
    rect(background2X +105, background2Y +20, background2W -125, background2H -40);

    fill(189, 189, 189);
    rect(background2X +400, background2Y, background2W, background2H);
    fill(0, 0, 0);
    rect(background2X +420, background2Y +20, background2W -125, background2H -40);
    rect(background2X +505, background2Y +20, background2W -125, background2H -40);

    fill(189, 189, 189);
    rect(background2X +800, background2Y, background2W, background2H);
    fill(0, 0, 0);
    rect(background2X +820, background2Y +20, background2W -125, background2H -40);
    rect(background2X +905, background2Y +20, background2W -125, background2H -40);

    fill(189, 189, 189);
    rect(background2X +1200, background2Y, background2W, background2H);
    fill(0, 0, 0);
    rect(background2X +1220, background2Y +20, background2W -125, background2H -40);
    rect(background2X +1305, background2Y +20, background2W -125, background2H -40);

    //Floor 
    fill(124, 185, 232);
    rect(background2X -200, background2Y +325, background2W +1600, background2H);
    fill(99, 148, 186);
    rect(background2X -200, background2Y +525, background2W +1600, background2H +125);
    fill(0, 0, 0);
    rect(background2X -200, background2Y +526, background2W +1600, background2H -190);

    //Chest
    stroke(1);
    fill(255, 255, 255);
    rect(background2X -100, background2Y +280, background2W +200, background2H -125);
    rect(background2X -100, background2Y +355, background2W +200, background2H -125);
    rect(background2X -100, background2Y +430, background2W +200, background2H -105);
    rect(background2X -120, background2Y +260, background2W +240, background2H -180);
    rect(background2X, background2Y +280, background2W -100, background2H -190);
    rect(background2X, background2Y +355, background2W -100, background2H -190); 
    rect(background2X, background2Y +430, background2W -100, background2H -190);

    //Pole 1
    rect(background2X +700, background2Y +200, background2W -190, background2H +100);
    rect(background2X +670, background2Y +500, background2W -190, background2H -170);
    rect(background2X +730, background2Y +500, background2W -190, background2H -170);
    rect(background2X +670, background2Y +500, background2W -130, background2H -190);
    rect(background2X +660, background2Y +210, background2W -190, background2H -180);
    rect(background2X +740, background2Y +210, background2W -190, background2H -180);
    rect(background2X +650, background2Y +200, background2W -90, background2H -190);
    noStroke();
    fill(255, 0, 0);
    rect(background2X +640, background2Y +230, background2W -150, background2H -150);
    rect(background2X +650, background2Y +280, background2W -170, background2H -190);
    rect(background2X +660, background2Y +290, background2W -190, background2H -195);
    rect(background2X +720, background2Y +230, background2W -150, background2H -150);
    rect(background2X +730, background2Y +280, background2W -170, background2H -190);
    rect(background2X +740, background2Y +290, background2W -190, background2H -195);


    //Pole 2
    stroke(1);
    fill(255, 255, 255);
    rect(background2X +1100, background2Y +200, background2W -190, background2H +100);
    rect(background2X +1070, background2Y +500, background2W -190, background2H -170);
    rect(background2X +1130, background2Y +500, background2W -190, background2H -170);
    rect(background2X +1070, background2Y +500, background2W -130, background2H -190);
    rect(background2X +1060, background2Y +210, background2W -190, background2H -180);
    rect(background2X +1140, background2Y +210, background2W -190, background2H -180);
    rect(background2X +1050, background2Y +200, background2W -90, background2H -190);
    noStroke();
    fill(255, 0, 0);
    rect(background2X +1040, background2Y +230, background2W -150, background2H -150);
    rect(background2X +1050, background2Y +280, background2W -170, background2H -190);
    rect(background2X +1060, background2Y +290, background2W -190, background2H -195);
    rect(background2X +1120, background2Y +230, background2W -150, background2H -150);
    rect(background2X +1130, background2Y +280, background2W -170, background2H -190);
    rect(background2X +1140, background2Y +290, background2W -190, background2H -195);
  }
}
