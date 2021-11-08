//This is the beer class
//Beers spawn randomly across the map when the user hits a beat 'excellently'
class Beer {
  final PImage sprite;
  final int x;
  final int y;
  
  Beer () {
    //On initialization the beer is set to a random point on the screen and it's sprite is loaded
    x = int(random(0, width));
    y = int(random(0, height));
    sprite = loadImage("Thing_0008_beer.png");
  }
  
  void drawBeer(){
    //Draws the beer as an image on the screen
    image(sprite, x, y);
  }
  
  boolean isDrank(float cX, float cY){
    //Checks if the beer is within distance of the cowboy
    //returns true if it is
    if(dist(x, y, cX, cY) < 40){
      return true;
    }
    return false;
  }
}
