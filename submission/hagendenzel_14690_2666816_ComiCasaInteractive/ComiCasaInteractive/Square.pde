class Square {
  color colour;
  int number;
  float rotation;
  float posX;
  float posY;
  
  Square(float x, float y, int num) {
     posX = x;
     posY = y;
     number = num;
     colour = color(random(128,244),random(63,244),random(63,244));
     rotation = random(-PI/8,PI/8);
  }
  
  void display() {
    pushMatrix();
    translate(posX,posY);
    rotate(rotation);
    fill(colour);
    noStroke();
    rectMode(CENTER);
    
    rect(0,0,60,80);
    
    fill(0);
    textSize(40);
    textAlign(LEFT);
    
    if (number <10) {
    text(number, -15 ,30);
    } else if (number <100) {
    text(number, -30 ,30);
    }
    
    popMatrix();
  }
  
  float getX() {
    return posX;
  }
  
  float getY() {
    return posY+30;
  }
}
