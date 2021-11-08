class Moon {
  float xPos;
  float yPos;
  float radian;
  color moonColor;

  float flareAlpha = 128;  
  Moon() { 
    xPos = width/2+590;
    yPos = height/2-260;
    radian = 150;
    moonColor = color(244, 246, 240);
  }

  void display() {
    //moon
    noStroke();
    fill(moonColor);
    ellipse(xPos, yPos, radian, radian);

    flareAlpha = constrain(flareAlpha + random(-8, 8), 1, 255);


    fill(moonColor, flareAlpha/5);
    for (int i =10; i>0; i--) {
      //flare
      ellipse(xPos, yPos, radian+i*flareAlpha*0.02, radian+i*flareAlpha*0.02);
    }
  }
}
