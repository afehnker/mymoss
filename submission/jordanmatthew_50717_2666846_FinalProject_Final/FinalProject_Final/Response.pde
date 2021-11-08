//Response is usesd to give the user feedback on their attacks
class Response {
  int x, y, spawnTime, duration;
  int sizeX, sizeY;

  PImage sprite;

  Response (int newX, int newY, int newDuration, String name) {
    //Sets position and duration at initilization
    x = newX;
    y = newY;
    duration = newDuration;
    //Makes note of when the response was created
    spawnTime = millis();
    //Changes the response sprite depending on the given name
    switch(name) {
    case "Excellent":
      sprite = loadImage("excellentResponse.png");
      sizeX = 150;
      sizeY = 150;
      break;
    case "Nice":
      sprite = loadImage("niceResponse.png");
      sizeX = 150;
      sizeY = 150;
      break; 
    case "Okay":
      sprite = loadImage("okayResponse.png");
      sizeX = 150;
      sizeY = 150;
      break;
    case "Miss":
      sprite = loadImage("missResponse.png");
      sizeX = 150;
      sizeY = 150;
      break;
      //Room to add more reponses here

    default:
      sprite = loadImage("invis.png");
      sizeX = 0;
      sizeY = 0;
    }
  }

  void drawResponse() {
    imageMode(CENTER);
    //Sets the transparency based on the lifetime of the response
    //As time goes past, the response fades away
    tint(255, 255 - (millis()-spawnTime));
    image(sprite, x, y, sizeX, sizeY);
    tint(255);
  }

  boolean isOver () {
    //returns true if the lifetime of the response is greater than its set duration time
    return millis() - spawnTime > duration;
  }
}
