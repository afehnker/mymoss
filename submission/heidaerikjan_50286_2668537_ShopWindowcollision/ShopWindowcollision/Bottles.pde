class Bottle {

  //Position variables
  float posX; 
  float posY = height / 2;

  //Speed variables
  float speedX = 0;
  float speedY = 0;

  //Gravitational speed variable
  float vyBottle = 0;

  //Gravitational acceleration variable
  float g = 0.0981;

  //Collision diameter of object variable
  float diameter;

  //Amount of objects variable
  int id;

  //Satus ok or broken
  boolean broken = false;


  //To be able to give each object it's own speed and location
  Bottle[] others;

  //Collect variables from the array in the main
  Bottle(float xin, float yin, float din, int idin, Bottle[] oin) {
    posX = xin;
    posY = yin;
    diameter = din;
    id = idin;
    others = oin;
  }


  void display() {
    //Display the object image
    imageMode(CENTER);
    if (broken)
    {
      image(brokenBottle, posX, posY, 60, 150);
    } else
    {
      image(wine, posX, posY, 60, 150);
    }
    imageMode(CORNER);
  }


  void collide() {

    //Collision between similar objects
    for (int i = 0; i < 10; i++) {
      if (i!=id){
        float dx = others[i].posX - posX;
        float dy = others[i].posY - posY;
        float distance = sqrt(dx*dx + dy*dy);
        float minDistance = others[i].diameter/2 + diameter/2;
        if (distance < minDistance) {
          float angle = atan2(dy, dx);
          float targetX = posX + cos(angle) * minDistance;
          float targetY = posY + sin(angle) * minDistance;
          float ax = (targetX - others[i].posX) * bounce;
          float ay = (targetY - others[i].posY) * bounce;
          speedX -= 0.5*ax;
          speedY -= 0.5*ay;
          others[i].speedX += ax;
          others[i].speedY += ay;
          if (abs(others[i].speedX)+abs(speedX)>60)
          {
            broken = true;
          }
        }
      }
    }
  }

  void update() {

    //If the position is on the surface, stop gravitational acceleration and speed.
    if (posY < height-75) {
      vyBottle += g;
      posY += vyBottle;
    }

    // Object bounces back if it's outside the area.
    if (posX > width-100 || posX <= 100) {
      if (abs(speedX)>20)
      {
        broken = true;
      }
      speedX = -0.5*speedX;
    }

    if (posY > height-75 || posY <= 580) {
      speedY = -0.5*speedY;
      vyBottle = 0;
    }

    //When mousekey is pressed when ontop of object, move the object with the mouse. Also sets speed when mousebutton is released.
    if (mousePressed) {
      if ((mouseX > (posX - 30) && mouseX < (posX + 30)) &&
        (mouseY > (posY - 75) && mouseY < (posY + 75))) {
        posX = mouseX;
        posY = mouseY;  
        vyBottle = 0;

        speedX = mouseX - pmouseX;
        speedY = mouseY - pmouseY;
      }
    }

    // Calculate the new position
    posX = posX + speedX;
    posY = posY + speedY;

    // Adds friction
    speedX = speedX * 0.98;
    speedY = speedY * 0.98;
  }
}
