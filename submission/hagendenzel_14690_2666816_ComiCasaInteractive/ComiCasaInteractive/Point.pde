/**
 This class will control the moving points for the pawns
 **/
class Point {
  final float SPEED = 20;

  float posX;
  float posY;
  float targetX;
  float targetY;

  public Point(float x, float y) {
    posX = x;
    posY = y;
    targetX = x;
    targetY = y;
  }

  void update() {
    if (!onTarget()) {
      float direction = direction();
      float speedX = 0;
    float speedY = 0;
      speedX = SPEED * cos(direction-PI/2);
      speedY = SPEED * sin(direction-PI/2);
    posX = posX + speedX;
    posY = posY + speedY;
    }
  }

  boolean onTarget() {
    return dist(posX, posY, targetX, targetY)<SPEED;
  }

  // this method will find the direction in radians of the target point from current point.
  float direction() {
    float distX = posX - targetX; //horizontal distance
    float distY = posY - targetY; //vertical distance
    //return -atan(distX/distY); //then use the right angle and inv tan to calculate angle
    float angle = atan(distX/distY);
    if (distY < 0) {
      angle = angle + PI;        //here we add PI if the mouse is below the point, because otherwise the angle flips.
    }
    println(angle);
    return -angle;
  }
  
  void setTarget(float x, float y) {
    targetX = x;
    targetY = y;
  }
  
  float getX() {
    return posX;
  }
  
  float getY() {
    return posY;
  }
}
