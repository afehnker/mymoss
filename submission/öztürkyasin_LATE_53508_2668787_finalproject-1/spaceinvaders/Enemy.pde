//the enemy class

class Enemy extends SpaceShip {
  int life = 3;  //the amount of hitpoints the enemy has
  int timer = 2000; //time in milliseconds that the enemy grid will stop
  boolean stopped = false; //sets the default state of enemies to not stopped
  int yFreeze = 200;//makes enemies stop at y=200 for the first stop
  Enemy(int xpos, int ypos) {  //sets initial enemy position
    x = xpos;
    y = ypos;
  }
  void draw() {
    updateObj(); //updates object enemy
    
    image(enemy, x, y, 50, 70); //sets the image enemy as picture for the object enemy and sizes it down to look better
  }

  void stopEnemy() { //function to make an enemy stop 
    timer = millis(); //sets timer to function millis to check milliseconds
    stopped = true; //stops the enemy moving if condition has been met
    yFreeze = yFreeze + 23; //makes enemies stop every 100 pixels down
    
  }


  void updateObj() {
    if (!stopped) {
     if (y > yFreeze && exists){
       for (int i = 0; i < enemies.size(); i++){
         Enemy enemy =  (Enemy) enemies.get(i);
         enemy.stopEnemy();
       } //makes the whole grid of enemies stop if stopEnemy has been started
      
     }
      if(y >500){
       rainbow.removeRainbow();
      }
      if(y >580){
        gameOver=true;
        // gameover screen when the enemies hit y 560 or lower
      }
      if (frameCount%30 == 0) {  //moves the grid of enemies every half second
        x += direction * gridsize;
      }

      if (incy == true) {
        y += gridsize / 2;
      }//makes grid move down
    } 
      else
      if (millis() - timer > 2000) {
        stopped = false;
      } //makes enemy grid move again after having been stopped for 2 seconds
  }
  //status check for the enemies
  boolean alive() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = (Bullet) bullets.get(i);
      //check for hit
      if (bullet.x > x && bullet.x < x + 7 * pixelsize + 5 && bullet.y > y && bullet.y < y + 5 * pixelsize) {
        bullets.remove(i);
        //taking off a life
        life--;
        //destruction condition and score increase
        if (life <= 0) {
          score += 50;
          return false;
        }

        break;
      }
    }

    return true;
  }
  //out of bounds parameter
  boolean outside() {
    return x + (direction*gridsize) < 0 || x + (direction*gridsize) > width - gridsize;
  }
}
