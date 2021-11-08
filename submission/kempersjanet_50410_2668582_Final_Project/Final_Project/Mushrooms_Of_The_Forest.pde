class Mushroom

{
  float mushX;
  float mushY;

  color mushroomColor;

  Mushroom(float initX, float initY) {
    mushX = initX;
    mushY = initY;
    mushroomColor = color (255, 0, 0);
  }

  void display() {
    noStroke();
    fill(230);

    //foundation
    rect(mushX, mushY, 250, 200);

    //door
    fill(180);
    rect(mushX, mushY+65, 50, 70);

    //roof
    fill(mushroomColor);
    ellipse(mushX-100, mushY-120, 210, 210);
    ellipse(mushX+100, mushY-120, 210, 210);
    ellipse(mushX, mushY-220, 210, 210);

    //white spots
    fill(255);
    ellipse(mushX-140, mushY-100, 100, 120);
    ellipse(mushX, mushY -200, 80, 100);
    ellipse(mushX+90, mushY-140, 120, 90);
  }
}
