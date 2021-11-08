//Dunkirk movie
class Movie {
  PImage movie;
  PImage movieHeadTurn;

  int posX;
  int posY;
  int sizeX;
  int sizeY;

  boolean keyPress;

  Movie() {
    keyPress= false;
    movie = loadImage("movie2.png");
    movieHeadTurn = loadImage("movie.jpg");
  }

  void display(int posX, int posY, int sizeX, int sizeY) {
    //lines that hold the poster
    line(posX + 5 - sizeX/2, posY - sizeY/2 - 2, posX, 500);
    line(posX - 5 + sizeX/2, posY - sizeY/2 - 2, posX, 500);

    //which side of the head is displayed (keyPressed changes it)
    if (keyPress) {
      image(movieHeadTurn, posX, posY, sizeX, sizeY);
    } else {  
      image(movie, posX, posY, sizeX, sizeY);
    }
  }

  void keyPress() {
    keyPress= true;
  }
  void keyRelease() {
    keyPress=false;
  }
}
