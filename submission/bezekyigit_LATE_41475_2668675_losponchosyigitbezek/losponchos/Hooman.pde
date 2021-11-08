class Hooman {
  //global vars
  int xLocation, yLocation, widthOfGonzalez = 101, heightOfGonzalez = 126, speedBoostConstant=5, xDirection=0, yDirection=0 ;
  
  boolean gonzalezShrinked = false, gonzalezGrowed = false, gonzalezIsMoving = false, gameIsOver=false, gonzalezIsHit = false;
  
  float hitCounter=0.25, hitScale=0, health = 100, maxHealth = 100, rectWidth = 200;

  Hooman() {
    //spawn on the right gate
   
    xLocation = int ( random ( 1871, 1874 ) ) - widthOfGonzalez / 2 ;
    
    yLocation = int ( random ( 489, 631 ) ) - heightOfGonzalez / 2;
  }
  //health bar display
  
  void displayHealthBarGonzalez() {
  
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
   
    rect(1534, 33, drawWidth, 25);
  }
 
  //gonzalez display
  void displayGonzalez() {
  
    if (!gonzalezIsHit) {
    
      imageMode(CENTER);
     
      image( gonzalezpng, xLocation, yLocation );
      
      if (xDirection!=0 || yDirection!=0) {
       
        //if it moves we ad small runing image on his foots
       
        image( runpng, xLocation, yLocation );
      }
    
  } else {
    
    gonzalezGotHit();
    }
  }
  //when gonzalez got it animation he flys p and down with scale illuson
  void gonzalezGotHit() {
  //scale up
   
    if ( gonzalezIsHit && !gonzalezGrowed ) {
    
      imageMode(CENTER);
    
      hitScale=hitScale+hitCounter;
     
      pushMatrix();
     
      translate(xLocation, yLocation);
     
      scale(hitScale);
     
      image( gonzalezpng, 0, 0 );
     
      popMatrix();
     
      if (hitScale>2.5) {
    
        gonzalezGrowed=true;
    
    }//scale down
   
  } else if (gonzalezIsHit && !gonzalezShrinked) {
   
    imageMode(CENTER);
   
      hitScale=hitScale-hitCounter;
   
      pushMatrix();
   
      translate(xLocation, yLocation);
      
      scale(hitScale);
   
      image( gonzalezpng, 0, 0 );
    
      popMatrix();
    
      if (hitScale==1) {
   
        gonzalezShrinked=true;
      }
    }
//boolean vars to keep the action conrtolled making it happen at the right time wiht  right amount slso updating its health
    
    if (gonzalezGrowed && gonzalezShrinked) {
    
      gonzalezIsHit=false;
    
      gonzalezGrowed=false;
    
      gonzalezShrinked=false;
    
      health-=25;
    }
  }
 
  //simple glob var for enter the arena naimation 
 
  boolean gonzalezIsInPosition = false;
 
  //updating the gonzalez location and speed
 
  void moveGonzalez() {
   
    if (!gameIsOver) {

      if (gonzalezIsInPosition) {
     
        gonzalezStopsInTheEndOfTheScreen();
      
        xLocation += (xDirection * speedBoostConstant);
      
        yLocation += (yDirection * speedBoostConstant);
      
        //  small entering to arena am=nimation
    
    } else if ( xLocation > 1460 && !gonzalezIsInPosition ) {
      
      xLocation -= 10;

        if ( xLocation < 1470  &&  xLocation > 1450  &&  !gonzalezIsInPosition ) {
      
          gonzalezIsInPosition = true;
        }
      }
     
      if (health<=0) {
    
        gameIsOver=true;
      }
    } else { //when game is over gonzalez stops
    
      xDirection=0;
   
      yDirection=0;
    }
  }
  //keypressed function working with this method to go up down right and left
  
  void changeDirectionOfGonzalez(int xinitDirection, int yinitDirection, boolean moving) {
  
    xDirection = xinitDirection;
  
    yDirection = yinitDirection;
   
    gonzalezIsMoving = moving;
  }
//checking if gonzalez hits the end of the arena and bouncing it back to the arena
  
  void gonzalezStopsInTheEndOfTheScreen() {

    if (gonzalezIsMoving) {
   
      if  ( xLocation   <  114 ) {
        xDirection =-xDirection;
        
      }
      if ( (xLocation + widthOfGonzalez)  >  1818 ) {
        xDirection =-xDirection;
        
      }
      if ( yLocation-10   <  124 ) {
        yDirection =-yDirection;
        
      }
      if ( (yLocation + heightOfGonzalez )  >  980 ) {
        yDirection =-yDirection;
        
      }
    }
  }
}
