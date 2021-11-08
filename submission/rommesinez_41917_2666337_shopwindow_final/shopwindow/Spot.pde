class Spot {
  float X = random(width); 
  float Y = random(height);
  }

  void grow() {
    fill (255, 0, 0);
    ellipse(X, Y, 100, 100);
  }
