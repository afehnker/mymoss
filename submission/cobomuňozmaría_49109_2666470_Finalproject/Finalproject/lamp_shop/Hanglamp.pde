class Hanglamp {
  PVector location;    // Location of bulb
  PVector origin;      // Location of arm origin
  float r;             // Length of arm
  float angle;         // Pendulum arm angle
  float velocity;      // Angle velocity
  float acceleration;  // Angle acceleration
  float damping;       // damping amount
  
  SoundFile wind;
  color c;

  Hanglamp(PVector origin_, float r_) {
    origin = origin_;
    location = new PVector();
    r = r_;
    angle = 0;         //initially lamps stay still
    velocity = 0.0;
    acceleration = 0.0;
    damping = 0.995;   //movement slows down over time

    c=color(255);      //off color
  }

  void display() {
    //we use polar coordinates 
    location.set(r*sin(angle), r*cos(angle), 0);
    location.add(origin);

    //The arm
    stroke(0);
    strokeWeight(2);
    line(origin.x, origin.y, location.x, location.y);
    fill(175);

    //The bulb
    strokeWeight(1);
    fill(0);
    rect(location.x-9, location.y-5, 20, 20, 10);
    fill(c);
    ellipse(location.x, location.y+25, 40, 40);
    strokeWeight(1);
    line(location.x-3, location.y, location.x-9, location.y+25);
    strokeWeight(1);
    line(location.x+3, location.y, location.x+9, location.y+25);
    strokeWeight(1);
    line(location.x-9, location.y+25, location.x+9, location.y+25);
    
    float gravity = 0.4;

    //Formula for angular acceleration
    acceleration = (-1 * gravity / r) * sin(angle);

    //Standard angular motion formula
    velocity += acceleration;
    angle += velocity;

    //Apply some damping
    velocity *= damping;
  }

  void movement() {
    angle = PI/4;                 //starting movement angle (widest angle)
  }

void light(int posX, int posY ) {
    if (dist(location.x, location.y+20, posX, posY) < 20) {   //checks if position is within the selected bulb 
      if (c == color(255)) {     //if off, change color to on
        c = color(255, 255, 0);  //on color
      } else {                   //viceversa
        c = color(255);
      }
    }
  }

  void sound() {
    wind = new SoundFile(lamp_shop.this, "wind.mp3");
    wind.play();
  }
}
