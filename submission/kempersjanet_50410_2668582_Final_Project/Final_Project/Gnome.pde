class Gnome

{

  float gnomeX;
  float gnomeY;
  color outfitColor;
  color skinColor;

  Gnome(float initX, float initY) {
    gnomeX = initX;
    gnomeY = initY;
    outfitColor = color(0, 0, 255);
    skinColor = color(242, 228, 218);
  }

  void display() {

    noStroke();
    fill(skinColor);

    //Body
    ellipse(gnomeX, gnomeY-15, 125, 135 );

    //Hat
    fill(outfitColor);
    triangle(gnomeX-70, gnomeY-48, gnomeX, gnomeY-200, gnomeX+70, gnomeY-48);

    //Outfit
    ellipse(gnomeX, gnomeY+30, 115, 45);

    //Feet
    fill(200);
    ellipse( gnomeX-35, gnomeY+50, 60, 35 );
    ellipse( gnomeX+35, gnomeY+50, 60, 35 );

    //Eyes
    fill(255); //White part
    ellipse( gnomeX-20, gnomeY-25, 30, 30 );
    ellipse(gnomeX+20, gnomeY-25, 30, 30 );

    fill(0); //Black part
    ellipse( gnomeX-20, gnomeY-20, 30, 25 );
    ellipse( gnomeX+20, gnomeY-20, 30, 25 );
  }

  //making the gnome able to move to where the mouse has clicked
  void move(float newX, float newY) {
    gnomeX = newX;
    gnomeY = newY;
    gnome.display();
  }
}
