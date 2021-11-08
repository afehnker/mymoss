class Game {

  Player player;

  Game() {
    //draws the screen for the game and set up the player and enemies
    background(0);
    noStroke();
    player = new Player();
    createEnemies();
    //we didnt get to using this yet
    gameOver = false;
  }

  //detects input and moves the player
  void keyPressed() {
    player.updateObj();
  }

  //initialises the enemy roster
  void createEnemies() {
    for (int i = 0; i < width/32/2; i++) {
      for (int j = 0; j <= 5; j++) {
        enemies.add(new Enemy(i*32, j*32 + 70));
      }
    }
  }
}
