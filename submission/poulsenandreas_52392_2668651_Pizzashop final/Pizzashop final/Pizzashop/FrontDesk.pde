class FrontDesk {

  
// Assigning Global variables 
  PImage pizza = loadImage("pizza.png");
  PImage background_wall=loadImage("background_wall.jpeg");
  PImage counter =loadImage("counter.jpeg");
  PImage furnace= loadImage("furnace.png");
  PImage pizza_guy_background= loadImage("pizza_guy_background.png");
  PImage pizza_guy_counter= loadImage("pizza_guy_counter.png");
  PImage tv_screen = loadImage("tv_screen.png");
  PImage cash_register = loadImage("cash_register.png");
  PImage plate = loadImage("plate.png");
  PImage salt_pepper = loadImage("salt_pepper.png");
  PImage Fridge = loadImage("Fridge.png");
  PImage pizza_soon = loadImage("pizza_soon.png");
  PImage ventilator = loadImage("ventilator.png");



  void display() {
    background(background_wall);
    image (Fridge, 180, 220);
    image(pizza_guy_counter, 230, 210);
    image(furnace, 1000, 210);
    image(pizza_guy_background, 715, 250);
    image(counter, 0, 500, width*2, height/2);
    image(cash_register, 20, 370);
    image(tv_screen, 20, 50);
    image(ventilator, 980, -35);
    image(plate, width/2 - 14, 498);
    image(salt_pepper, 270, 500);
    image(pizza_soon, 115, 85);
    tv_screen.resize(275, 150);
    cash_register.resize(250, 200);


// font_2 with methods
    font_2 = createFont("font_pizza_2.ttf", 14.5);
    textAlign(CENTER);
    textFont(font_2);
    stroke(0);
    fill(255, 255, 0);
    rect(300, 0, 100, 50);
    rect(400, 0, 150, 25);
    rect(550, 0, 150, 25);


    fill(0);
    text("Press plain", 350, 17.5);
    text("to start", 350, 40);
    text("Choose 1st topping", 475, 17.5);
    text("Choose 2nd topping", 625, 17.5);
  }
}
