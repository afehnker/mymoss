//spaceship class, the baseline for both enemy and player classes

class SpaceShip { //initialises class spaceship which we called it because this game is based on space invaders
  int x, y;
  String sprite[];
  color baseColor = color(0, 0, 255);
  color nextColor = baseColor;

  void draw() {
    updateObj();
    image(hartje,x, y); //sets the image hartje as the image for your spaceship
  }
  //where the enemies will be drawn initially
  void drawSprite(int xpos, int ypos) {
    //changing back colours after being hit
    fill(nextColor);

    
    for (int i = 0; i < sprite.length; i++) {
      String row = (String) sprite[i];

      for (int j = 0; j < row.length(); j++) {
        if (row.charAt(j) == '1') {
          rect(xpos+(j * pixelsize), ypos+(i * pixelsize), pixelsize, pixelsize);
        }
      }
    }
  }

  void updateObj() { //checks update on object 
 }
}
