class End {
  // Assigning Global variables 
  PVector Pos = new PVector(0, 0);
  float Width = 0;
  float Height = 0;
  color Color;
  String Text;
  Boolean Pressed = false;
  Boolean Clicked = false;

  // Constructor to make button
  End ()
  { 
    Pos.x = 340;
    Pos.y = 515;
    Width = 150;
    Height = 50;
    Color = color(255, 255, 0);
    Text = "Cash out";
  }

  // checking the button if pressed false and true.
  void update(float x, float y) {
    if (Pressed == false) {
      Pressed = true;
      if (x>= Pos.x && x <=Pos.x+Width && y >= Pos.y && y <=Pos.y+Height) {
        Clicked = true;
        fill(255, 255, 0);
        textFont(font_2, 90);
        text("Enjoy your pizza!", 600, 400);

        // The noLoop() function causes draw() to only run once.
        noLoop(); 
      } else
      {
        Clicked = false;
        Pressed = false;
      }
    }
  }

  // must be placed in void draw to render button to screen. 
  void display () {
    fill(Color);
    rect(Pos.x, Pos.y, Width, Height);

    fill(0);
    textAlign(CENTER, CENTER);
    text(Text, Pos.x+(Width/2), Pos.y+(Height/2));
  }


  boolean isClicked() // Use if statmenet to check if button has been cliclked
  {
    return Clicked;
  }
}
