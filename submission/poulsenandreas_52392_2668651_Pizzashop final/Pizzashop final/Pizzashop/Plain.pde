class Plain {
// Assigning Global variables 
  PImage pizza;

  PVector Pos = new PVector(0, 0);
  float Width = 0;
  float Height = 0;
  color Color;
  String Text;
  Boolean Pressed = false;
  Boolean Clicked = false;

  // Constructor to make button
  Plain () { 
    Pos.x = 300;
    Pos.y = 50;
    Width = 100;
    Height = 150;
    Color = color(255);
    Text = "Plain";
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

  // displays the button of creating a plain pizza as your first choice
  void display () {

    pizza = loadImage("pizza.png");

    fill(Color);
    rect(Pos.x, Pos.y, Width, Height);

    fill(0);
    textAlign(CENTER, CENTER);
    text(Text, Pos.x+(Width/2), Pos.y+(Height/2));

    if (pizzaButton.isClicked()) {
      if (smokeCreated<smoke.length) { 
        smoke[smokeCreated] = new Smoke(1100, 200);   // smoke is spawning at this coordinates
        smokeCreated++;
      } else {
        //Shift all smoke in the array and then insert the new one at the end.
        for (int i=0; i < smoke.length-1; i++) {
          smoke[i]=smoke[i+1];
        }
        smoke[smoke.length-1] = new Smoke(1100, 200); // smoke spawn at the same point again when array is depleted
      }

      image(pizza, width/2, 502);
    }
  }


  // Use if statement to check if button has been clicled
  boolean isClicked() {
    return Clicked;
  }
}
