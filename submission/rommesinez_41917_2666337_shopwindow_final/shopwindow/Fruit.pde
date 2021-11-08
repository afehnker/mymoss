class Fruit { 

  float fruitX = random(width);
  float fruitY = random(-10, 0);
  float yspeed = random(3, 7);

  float angle = 0;
  float angularSpeed = 0.01;

  Fruit(float initX, float initY) {
    fruitX = initX;
    fruitY = initY;
  }

  void fall() {
    fruitY = fruitY +yspeed;
    if (fruitY> height) {
      fruitY = random(0.1, 3);
    }
  }

  void fruit() {
    //lemon
    noStroke();
    fill(255, 255, 102);
    ellipse(fruitX, fruitY, 55, 40);
    triangle(fruitX, fruitY+20, fruitX+3, fruitY-20, fruitX+35, fruitY);
    //pineapple
    noStroke();
    fill(255, 153, 51);
    ellipse(fruitX+100, fruitY+100, 80, 100);
    fill(76, 153, 0);
    triangle(fruitX+90, fruitY+50, fruitX+110, fruitY+50, fruitX+100, fruitY-5);
    triangle(fruitX+90, fruitY+50, fruitX+110, fruitY+50, fruitX+80, fruitY-5);
    triangle(fruitX+90, fruitY+50, fruitX+110, fruitY+50, fruitX+120, fruitY-5);
  }

  void water() {
    stroke(0, 128, 255, 70);
    line(fruitX+50, fruitY, fruitX+47, fruitY+30);
    ellipse(400, 400, 500, 500);
  }
}
