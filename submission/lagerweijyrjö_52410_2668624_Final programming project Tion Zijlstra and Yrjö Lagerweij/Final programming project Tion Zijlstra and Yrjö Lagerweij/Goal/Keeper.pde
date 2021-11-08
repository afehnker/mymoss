class Keeper {
  PImage keeperRight;
  PImage keeperLeft;
  PImage gloveLeft;
  PImage gloveRight;

  Keeper(int initX, int initY) {
    xKeeper= initX;
    yKeeper=initY;
  }

  void display() {
    imageMode(CORNER);
    keeperRight=loadImage("keeperright.png"); // Used to load the right shoe
    keeperLeft=loadImage("keeperleft.png");//Used to load the left shoe
    gloveLeft=loadImage("gloveleft.png");//Used to load the left glove
    gloveRight=loadImage("gloveright.png");//Used to load the right glove

    //Hitbox of the keeper's arms and hands
    handX1 = xKeeper-80;
    handX2 = xKeeper+80;
    handTop = yKeeper-110;
    handBottom = yKeeper-90;

    //Hitbox of the keeper's body, head, legs and shoes.
    bodyX1 = xKeeper-40;
    bodyX2 = xKeeper+40;
    bodyTop = yKeeper-150;
    bodyBottom = yKeeper+5;

    fill(0, 0, 255);//Blue for the pants
    rect(xKeeper-13, yKeeper-55, 10, 40); //Left leg
    rect(xKeeper+3, yKeeper-55, 10, 40); //Right leg

    fill(0);//Black for the shirt
    rect(xKeeper-10, yKeeper-100, 20, 50);//Torso
    rect(xKeeper-40, yKeeper-100, 30, 10);//Left arm
    rect(xKeeper+10, yKeeper-100, 30, 10);//Right arm

    image(gloveLeft, xKeeper-70, yKeeper-110); //Left glove
    image(gloveRight, xKeeper+40, yKeeper-110); //Right glove

    fill(#FFDBAC); //Skin color
    ellipse(xKeeper, yKeeper-120, 30, 40); //head

    fill(#F8FC05);//yellow for hair
    triangle(xKeeper-25, yKeeper-120, xKeeper-10, yKeeper-140, xKeeper, yKeeper-140); //Left hair pluck
    triangle(xKeeper+25, yKeeper-120, xKeeper+10, yKeeper-140, xKeeper, yKeeper-140); //Right hait pluck

    fill(255); //white for the eye
    ellipse(xKeeper-5, yKeeper-130, 8, 8);//Left eye
    ellipse(xKeeper+5, yKeeper-130, 8, 8);//Right eye

    fill(0); //black for iris
    ellipse(xKeeper-5, yKeeper-130, 2, 2);//Left iris
    ellipse(xKeeper+5, yKeeper-130, 2, 2);//Right iris

    fill(255, 0, 0); //red for lips
    arc(xKeeper, yKeeper-115, 20, 20, 0, PI, CHORD);//lips

    image(keeperRight, xKeeper, yKeeper-20, 40, 40);// The right shoe
    image(keeperLeft, xKeeper-38, yKeeper-20, 40, 40);// The left shoe
  }

  void movementKeeper() {
    xKeeper+= xMovement; // making the keeper move around the goal
    if (xKeeper<= 200 || xKeeper>=600) {
      xMovement= -xMovement; //making it so that the keeper doesn't leave his goal.
    }
  }
}
