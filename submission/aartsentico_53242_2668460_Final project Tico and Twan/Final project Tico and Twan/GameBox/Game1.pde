//This program is made by Tico Aartsen and Twan de Groot
class Game1 {
  int maxX;              //declaring variables
  int maxY;
  int x;
  int y;

  int changeMoment = 0;
  int gameState = 1;     //1=starting screen 2=waiting screen 3=to early 4=click now 5=game done
  int responseTime;

  Game1(int locX, int locY, int sizeX, int sizeY) {
    maxX = sizeX;
    maxY = sizeY;
    x = locX;
    y = locY;
  }
  
  void display() {
    if(gameState == 2 && changeMoment < millis()){      //Lets the screen change to click now
      gameState = 4;
    }
    textAlign(CENTER);
    if (gameState == 1) {                                     //the starting screen
      fill(151, 76, 212);
      rect(x, y, maxX, maxY);
      fill(0);
      textSize(35);
      text("test your response time!", maxX/2+x, maxY/2+y);
    } else if (gameState == 2) {                              //the waiting screen
      fill(151, 76, 212);
      rect(x, y, maxX, maxY);
      fill(0);
      textSize(20);
      text("Click when the color changes!", maxX/2+x, maxY/2+y);
    } else if (gameState == 3) {                              //clicked to early screen
      fill(255, 0, 0);
      rect(x, y, maxX, maxY);
      fill(0);
      textSize(25);
      text("too early. really bad!!", maxX/2+x, maxY/2+y);
      text("Click again to restart game", maxX/2+x, maxY/2+y+30);
    } else if (gameState == 4) {                              //click now screen
      fill(42, 247, 27);
      rect(x, y, maxX, maxY);
      fill(0);
      textSize(30);
      text("Click now!", maxX/2+x, maxY/2+y);
    } else {                                                  //End screen
      fill(151, 76, 212);
      rect(x, y, maxX, maxY);
      fill(0);
      textSize(25);
      text("Your respons time is: " + responseTime + " ms", maxX/2+x, maxY/2+y);
      text("Click again to restart game", maxX/2+x, maxY/2+y+30);
    }
  }


  void clicked() {
    int currentTime = millis();                             //note the time directly for accuracy
    if (gameState == 1) {                                   //check the state of the game and
      changeMoment = int(random(2000, 4000)) + currentTime; //depending on that change the game
      gameState++;
    } else if (gameState == 2) {
      gameState++;
    } else if (gameState == 3) {
      gameState = 1;
    } else if (gameState == 4) {
      gameState++;
      responseTime = currentTime - changeMoment;
    } else {
      gameState = 1;
    }
  }
}
