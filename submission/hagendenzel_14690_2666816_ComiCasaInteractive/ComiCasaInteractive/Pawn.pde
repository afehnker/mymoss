class Pawn {
  Point p;
  color colour;
  color line;
  int square;
  
  Pawn(float posX, float posY, int player) {
    p = new Point(posX, posY);
    square = -1;
    switch(player) {
      case 1: 
        colour = color(255,0,0);
        line = color(200,0,0);
        break;
      case 2: 
        colour = color(0,255,0);
        line = color(0,200,0);
        break;
      case 3: 
        colour = color(0,0,255);
        line = color(0,0,200);
        break;
      case 4: 
        colour = color(255,0,255);
        line = color(200,0,200);
        break;
      case 5: 
        colour = color(255,255,0);
        line = color(200,200,0);
        break;
      case 6: 
        colour = color(0,255,255);
        line = color(0,200,200);
        break;
      default: break;
    }
    
  }
  
  void display() {
    pushMatrix();
    translate(p.getX(),p.getY());
    fill(colour);
    stroke(line);
    triangle(-15,0,0,-40,15,0);
    circle(0,-40,20);
    
    popMatrix();
  }
  
  void update() {
    p.update();
  }
  
  void setTarget(float x, float y) {
    p.setTarget(x,y);
  }
  
  void setSquare(int square) {
    this.square = square;
  }
  
  int getSquare() {
    return square;
  }
  
  boolean onTarget() {
    return p.onTarget(); 
  }
}
