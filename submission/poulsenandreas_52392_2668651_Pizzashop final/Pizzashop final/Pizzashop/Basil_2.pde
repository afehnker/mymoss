class Basil_2 {
  
  // Assigning Global variables 
  PImage mushroom_basil_pizza;
  PImage basil_pepperoni_pizza;
  PImage olive_basil_pizza;

  PVector Pos = new PVector(0, 0);
  float Width = 0;
  float Height = 0;
  color Color;
  String Text;
  Boolean Pressed = false;
  Boolean Clicked = false;

  // Constructor to make button
  Basil_2 () { 
    Pos.x = 550;
    Pos.y = 125;
    Width = 150;
    Height = 50;
    Color = color(255);
    Text = "basil";
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

  // displays the button of basil as a 2nd topping
  void display () {

    mushroom_basil_pizza = loadImage("mushroom_basil_pizza.png");
    basil_pepperoni_pizza = loadImage("basil_pepperoni_pizza.png");
    olive_basil_pizza = loadImage("olive_basil_pizza.png");

    fill(Color);
    rect(Pos.x, Pos.y, Width, Height);

    fill(0);
    textAlign(CENTER, CENTER);
    text(Text, Pos.x+(Width/2), Pos.y+(Height/2));

    if (mushroomButton.isClicked()) {
      if (basil_2_Button.isClicked()) {
        image(mushroom_basil_pizza, width/2, 502);
      }
    }

    if (pepperoniButton.isClicked()) {
      if (basil_2_Button.isClicked()) {
        image(basil_pepperoni_pizza, width/2, 502);
      }
    }

    if (oliveButton.isClicked()) {
      if (basil_2_Button.isClicked()) {
        image(olive_basil_pizza, width/2, 502);
      }
    }
  }


  // Use if statmenet to check if button has been clicled
  boolean isClicked() {
    return Clicked;
  }
}
