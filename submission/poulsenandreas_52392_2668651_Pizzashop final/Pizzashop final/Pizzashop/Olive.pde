class Olive {
// Assigning Global variables 
  PImage olive_Pizza;
  PImage pizza;

  PVector Pos = new PVector(0, 0);
  float Width = 0;
  float Height = 0;
  color Color;
  String Text;
  Boolean Pressed = false;
  Boolean Clicked = false;

  // Constructor to make button
  Olive () { 
    Pos.x = 400;
    Pos.y =25;
    Width = 150;
    Height = 50;
    Color = color(255);
    Text = "Olive";
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

  // displays the button of olive as a 1st topping
  void display () {

    olive_Pizza = loadImage("olive_pizza.png");
    pizza = loadImage("pizza.png");

    fill(Color);
    rect(Pos.x, Pos.y, Width, Height);

    fill(0);
    textAlign(CENTER, CENTER);
    text(Text, Pos.x+(Width/2), Pos.y+(Height/2));

    if (pizzaButton.isClicked()) {
      if (oliveButton.isClicked()) {
        image(olive_Pizza, width/2, 502);
      } else if (oliveButton.isClicked()) {
        image(pizza, width/2, 502);
      }
    }
  }



  // Use if statmenet to check if button has been clicled
  boolean isClicked() {
    return Clicked;
  }
}
