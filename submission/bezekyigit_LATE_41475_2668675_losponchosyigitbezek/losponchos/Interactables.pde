class Interactables {
  //glob vars
 
  char identifierCharacterOfTheInteractableObject;
 
  int xLocation, yLocation;
 
  boolean burritoIsActive=true, burritoPhaseWaitEntered=false, hotSauceIsActive=true, hotSaucePhaseWaitEntered=false, tacoIsActive=true, tacoPhaseWaitEntered=false ;

  Interactables(char interactableFood) {

    identifierCharacterOfTheInteractableObject=interactableFood;
  }
  //displaying the interactable objects and timing if they have been picked then pop up again
 
  void displayTheInteractableObject(int x, int y) {
    switch(identifierCharacterOfTheInteractableObject) {
      //  burrito 
    case 'b':

      xLocation=306 ;
     
      yLocation=846;
     
      if (burritoIsActive) {
     
        image(burritopng, xLocation, yLocation);
      } else if (!burritoIsActive && !burritoPhaseWaitEntered) {
        timeToBe();
        burritoPhaseWaitEntered=true;
      }
      interactableActivator();
      break;
    case 'h':
      xLocation= 1592;
      yLocation= 244;

      if (hotSauceIsActive) {
        image(hotSaucepng, xLocation, yLocation);
      } else if (!hotSauceIsActive && !hotSaucePhaseWaitEntered) {
        timeToBe();
        hotSaucePhaseWaitEntered=true;
      }
      interactableActivator();
      break;
      //taco
    case 't':
      xLocation= 959;
      yLocation= 565;
      if (tacoIsActive) {
        image(tacopng, xLocation, yLocation);
      } else if (!tacoIsActive && !tacoPhaseWaitEntered) {
        timeToBe();
        tacoPhaseWaitEntered=true;
      }
      interactableActivator();
      break;

      //poncho
    case 'p':
      image(ponchopng, x, y);
    }
  }
  //timer for interactabe onject to respawn afte 5 secs
  void timeToBe() {
    timeToRespawn= (millis()/1000)+5;
  }
  //method to check if there is 5s gap between object interacted and time past
  int timeToRespawn;
  void interactableActivator() {
    //  int unlockTime=timeToBe();
    switch(identifierCharacterOfTheInteractableObject) {
      //  burrito
    case 'b':
      if ((millis()/1000)>timeToRespawn) {
        
        burritoIsActive=true;
        burritoPhaseWaitEntered=false;
      }
      break;
    case 'h':
      if ((millis()/1000)>timeToRespawn) {
        
        hotSauceIsActive=true;
        hotSaucePhaseWaitEntered=false;
      }
      break;
      //taco
    case 't':
      if ((millis()/1000)>timeToRespawn) {
       
        tacoIsActive=true;
        tacoPhaseWaitEntered=false;
      }
      break;
    }
  }
}
