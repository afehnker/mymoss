// this class is used as particles. alpha automaticly decreases, if the alpha reaches 0 they are reset

class leaf {
  PVector pos; // the position  
  PVector fall; // how much the position changes
  float size;
  float alpha; // the transparansy of the particles
  color greenShade; //is used to make a shade of green

  leaf(float initX, float initY) {
    pos = new PVector(initX, initY);
    fall = new PVector(random(-3, 1), random(1, 0.1));
    size = random(25);
    alpha = random(15, 50);
    greenShade = color(random(25, 100), random(100, 200), random(25, 100));
  }


  void display() {
    noStroke();
    fill(greenShade, alpha);
    ellipse(pos.x, pos.y,size,size);
  }
  
  // is used in applying change to particles and reseting them when alpha reaches 0
  void update(){
    if (alpha > 1){
     alpha = alpha -1;
     pos.add(fall);
    } else{
      int randomSelect = int(random(3));
      pos.x = random(plants[randomSelect].posPlant.x-20,plants[randomSelect].posPlant.x+20);
      pos.y = random(plants[randomSelect].posPlant.y-20,plants[randomSelect].posPlant.y+20);
      alpha = random(15,50);
    }
  }

}
