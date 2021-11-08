class Snow {
  //variable declaration
  float x, y, z;
  float span; // drop span
  float ySpeed; // drop speed

  Snow () {
    x  = random(width); //full width rain rop
    y  = random(-1000); //Starts snowflakes from a position above the screen
    z  = random (20); // snowflake spread out for a 3d effect
    span = map(10, 10, 20, 10, 20); //snowflake size
    ySpeed = 0;
  }

  void display() {
    //again an artistic drawing
    strokeWeight(2);
    stroke(255); 
    line(x, y, x, y +  1);
  }
  void dropdown() { 
    ySpeed = ySpeed + random(0.005, 0.001); // Increase speed according to y position
    y = y + ySpeed; // increase speed as y position increases - acceleration effect
    if (y > height) { 
      y = random(0);
      ySpeed = map(z, 0, 20, 3, 5);
    }
  }
}
