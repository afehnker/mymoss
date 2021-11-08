/*
Shopwindow by Wieger Wittrock, group 1.
 31-10-2021
 This interactive shopwindow has elements of the real shop "By Jan Marc" in Hengelo
 */
class Window { //class that manages the window and all the classes that are related to the window, like the crack and crowbar classes

  int statusWindow;//random variables so not created in the update function
  int opacityWindow; //if the windows breaks, then the opacity will get lower so it looks smooth
  boolean startsBreaking; //boolean tho check the current status of the breaking animation
  boolean isBroken;
  ArrayList<Crack> crack; //array list that will contain all the cracks, when the cracks are added to the array
  Crowbar crowbar; //the crowbar
  PImage slogan; //slogan image
  float sloganY; //we make a variable for the slogan, so it will go down with the cracks

  Window() {
    statusWindow = int(random(10, 15)); //the window has a random amount of hit it can take before breaking
    opacityWindow = 230; //start values
    crack = new ArrayList<Crack>(); //initialise the array list of class Crack
    crowbar = new Crowbar(); //initialise
    isBroken = false;//give start values
    startsBreaking = false;
    sloganY = 500;
    slogan = loadImage("slogan.png"); //load the image, made in paint3D
  }

  void display() {   
    if (!isBroken) {
      fill(179, 209, 227, opacityWindow);
      rect(width/2, height/2, width, height-30); //the glass window       
      for (Crack current : crack) { //this for loops goes through every object of the class Crack, and then displayes it
        current.display();
      }
    }
    if (startsBreaking && opacityWindow > 30) { //if the window has enough cracks and the opacity of the window is low, the it will display a very giant crack
      fill(179, 209, 227, opacityWindow);
      stroke(0, opacityWindow);
      quad(0, 20, 123, 95, 435, 435, 0, 100);
      quad(0, 300, 435, 435, 234, 413, 0, 400);
      quad(0, 885, 235, 645, 435, 435, 150, 885);
      quad(350, 885, 400, 700, 435, 435, 450, 885);
      quad(700, 885, 650, 800, 435, 435, 800, 885);
      quad(800, 600, 650, 534, 435, 435, 800, 550);
      quad(800, 400, 750, 420, 435, 435, 800, 350);
      quad(800, 150, 500, 400, 435, 435, 800, 100);
      quad(600, 15, 550, 100, 435, 435, 500, 15);
    }

    image(slogan, -100, sloganY, 500, 500);
    crowbar.display(); //display the crowbar above the glass
  }


  void update() {
    if (startsBreaking) {
      opacityWindow -= 2; //the cracks/crowbar/slogan will drop when the window starts breaking
      sloganY +=10;
      crowbar.crowbarY += 15; //the crowbar drops faster, since it is heavier
      for (Crack current : crack) { //this for loops goes through every object of the class Crack, and makes the cracks move down
        current.yPosition += 10;
      }
    }
    if (opacityWindow <= 20) { //glass is completetly broken
      startsBreaking = false;
      isBroken = true;
    }
  }

  void crack(float mouseXParameter, float mouseYParameter) {//parameters for mouseX and mouseY, called eventually in mousePressed
    statusWindow -= 1; //the glass loses one "healtpoints" when the crowbar hits it
    crowbar.rotateForward(); //the crowbar strikes!
    if (statusWindow <= 0) {//window starts breaking when it is hit enough times
      startsBreaking = true;
    } 
    if (!startsBreaking) {
      crack.add(new Crack(mouseXParameter, mouseYParameter)); //we make a new object of the class Crack
    }
  }

  void rotateCrowbarBack() {//rotate the crowbar back when the mouse is released
    crowbar.rotateBack();
  }

  void crowbarMove(float mouseXParameter, float mouseYParameter) { //move the crowbar, parameters for mouseX and mouseY, called eventually in mouseMoved
    if (!startsBreaking) { //you cannot move the crowbar anymore when the window starts breaking, the job is already done then
      crowbar.moveCrowbar(mouseXParameter, mouseYParameter);
    }
  }
}
