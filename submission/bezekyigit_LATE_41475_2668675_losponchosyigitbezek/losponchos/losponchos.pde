//global vars //<>//
PImage bullpng, arenapng, gonzalezpng, runpng, burritopng, tacopng, hotSaucepng, ponchopng, endpng, winpng;
import processing.sound.*;
SoundFile clap;
Bull bull;
Hooman gonzalez;
Interactables burrito, taco, hotSauce;
void setup() {

  clap=new SoundFile(this, "assets/clap.wav");
  size(1920, 1080);
  arenapng = loadImage("assets/mylastarena.png");
  bullpng = loadImage("assets/sbull.png");
  gonzalezpng=loadImage("assets/gonzalezz.png");
  runpng=loadImage("assets/run.png");
  burritopng=loadImage("assets/burrito.png");
  tacopng=loadImage("assets/taco.png");
  hotSaucepng=loadImage("assets/hotsauce.png");
  ponchopng=loadImage("assets/poncho.png");
  endpng=loadImage("assets/losponchosloose.png");
  winpng=loadImage("assets/win.png");
  gonzalez=new Hooman();
  bull=new Bull();
  burrito= new Interactables('b');
  taco= new Interactables('t');
  hotSauce= new Interactables('h');
}
void draw() {
  //updating events are in the if method so that they will stop udpating when the game is finished
  if (bull.gameWon) {
    
    background(winpng);
    
  } else {
    
    if (!bull.gameIsOver && !gonzalez.gameIsOver) {
      
      interactionHandler(); 
      
      collisionHandler();
      
      bull.movebull(gonzalez.xLocation+(gonzalez.widthOfGonzalez/2), gonzalez.yLocation+(gonzalez.heightOfGonzalez/2));
      
      gonzalez.moveGonzalez();
      
      background(arenapng);
      
    } else {
      
      background(endpng);
      
    }
  }

//all display done here
  bull.displaybull();

  gonzalez.displayGonzalez();
  
  burrito.displayTheInteractableObject(0, 0);
  
  taco.displayTheInteractableObject(0, 0);
  
  hotSauce.displayTheInteractableObject(0, 0);

  gonzalez.displayHealthBarGonzalez();
  
  bull.displayHealthBull();

  bull.isGonzalezDead(gonzalez.gameIsOver);
 
}
//move function handled buy arrow keys
void keyPressed() {


  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      gonzalez.changeDirectionOfGonzalez(-1, 0, true);
    }
    if (keyCode == RIGHT)
    {
      gonzalez.changeDirectionOfGonzalez(1, 0, true);
    }
    if (keyCode == UP)
    {
      gonzalez.changeDirectionOfGonzalez(0, -1, true);
    }
    if (keyCode == DOWN)
    {
      gonzalez.changeDirectionOfGonzalez(0, 1, true);
    }
  }
  if (key == ' ') {
    gonzalez.changeDirectionOfGonzalez(0, 0, false);
  }
}

//the collision of bull and the mouse is checked here
void collisionHandler() {


  if (dist( ( bull.xLocation + (bull.widthOfBull / 2) ), 
    (bull.yLocation  ), 
    (gonzalez.xLocation + (gonzalez.widthOfGonzalez / 2) ), 
    (gonzalez.yLocation + (gonzalez.heightOfGonzalez / 2) ) 
    )   <90 ) {
    gonzalez.gonzalezIsHit=true;
  }
}

//the interaction betwen the taco burrito and hot sauce are checked over here if you touch or not with dist function use
void interactionHandler() {
  if ((dist(burrito.xLocation, 
    burrito.yLocation, 
    (gonzalez.xLocation + (gonzalez.widthOfGonzalez / 2) ), 
    (gonzalez.yLocation + (gonzalez.heightOfGonzalez /2)+20 ) 
    )   <40) 
    && 
    burrito.burritoIsActive
    ) {
    gonzalez.health+=25;
    burrito.burritoIsActive=false;
  }

  if ((dist(hotSauce.xLocation, 
    hotSauce.yLocation, 
    (gonzalez.xLocation + (gonzalez.widthOfGonzalez / 2) ), 
    (gonzalez.yLocation + (gonzalez.heightOfGonzalez /2)+20 ) 
    )   <40) 
    && 
    hotSauce.hotSauceIsActive
    ) {
    bull.health-=25;
    hotSauce.hotSauceIsActive=false;
  }

  if ((dist(taco.xLocation, 
    taco.yLocation, 
    (gonzalez.xLocation + (gonzalez.widthOfGonzalez / 2) ), 
    (gonzalez.yLocation + (gonzalez.heightOfGonzalez /2)+20 ) 
    )   <40) 
    && 
    taco.tacoIsActive
    ) {
    gonzalez.speedBoostConstant+=2;
    taco.tacoIsActive=false;
  }
}
