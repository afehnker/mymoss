/*
  Main Class of the project
  Made by Jakub Stachurski
  Gods, have mercy upon me.

*/
//Loaded Images:
//Dog
PImage dogImgs[];
//Glasses
PImage glassesMask;
PImage glassesIconBase;
//Scene 1 
PImage S1BG; 
PImage S1SHELF;
PImage S1FG; 
PImage S2BG; 

//Doge
Dog dog1; 
//Glasses objects and state
//The glassesPicked is the index in the glassesArr it's -1 when no glasses are picked 
int glassesPicked = -1;
Glasses[] glassesArr;
boolean isScene1; 
boolean wearing;

void setup(){
  size(1024,1024,P2D);
  //Dogs
  dogImgs = new PImage[] {loadImage("img/dogLeft.png"),loadImage("img/dogRight.png")};
  dog1 = new Dog(510,100,400,1);
  //Glasses
  wearing = false;
  glassesMask = loadImage("img/glassesMask.png");
  glassesIconBase = loadImage("img/glassesIconBase.png");
  glassesIconBase.resize(Glasses.iconSize,Glasses.iconSize);
  println("glassimg loaded");
  glassesArr = new Glasses[15];
  for(int i = 0; i < 15; i++){
    glassesArr[i] = new Glasses(i%3 * 281 + 115, floor(i/3)* 100 + 150, color(random(0,255),random(0,255),random(0,255)));
  }
  
  isScene1 = true;
  //Scene 1 
  S1BG = loadImage("img/S1-bg.png");
  S1SHELF = loadImage("img/S1-fgShelf.png");
  S1FG = loadImage("img/S1-fg1.png");
  S1BG.resize(1024,1024);
  S1SHELF.resize(1024,1024);
  S1FG.resize(1024,1024);
  //Scene 2 
  S2BG = loadImage("img/S2-bg.png");
  S2BG.resize(1024,1024);
  println("Scenes Loaded");
  
  println("Click the dog for explanation");
}


void draw(){
  if(isScene1){ //Scene1 
    image(S1BG,0,0);
    dog1.display();
    image(S1SHELF,0,0);
    image(S1FG,0,0);
    
  } else{ //Scene2 
    image(S2BG,0,0);
    for(int i = 0 ; i < 15; i++){
      if(i != glassesPicked){
        glassesArr[i].display();
      }
    }
  }
  //effect of glasses
  if(glassesPicked >= 0){
    glassesArr[glassesPicked].display();
  }

}

void keyPressed(){
  //Change scene
  if(key == 'a'){
    isScene1 = !isScene1; 
  }
  //Put back
  if(!isScene1 && glassesPicked >= 0 && !wearing && key == 's'){
    glassesArr[glassesPicked].setIsPicked(false);
    glassesPicked = -1;
  }
  //Put on/off
  if(glassesPicked >= 0 && key == 'd'){
    println("putting glasses on/off ");
    wearing = !wearing;
    glassesArr[glassesPicked].setIsOn(wearing);
      
  }

}
void mousePressed(){
  if(isScene1){
    //Dog interaction
    if(dog1.checkIfWithin(mouseX,mouseY)){
      println("Dog Touched...");
      println("[Dog]: Welcome to the glasses shop, go in with the 'A' key, you return with the same key");
      println("[Dog]: After you entered, click on any of the glasses to pick them up, see the icon in the corner");
      println("[Dog]: Press the 'D' key to put them on or off");
      println("[Dog]: To return the glasses go inside and press the 'S' key");
      println("[Dog]: Have fun!");
    } 
  }
  else if(glassesPicked < 0){ 
    //Picking glasses
    for (int i = 0 ; i < 15; i++){
      if(glassesArr[i].checkIfWithin(mouseX,mouseY)){
        println("glasses picked");
        glassesPicked = i;
        glassesArr[glassesPicked].setIsPicked(true);
        break;
      }
    }
  }
}
