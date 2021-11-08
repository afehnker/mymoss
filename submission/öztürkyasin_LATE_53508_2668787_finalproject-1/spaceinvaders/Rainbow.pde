class Rainbow {
  int life = 3;  //the amount of hitpoints the rainbow has
  
   int x, y;

 void draw() {
    updateObj();
    image(regenboog,x,200);
    
  }
  void removeRainbow() {
    exists = false;
  }
  

  void updateObj() {
    Enemy enemy = (Enemy) enemies.get(0);
     if (enemy.y > 200){
       removeRainbow();
       print("cheese");
     }

     }
       
  //status check for the rainbow
  boolean alive() {
    for (int i = 0; i < enemies.size(); i++) {
     Enemy enemy = (Enemy) enemies.get(0);
      //check for hit
      if (enemy.y > 200) {
        enemy.stopEnemy();
        life--;
        
      }
      
    }

    return true;
  }
//out of bounds parameter
  boolean outside() {
    return x + (direction*gridsize) < 0 || x + (direction*gridsize) > width - gridsize;
  }
}
