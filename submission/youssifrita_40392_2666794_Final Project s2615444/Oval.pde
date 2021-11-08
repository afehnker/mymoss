//Class made by Rita Youssif s2615444 for the final project for the subject programming. 
//Purpose: shows ovals bouncing up and down for a visual addition.
//Disclaimer: all images used are from Google images and used for educational purposes. 

class Oval {
  float x; 
  float y; 
  float dx; 
  float dy;

  Oval(float initX, float initY) {
    color(255, 215, 0);
    x = initX; 
    y = initY; 
    dy = random(2, 3);          // Controls the inital speed an oval is given. This can vary between 2 and 3. 
  }

  void display() {
    fill(255, 215, 0);
    ellipse(x+60, y, 10, 20);
  }

  void move() {          // Allows movement to happen. Whenever the if-statement conditions are met the dy value that controls the speed turns negative which makes the oval return. 
    y+= dy; 

    if (y >890) {
      dy = -dy;
    }
    if (y < 0) {
      dy = -dy;
    }
  }
}
