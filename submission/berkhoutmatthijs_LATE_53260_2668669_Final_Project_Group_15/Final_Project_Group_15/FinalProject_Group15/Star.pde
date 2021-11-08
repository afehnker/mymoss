class Star {
  
  // declare x,y,color,weight
  float x, y, strokeColor, strokeWeight;
  
  // counter to have a number counting up to infitiy, like a stopwatch
  int counter;

  // constructor star
  Star(float x, float y) {
    this.x = x;
    this.y = y;
    
    // initialize counter for every star at a different time, so each star has a starttime in between 0 and 100, so that each star behaves different than the other
    counter = int(random(0, 100));
  }
  void display() {
    
    // for the star, we modify the black white intensity of the stroke color and the strokeWeight
    stroke(strokeColor);
    strokeWeight(strokeWeight);
    point(x, y);
  }

  void update() {
    // we let the counter being bigger and bigger
    counter +=1;

    strokeColor = 77*sin(counter/40)+177;   // the values of the strokeColor differ between 100 and 255 with a sine wave, little slower
    strokeWeight = 2*sin(counter/20)+2.5;  // the values of the strokeWeight differ between 0.5 and 4.5 with a sine wave, little faster
  }
}
