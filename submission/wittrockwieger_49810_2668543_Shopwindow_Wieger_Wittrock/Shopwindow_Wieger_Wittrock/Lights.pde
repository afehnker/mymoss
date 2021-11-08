/*
Shopwindow by Wieger Wittrock, group 1.
 31-10-2021
 This interactive shopwindow has elements of the real shop "By Jan Marc" in Hengelo
 */
class Lights { //class for the lights, called in the Shop class 

  boolean lightsOn;//used in multiple methods
  color lightOnColor; //cannot be initialised in the display method, because we want the change the color there

  Lights() {
    lightsOn = false;
    lightOnColor = color(255, 240, 31); //yellow light color
  }

  void display() {
    //ceiling lamps  
    stroke(0);
    for (int i = 100; i<=700; i+=200) { //we use 2 for-loops to draw the lamps
      fill(100); //top row
      ellipse(i, 60, 35, 15);
      fill(lightOnColor); //variable since we want to be able to switch the color of the lights when the player turns the lights off
      ellipse(i, 60, 30, 10);
    }
    for (int i = 200; i<=600; i+=200) {
      fill(100); //bottom row
      ellipse(i, 140, 35, 15);
      fill(lightOnColor);
      ellipse(i, 140, 30, 10);
    }

    //light switch
    fill(248, 248, 248); //almost white
    rect(40, 450, 30, 40);
    rect(40, 450, 10, 20);

    if (lightsOn) {
      lightOnColor = color(255, 240, 31); //change the color when the lights are on
      fill(200);
    } else {
      lightOnColor = color(99, 99, 99); //otherwise the color of the lamps are grey/black
      fill(248, 248, 248);
    }
    rect(40, 445, 10, 10); //top button
    //the buttons change color when you press it of course
    if (!lightsOn) {
      fill(200);
    } else {
      fill(248, 248, 248);
    }
    rect(40, 455, 10, 10);//bottom button
  }

  void lightSwitch(float mouseXParameter, float mouseYParameter) { //we use parameters for the mouseX and mouseY
    if (mouseXParameter <= 55 && mouseXParameter >= 25 && mouseYParameter < 470 && mouseYParameter > 430) { //when the mouse is clicked when it is on the lightswitch
      lightsOn = !lightsOn; //the light switches
    }
  }
}
