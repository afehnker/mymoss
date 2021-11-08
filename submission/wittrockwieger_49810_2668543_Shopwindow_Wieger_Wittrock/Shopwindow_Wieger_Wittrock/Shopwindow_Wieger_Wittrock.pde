/*
Shopwindow by Wieger Wittrock, group 1.
 31-10-2021
 This interactive shopwindow has elements of the real shop "By Jan Marc" in Hengelo
 
 This is the story, but you can of course do what you want:
 As the owner of "We sell Green/Blue shirts", your number 1 competitor in the shirt market is of course "We sell red shirts".
 One night you break into their super secret research shopwindow. It is known that they are experimenting on bouncy red shirts.
 this research will end the competition for once and for all. So you will have to make sure their research fails by dying the red shirts!
 After breaking their glass with a crowbar, you find a mysterious closet that can change the colors of all the shirts inside!
 This will surely ruin their day! 
 
 
 This is what the program can do:
 -Before entering the shopwindow, you control a crowbar. You move it with your mouse and you can use it with the left-mouse button
 -When you hit the glass with the crowbar, it will slowly make cracks
 -When you have enough cracks on the window, the glass will break and everything will fall to the ground.
 -You can switch the light on and off by pressing on the lightswitch, on the left of the closet
 -You can drag a tshirt if you select it by pressing near the wooden cloth hanger
 -If you let go of a tshirt it will fall to the ground
 -You can hang tshirts in the locker
 -You can trow tshirt
 -You can catch trown tshirts
 -Tshirts will bounce (!?) off the walls and floor/ceilling
 -You can open/close the locker door by pressing the door with the mouse
 -You can trow/put tshirts in the locker door
 -You can dye tshirts if you open the locker door, while there were tshirts inside of it
 -You can reset the shirts position by pressing a key
 */


Shop shop; //we create an object of the class shop, this class connects all the other classes. We do not want to do this in the main tab, so I made a seperate class

void setup() {
  //the background is managed/drawn in the Background class, since it is not just a picture or a color
  size(800, 900); 
  rectMode(CENTER); //this make it easier to position things, I find
  imageMode(CORNER);
  shop = new Shop(); //we initialise the shop
}

void draw() {
  shop.display(); //we display and update the shop
  shop.update();
}

void mouseDragged() {
  shop.dragMouse(mouseX, mouseY); //all the functions that use mouseDragged() are called in here. In the Shop class we use this to drag the shirts.
  //the mouseX and mouseY are parameters, because we do not want to use these in any other class than the main tab.
}

void mousePressed() {
  shop.pressMouse(mouseX, mouseY); //all the functions that use mousePressed() are called in here. In the shop claas we use this for: 
  //selecting the shirt you want to drag, opening/closing the locker door, using the crowbar, and turning on/off the lights
  //the mouseX and mouseY are parameters, because we do not want to use these in any other class than the main tab.
  println(mouseX + " | "+mouseY);
}

void mouseReleased() {
  shop.releaseMouse(mouseX, mouseY, pmouseX, pmouseY); //we use the mouseReleased in the Shop class to let go of a tshirt (and throw it)
  //the mouseX and mouseY are parameters, because we do not want to use these in any other class than the main tab.
}

void mouseMoved() {
  shop.moveCrowbar(mouseX, mouseY); //we use mouseMoved in the Shop class to mouve the crowbar
  //the mouseX and mouseY are parameters, because we do not want to use these in any other class than the main tab.
}

void keyPressed() {
  shop.resetTshirtPosition();
}
