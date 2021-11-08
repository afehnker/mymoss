/*
Shopwindow by Wieger Wittrock, group 1.
 31-10-2021
 This interactive shopwindow has elements of the real shop "By Jan Marc" in Hengelo
 */

class Clothes { //this class manages the tshirts, it is called in the Locker class

  float clothesX; //global variables, these are used in multiple methods
  float clothesY;
  boolean grabbedTshirt; //booleands to check if the tshirt is: grabbed, hanged on the locker, inside the locker
  boolean hangedTshirt;
  boolean isInDoor;
  float tshirtSize; //size and rotation change when put in the locker door
  float rotation;
  float tshirtToMouseOffsetX; //we use variables to store the offset to the mouse, we use this when you drag a tshirt
  float tshirtToMouseOffsetY;
  float bounceSpeedX; //speed of which the shirt bounces of the walls
  float bounceSpeedY;
  color clothesColor; //the firts color is red and given in the Locker class, but when you change the color then it is changed in here

  Clothes(int initialClothesX, int initialClothesY, color initialColor) { //constructor
    clothesX = initialClothesX; //values given in the Locker class (used as an array of thsirts)
    clothesY = initialClothesY;
    clothesColor = initialColor;

    grabbedTshirt = false;
    hangedTshirt = false;
    isInDoor = false;
    tshirtSize = 1;
    rotation = 0;
  }


  void display() {
    pushMatrix(); //we use push and popmatrix
    translate(clothesX, clothesY); //the new middle 
    scale(tshirtSize);
    rotate(rotation);
    strokeWeight(2);
    noFill();
    arc(0, -5, 10, 10, radians(90), radians(360)); //the hook, I use radians() because I find that easier to work with
    fill(238, 217, 183); //the wooden clothes hanger
    strokeWeight(1);
    triangle(0, 0, 30, 20, -30, 20);

    //t-shirt
    fill(clothesColor); //the tshirt color is a variable since we want to be able to change the color
    noStroke();
    quad(-35, 10, -35, 120, 35, 120, 35, 10);
    quad(-35, 10, -55, 25, -45, 50, -35, 40);
    quad(35, 10, 55, 25, 45, 50, 35, 40);
    stroke(0);
    popMatrix(); //end the push and pop matrix
  }

  void update() {  
    if (!grabbedTshirt && !hangedTshirt && !isInDoor) { //when the tshirt is not moving: it is in the locker door, grabbed or hanged up, then it should fall 
      bounceSpeedY += 0.8; //otherwise it will slightly go down, this makes the trow smooth
    }
    if (!grabbedTshirt && ((clothesX >=210 && clothesX <= 330 && clothesY <= 390 && clothesY >= 350) || (clothesX >=470 && clothesX <= 590 && clothesY <= 390 && clothesY >= 350))) {   
      //you can hang the shirt at the hangers
      clothesY = 379; //it will pop to the correct Yposition when the shirt is let go near a hanger
      hangedTshirt = true; //we use this later
    }
    if (hangedTshirt) { //do not move when the tshirt is hanged
      bounceSpeedX = 0;
      bounceSpeedY = 0;
    }

    if (isInDoor && tshirtSize > 0.0001) { //>0.001 so it will not shrink forever and explode the program
      bounceSpeedX = 0;
      bounceSpeedY = 0;
      tshirtSize *=0.9; //it will dissapear in the mysterious locker...
      rotation += 0.7;
    } else {
      clothesX = clothesX + bounceSpeedX; //the shirt gets the speed of your throw, when you trow it
      clothesY = clothesY + bounceSpeedY;
    }

    if ((clothesX > width - 10 && bounceSpeedX > 0) || (clothesX < 10 && bounceSpeedX < 0)) {
      bounceSpeedX = -bounceSpeedX; //the shirt bounces of the walls, which are the end of the canvas size
    }
    if ((clothesY > width - 10 && bounceSpeedY > 0) || (clothesY < 10 && bounceSpeedY < 0)) {
      bounceSpeedY = -bounceSpeedY;
    }
  }

  void dragTshirt(float mouseXParameter, float mouseYParameter) { //we carry the mouseX and mouseY values to the main tab, that's why we use parameters
    if (grabbedTshirt && mouseXParameter < 800 && mouseXParameter > 0 && mouseYParameter < 900) { //cannot drag shirts offsreen, except the top since they will fall back anyway.
      hangedTshirt = false;
      clothesX = int(mouseXParameter + tshirtToMouseOffsetX); //the thsirt follows the mouse, but with a offset
      clothesY = int(mouseYParameter + tshirtToMouseOffsetY); 
      //by using a offset variable for the mouse, the shirt does not pop to the mouse location when first dragged, that looks bad,
      //now it looks good
    }
  }

  boolean nearTshirt(float mouseXParameter, float mouseYParameter) { //we carry the mouseX and mouseY values to the main tab, that's why we use parameters
    //we use this boolean method, to check if the mouse is near the tshirt, in the Locker class
    if (dist(mouseXParameter, mouseYParameter, clothesX, clothesY) <= 50) { //you are able to drag the tshirt if the mouse is close
      return true;
    } else {
      return false;
    }
  }

  void selectTshirt(float mouseXParameter, float mouseYParameter) { //we carry the mouseX and mouseY values to the main tab, that's why we use parameters
    //you can select the tshirt you want to drag, this method is eventually called in MousePressed in the main tab, it uses mouseX and mouseY  
    grabbedTshirt = true;
    tshirtToMouseOffsetX = int(clothesX - mouseXParameter); //we calculate the offset, so you can drag the tshirt without it jumping to the mouse position (which looks weird)
    tshirtToMouseOffsetY = int(clothesY - mouseYParameter);
    bounceSpeedX = 0; //if you select a tshirt, it stops bouncing off walls
    bounceSpeedY = 0;
  }

  void releaseTshirt(float mouseXParameter, float mouseYParameter, float previousMouseXParameter, float previousMouseYParameter) {
    //this method is eventually called in MouseReleased in the main tab, it uses the current and previous mouse positions 
    //to calculate a speed which we assign to the selected tshirt. So you can throw it.

    if (grabbedTshirt) {
      bounceSpeedX = mouseXParameter - previousMouseXParameter; 
      bounceSpeedY = mouseYParameter - previousMouseYParameter;
      grabbedTshirt = false; //you are no longer grabbing the tshirt if you release the mouse button
    }
  }

  void changeColor() { //this is called in the Locker class when the locker door is opening
    if (isInDoor) {
      isInDoor = false; //only change color once, because of this bool
      clothesColor = color(random(0, 255), random(0, 255), random(0, 255)); //change color when the shirt comes out the locker
      rotation = 0; //normal size and rotation
      tshirtSize =1;
      bounceSpeedX = random(-20, 20); //random speed out of the locker
      bounceSpeedY = random(-40, -70);
    }
  }

  void resetPositionTshirts() {
    clothesX = int(random(220, 320)); //reset the position, but not change the colors!
    clothesY =  379;
    isInDoor = false; //we also reset these variables, in case the user presses reset when there are tshirts inside the locker
    rotation = 0;
    tshirtSize = 1;
  }
}
