/*
The class drawer makes the drawer open and close at a set time.
This class also calls in the class balloons to show these when the drawer opens.
The function display() draws the drawer on the screen in its open or closed state and spawns the balloons.
The function update() will keep calling in the rise() and popBalloon() functions from the balloon class.
This way the balloons keep rising up until they are all gone or popped.
*/
class Drawer {
  //initialising variables and colors:
  int drawerXPos;
  int drawerYPos;
  boolean drawerOpen;
  int openTimer;
  boolean soundPlayed;
  boolean mute;
  int maxBalloons = 10;
  Balloon balloons[] = new Balloon[maxBalloons]; //initialise maxBalloons balloons.
  color drawerColor;
  
  Drawer(int overX, int overY){
    //assigning values to variables:
    drawerXPos = overX;
    drawerYPos = overY;
    drawerOpen = false;
    openTimer = 0;
    mute = true;//makes the drawer closing sound not play the first time the program starts.
    soundPlayed = false; //variable for not making the sound play multiple times.
    for (int i = 0; i < maxBalloons; i++){
      balloons[i] = new Balloon(-200, 0); //spawns balloons for the first time off-screen.
    }
    drawerColor = color(99, 53, 17);
  }
  
  void display(){
    //shows the drawer closed:
    if (!drawerOpen){
      fill(drawerColor);
      rect(drawerXPos, drawerYPos, 400, 80);
      ellipse(drawerXPos + 200, drawerYPos + 40, 20, 20);
      if (!mute && !soundPlayed) {
        soundPlayed = true;
        drawerClosing.play();
      }
    }
    
    //shows the drawer open:
    if (drawerOpen){
      fill(drawerColor);
      rect(drawerXPos, drawerYPos, 400, 160);
      ellipse(drawerXPos + 200, drawerYPos + 140, 20, 20);
      fill(59, 32, 10);
      rect(drawerXPos + 10, drawerYPos + 10, 380, 100);
      mute = false;
      if (!soundPlayed) {
        soundPlayed = true;
        drawerOpening.play();
      }
    }
    //calls in the functions display() and rise() from the class baloon i times (10 times in this case).
    for (int i = 0; i < balloons.length; i++){
      balloons[i].display();
    }

  }
  
  void update(){   
    //makes the drawer open and close at set times:
    if (!drawerOpen){
      openTimer ++;
    }
    if (drawerOpen){
      openTimer --;
    }
    if (openTimer > 600){
      drawerOpen = true;
      openTimer = 60;
      soundPlayed = false;
      for (int i = 0; i < balloons.length; i++){
        balloons[i] = new Balloon(drawerXPos + int(random(20,380)),drawerYPos + int(random(-20,20)));
      }
    }
    if (openTimer < 0){
      drawerOpen = false;
      soundPlayed = false;
    }
    
    //let the balloons be able to pop and rise
    for (int i = 0; i < balloons.length; i++){
      balloons[i].rise();
      balloons[i].popBalloon();
    }
  }
}
