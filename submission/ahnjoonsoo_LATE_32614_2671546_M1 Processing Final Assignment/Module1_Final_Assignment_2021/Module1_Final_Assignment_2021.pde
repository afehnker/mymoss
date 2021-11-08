//Module 1 prrocessing final assignment
//27/10/2021
//Joonsoo Ahn s2205599
//This is an animation for windows of a theater in Hengelo just in front of my house. 
//I have seen leaves fell down since two or a week ago that is why I made this falling leaves animation
//The leaves generate and fall from out of the screen. By clicking you can make a leaf disappear.

Leaves leaves;
Window window;

void setup() {
  size(900, 600);
  leaves = new Leaves();
  window = new Window();
}

void draw() {
  window.display();
  leaves.display();
}

void mousePressed() {
  leaves.interaction(mouseX, mouseY);
}
