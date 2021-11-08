// Class For the cog, animating and rotating the cog's
class Cog {


  float rearCogSizeX, rearCogSizeY, rearCogPosX, rearCogPosY, frontCogSizeX, frontCogSizeY;
  float angle ;                                                                                          //global variables for class cog
  float frontCogAngle;
  float secondTickAngle;

  Cog() {
    rearCogSizeX =int(110.4);
    rearCogSizeY =int(82.6);
    frontCogSizeX =int(160);                  //constructor of class clock that sets the values/sizes of the cogs
    frontCogSizeY =int(120);
  }

  void display() {
    pushMatrix();
    imageMode(CENTER);
    smooth();
    // cog1
    translate(rearCogPosX, rearCogPosY-50);
    rotate(angle);                                                    //display cog1
    cogImage.resize(int(rearCogSizeX), int(rearCogSizeY));
    image(cogImage, 0, 0);
    popMatrix();
    //cog2
    pushMatrix();
    translate(rearCogPosX+50, rearCogPosY-10);
    rotate(angle);                                                  //display cog2
    image(cogImage, 0, 0);
    popMatrix();
    //cog3
    pushMatrix();
    translate(rearCogPosX+30, rearCogPosY+50);
    rotate(angle);
    image(cogImage, 0, 0);                                        //display cog3
    popMatrix();
    //cog4
    pushMatrix();
    translate(rearCogPosX-30, rearCogPosY+50);
    rotate(angle);                                                //display cog4
    image(cogImage, 0, 0);
    popMatrix();
    //cog5
    pushMatrix();
    translate(rearCogPosX-50, rearCogPosY-10);
    rotate(angle);                                                    //display cog5
    image(cogImage, 0, 0);
    popMatrix();
    //cogBIG
    pushMatrix();
    translate(rearCogPosX, rearCogPosY+5);
    rotate(frontCogAngle);                                              //displays the big cog in the front
    frontCogImage.resize(int(frontCogSizeX), int(frontCogSizeY));
    image(frontCogImage, 0, 0);
    popMatrix();
  }

  void cogMovment(float rotationSpeed, float rotationSpeedBig) {
    angle += rotationSpeed;                                              //manages the rotation of the cogs
    frontCogAngle += rotationSpeedBig;
  }
}

//END OF COG
