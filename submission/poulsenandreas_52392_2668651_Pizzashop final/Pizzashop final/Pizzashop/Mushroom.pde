class Mushroom {
// Assigning Global variables 
  PImage mushroom_pizza;
  PImage pizza;


  PVector Pos = new PVector(0, 0);
  float Width = 0;
  float Height = 0;
  color Color;
  String Text;
  Boolean Pressed = false;
  Boolean Clicked = false;

  // Constructor to make button
  Mushroom () { 
    Pos.x = 400;
    Pos.y = 75;
    Width = 150;
    Height = 50;
    Color = color(255);
    Text = "Mushroom";
  }


  // checking the button if pressed false and true. 
  void update(float x, float y) {
    if (Clicked == false) {
      Clicked = true;
      if (x>= Pos.x && x <=Pos.x+Width && y >= Pos.y && y <=Pos.y+Height) {
        Clicked = true;
      } else {
        Clicked = false;
      }
    }
  }

  // displays the button of mushroom as a 1st topping
  void display () {

    mushroom_pizza = loadImage("mushroom_pizza.png");
    pizza = loadImage("pizza.png");

    fill(Color);
    rect(Pos.x, Pos.y, Width, Height);

    fill(0);
    textAlign(CENTER, CENTER);
    text(Text, Pos.x+(Width/2), Pos.y+(Height/2));

    if (pizzaButton.isClicked()) {
      if (mushroomButton.isClicked()) {
        image(mushroom_pizza, width/2, 502);
      } else if (mushroomButton.isClicked()) {
        image(pizza, width/2, 502);
      }
    }
  }


  // Use if statmenet to check if button has been clicled
  boolean isClicked() {
    return Clicked;
  }
}
