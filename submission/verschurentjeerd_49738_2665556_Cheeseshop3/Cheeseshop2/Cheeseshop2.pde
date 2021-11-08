//Hello there, and welcome to my final project game!
//In this game, a cheeseshop is displayed. And there is a mouse in the shop: Tim!
//It is the goal of the game to eat the three little cheeseblocks scattered around the shop. These are 
//brighter yellow and have a yellow stroke. They are also square and smaller. 
//When you press the lock, the security gate will move up, and when they're fully up, the timer will start. 
//You control Tim with the LEFT, RIGHT and UP keys. You are allowed (and adviced) to position Tim somewhere strategic
//before the game starts. When you succeed to fulfill the task, you win. But when you don't, you lose and Tim will be hungry... :(



Shop shop;
Background[] cheesewall = new Background[1];

//Here is the setup of everything. It is split between everything in the shop and the array for the cheeses as the background. 
void setup() {
  size(1500, 1000);
  shop = new Shop();
  for (int i = 0; i<cheesewall.length; i++) {
    cheesewall[i] = new Background(i, i);
  } 
  smooth();
  frameRate(100);
}

void draw() {
  for (int i = 0; i<cheesewall.length; i++) {
    cheesewall[i].shopBackground();
  }
  shop.display();
}

//The mousePressed function is only used for clicking the lock. This will lead to the clickLock function in the shop class.
void mousePressed() {
  shop.clickLock(mouseX, mouseY);
}

//The keyPressed function is used for whenever the moving keys are pressed. These lead to the shop class.
void keyPressed() {
  shop.buttonPressed();
}
