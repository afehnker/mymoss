class Bull {
  //global vars
  //we have poncho interactable onject in bull so we can spawn whereever he dies the poncho
  Interactables  poncho= new Interactables('p');
  
  int xLocation, yLocation, widthOfBull = 80, heightOfBull = 64, widthOfArena = 1703, heightOfArena = 856, xLocationOfAreana = 114, yLocationOfArena = 124, clapCounter;
  
  float speedX, speedY, health = 100, maxHealth = 100, rectWidth = 50; 

  boolean bullIsMoving=false, gameIsOver=false, timeToAttack=false, targetIsDead=false, gameWon=false;
  Bull() {
    //spawn from the left gate
    
    xLocation = int ( random ( 0, 46 ) ) ;
    yLocation = int ( random ( 497, 618 ) );
  }
  //the healthbar of bulldisplayed seperately
  void displayHealthBull() {
    
    if (!gameIsOver) {
    
      if (health < 25)
      {
        fill(255, 0, 0);
     
    } else if (health < 50)
      {
        fill(255, 200, 0);
      
    } else
      {
        fill(0, 255, 0);
      }
     
      float drawWidth = (health / maxHealth) * rectWidth;
      
      rect(xLocation, yLocation-heightOfBull/2, drawWidth, 10);
    }
  }

  //display of bull
  void displaybull() {
    
    if (!gameIsOver) {
     
      isBullMoving();

      imageMode(CENTER);
     
      image(bullpng, xLocation, yLocation);
   
  } else {
   
    poncho.displayTheInteractableObject(xLocation, yLocation);
    }
  }

  void movebull(int x, int y) {
   
    bullWelcomingToArena();
    //check if it is dead
    
    if (!gameIsOver && !targetIsDead) {

      xLocation = int( speedX ) + xLocation;
     
      yLocation = int( speedY ) + yLocation;
      //check if its on corner
      if (checkIfBullShouldStop()) {
      
        bullStop();
      
        timeToAttack=true;
        //crowd claps whenever hits the corner misses the target
        if (timeToAttack) {
       
          clap.play();
       
          clap.jump(5);
        }
        directionOfBullAttack(x, y);
      
        timeToAttack=false;
      }
      //if the bull is dead game is over
      if (health==0) {
      
        gameIsOver=true;
      
        gameWon=true;
      }
    }
  }
  //a method to check if bull is moving or not
  void isBullMoving() {
    
    if ( speedX == 0 && speedY == 0 ) {
     
      bullIsMoving = false;
    } else {
    
      bullIsMoving = true;
    }
  }
  //bull enters the arena
  //small global variable to keep organized the one time entering animation
  boolean didBullEnterTheArena = false;
  
  void bullWelcomingToArena() {
    if ( !didBullEnterTheArena ) {
  
      xLocation = 10 + xLocation;
    
      if ( !didBullEnterTheArena && xLocation > 460) {
   
        didBullEnterTheArena = true;
      }
    }
  }
  //calculating the direction to the point target is
  void directionOfBullAttack( int xLocationOfTarget, int yLocationOfTarget ) {
    speedX = (( xLocationOfTarget - xLocation )*(10) / dist(xLocationOfTarget, yLocationOfTarget, xLocation, yLocation))*1.3 ;
   
    speedY = (( yLocationOfTarget - yLocation )*(10) / dist(xLocationOfTarget, yLocationOfTarget, xLocation, yLocation))*1.3 ;
  }


  //checking if bull hits the border of the arena
  boolean checkIfBullShouldStop() {
    if ( (xLocation <= ( xLocationOfAreana - widthOfBull/2 )) || (xLocation >= (( xLocationOfAreana + widthOfArena) - widthOfBull/2)) ) {
      return true;
    }
    if ( (yLocation <= (yLocationOfArena - heightOfBull/2 )) || (yLocation >= (( yLocationOfArena + heightOfArena) - heightOfBull/2)) ) {
      return true;
    } 
    return false;
  }

  //updating speed when bull should stop
  void bullStop() {

    speedX = 0;
    speedY = 0;
  }
  void isGonzalezDead(boolean isIt) {
    targetIsDead=isIt;
   
  }

}
