class houseBackground
{
  PImage backgroundImg;

  //flames on candleholder
  fire leftFlame;
  fire middleFlame;
  fire rightFlame;

  //flames in fireplace
  fire fireplaceFlameLeft;
  fire fireplaceFlameMiddle;
  fire fireplaceFlameRight;


  houseBackground()
  {
    backgroundImg = loadImage("geppettohouse.png"); //this is a drawing made in paint

    leftFlame = new fire(1062, 210, 20, 0.01, 0.005); //the flames dont move in sync
    middleFlame = new fire(1100, 230, 20, 0.008, 0.004);
    rightFlame = new fire(1138, 210, 20, 0.012, 0.006);

    fireplaceFlameLeft = new fire(412, 370, 15, 0.03, 0.0015);
    fireplaceFlameMiddle = new fire(430, 370, 25, 0.04, 0.001); //middle flame is a bit bigger
    fireplaceFlameRight = new fire(449, 370, 15, 0.025, 0.0011);
  }

  void DrawBackground()
  {
    image(backgroundImg, 0, 0);
    fill(0, 50); //draws a dark rectangle that covers the entire screen to darken the background and then make the foreground clearer
    rect(0, 0, width, height);

    DrawCandle();

    leftFlame.DrawFlame();
    middleFlame.DrawFlame();
    rightFlame.DrawFlame(); 

    fireplaceFlameRight.DrawFlame();
    fireplaceFlameMiddle.DrawFlame();
    fireplaceFlameLeft.DrawFlame();
  }

  void DrawCandle() //draws the candle and the candleholder to attach the deadly fire to
  {
    color gold = color(225, 183, 69);
    color darkGold = color(183, 152, 67);
    pushMatrix();
    translate(1100, 500);

    //foot
    noStroke();
    fill(darkGold);
    ellipse(0, 10, 70, 35);

    fill(gold);
    ellipse(0, 4, 60, 30);

    fill(darkGold);
    ellipse(0, -5, 20, 10);

    //pole
    stroke(gold);
    strokeWeight(5);
    line(0, -6, 0, -210);

    //leftbranch
    noStroke();

    //middlepart
    bezier(-40, -220, -20, -180, 20, -180, 40, -220);
    fill(gold);
    ellipse(0, -218, 80, 12);

    //top candles (from left to right)
    stroke(gold);
    line(-38, -220, -38, - 290);
    line(0, -220, 0, - 270);
    line(38, -220, 38, - 290);
    stroke(255);
    strokeWeight(7); //the candle is a bit thicker than the holder
    line(-38, -260, -38, -290);
    line(0, -240, 0, - 270);
    line(38, -260, 38, - 290);
    popMatrix();
  }
}
