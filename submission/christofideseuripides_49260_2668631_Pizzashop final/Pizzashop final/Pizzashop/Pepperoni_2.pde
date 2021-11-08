class Pepperoni_2 {
// Assigning Global variables 
  PImage pepperoni_olive_pizza;
  PImage basil_pepperoni_pizza;
  PImage pepperoni_mushroom_pizza;

  PVector Pos = new PVector(0, 0);
  float Width = 0;
  float Height = 0;
  color Color;
  String Text;
  Boolean Pressed = false;
  Boolean Clicked = false;

  // Constructor to make button
  Pepperoni_2 () { 
    Pos.x = 550;
    Pos.y = 175;
    Width = 150;
    Height = 50;
    Color = color(255);
    Text = "Pepperoni";
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

  // displays the button of pepperoni as a 2nd topping
  void display () {

    pepperoni_olive_pizza = loadImage("pepperoni_olive_pizza.png");
    basil_pepperoni_pizza = loadImage("basil_pepperoni_pizza.png");
    pepperoni_mushroom_pizza = loadImage("pepperoni_mushroom_pizza.png");

    fill(Color);
    rect(Pos.x, Pos.y, Width, Height);

    fill(0);
    textAlign(CENTER, CENTER);
    text(Text, Pos.x+(Width/2), Pos.y+(Height/2));

    if (oliveButton.isClicked()) {
      if (pepperoni_2_Button.isClicked()) {
        image(pepperoni_olive_pizza, width/2, 502);
      }
    }

    if (basilButton.isClicked()) {
      if (pepperoni_2_Button.isClicked()) {
        image(basil_pepperoni_pizza, width/2, 502);
      }
    }

    if (mushroomButton.isClicked()) {
      if (pepperoni_2_Button.isClicked()) {
        image(pepperoni_mushroom_pizza, width/2, 502);
      }
    }
  }


  // Use if statmenet to check if button has been clicled
  boolean isClicked() {
    return Clicked;
  }
}
