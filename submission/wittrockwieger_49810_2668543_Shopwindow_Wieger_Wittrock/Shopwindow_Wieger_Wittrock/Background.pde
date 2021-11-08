/*
Shopwindow by Wieger Wittrock, group 1.
 31-10-2021
 This interactive shopwindow has elements of the real shop "By Jan Marc" in Hengelo
 */
class Background { //this class draws the background and is called in the Shop class

  Background() {
    background(179, 209, 227); //here we set the background
  }

  void display() {  

    //ceiling
    fill(255);
    quad(695, 210, 790, 15, 0, 15, 0, 210);

    //right glass
    fill(179, 209, 227);
    noStroke();
    quad(710, 220, 710, 680, 800, 860, 800, 44);

    //wooden floor
    fill(137, 95, 64);
    quad(0, 900, 0, 689, 695, 689, 800, 900);

    boolean drawPlankUnder = true; //a local boolean to draw line between planks. the value switches every loop in the for-loop
    for (int i = -60; i <= 695; i = i+60) { //as i we the positions we want
      stroke(80, 54, 49); //brown wooden floor, planks
      line(i, 689, i+105, 900); //we draw the planks based on where we are in the for-loop with i
      if (drawPlankUnder) { //we switch every loop
        line(i+12, 834, i+72, 834);
      } else {
        line(i-38, 732, i+60-38, 732);
      }
      drawPlankUnder = !drawPlankUnder; //this bool makes it so it draw the under plank, then the up, then the under again, then etc...
    }
    line(682, 733, 716, 733); //this line is separated since it is smaller (the last plank);


    //wall
    fill(70);
    stroke(0);    
    PImage backgroundbridge = loadImage("backgroundbridge.jpeg"); //load the image, we use a black and white image behind the locker, just like in the real shop   
    quad(95, 211, 695, 211, 695, 689, 95, 689); //quad in case the image would not load
    image(backgroundbridge, 95, 211, 600, 478); //image as background, just like the real shop
    noFill(); //only want to use the border
    strokeWeight(2);
    quad(95, 211, 695, 211, 695, 689, 95, 689); //border for the image
    strokeWeight(1);
    fill(200); //wall to the left, with the light switch
    quad(95, 211, 0, 211, 0, 690, 95, 690);

    //metal lines on the outside of the glass
    fill(100); 

    //middle
    fill(100);
    quad(695, 689, 695, 211, 700, 199, 700, 700);// second beam
    fill(120);
    quad(700, 700, 700, 210, 710, 210, 710, 700);

    //bottom
    fill(100);
    quad(800, 900, 700, 700, 700, 680, 800, 880);  
    fill(120);
    quad(710, 680, 700, 680, 800, 880, 810, 880); //second beam
    fill(120);
    rect(400, 900-10, 800, 10);
    fill(100);
    rect(400, 900-5, 800, 10);

    //top
    fill(120);
    quad(710, 220, 700, 220, 800, 20, 800, 40); //second beam
    fill(100);
    quad(800, 0, 700, 200, 700, 220, 800, 20);
    fill(120);
    rect(400, 10, 800, 10);
    fill(100);
    rect(400, 5, 800, 10);
  }
}
