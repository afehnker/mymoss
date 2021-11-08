/*Marleen de Ruijter
 Final project
 
 Picture park by Valiphotos from pixabay.com
 Picture pinecone from pixabay.com
 Picture leaves are from Google Images
 Squirrels are from my Creature project
 
 Interactions:
 1 - Make squirrels smaller
 2 - Make squirrels bigger
 3 - Flip squirrels
 4 - Change color of squirrels
 5 - Colors squirrels to original colors
 6 - Change position of pinecones
 7 - Make it night
 8 - Make it day
 Hold 9 - Display a shop window
 Enter - remove all leaves
 You can make the butterflies fly faster when you drag the mouse or replace a squirrel. 
 You can replace a squirrel by dragging it.
 You can click your mouse and then leaves will where you click and a branch with leaves will display at a random place. 
 */

int tintR = 255;    //Tint values used to make it night
int tintG = 255;    //The values are initialised to the default values
int tintB = 255;

PImage pineconeImage;    //There are all the images in my program 
PImage parkImage;
PImage butterflyImage;
PImage leafImage;
PImage branchleafImage;
PImage stansLogo;


Squirrel[] squirrel = new Squirrel[10];    //create the new squirrels
Butterfly[] butterfly = new Butterfly[10];    //create the new butterflies
Pinecone[] pinecone = new Pinecone[10];    //create the new pinecones


ArrayList<Integer[]> arLeafs = new ArrayList<Integer[]>();        //making an ArrayList for displaying the leafs
ArrayList<Integer[]> arBranchLeafs = new ArrayList<Integer[]>();        //making an ArrayList for displaying the branch with leafs


void setup() {
  size(1280, 853);

  pineconeImage = loadImage("pineconesmall.png");        //Load in all the images
  parkImage = loadImage("park.jpg");
  butterflyImage = loadImage("butterfly.png");
  leafImage = loadImage("groupleavescenter.png");
  branchleafImage = loadImage("leafbranchsmall.png");
  stansLogo = loadImage("laStansLogo.png"); 


  for (int i = 0; i < squirrel.length; i++) {
    squirrel[i] = new Squirrel(int(random(20, width-80)), int(random(550, height-100)));    //give the squirrels a random place
  }

  for (int i = 0; i < butterfly.length; i++) {
    butterfly[i] = new Butterfly(butterflyImage, int(random(0, width-80)), int(random(0, height-300)));    //give the butterflies a random place
  }

  for (int i = 0; i < pinecone.length; i++) {
    pinecone[i] = new Pinecone(pineconeImage, int(random(20, width-80)), int(random(550, height-100)));    //give the pinecones a random place
  }
}

void draw() {
  tint(tintR, tintG, tintB);

  image(parkImage, 0, 0);
  for (int i = 0; i < squirrel.length; i++) {    //display squirrels
    squirrel[i].display();
  }
  for (int i = 0; i < arLeafs.size(); i++) {
    imageMode(CENTER);
    image(leafImage, arLeafs.get(i)[0], arLeafs.get(i)[1]);       //Acces the array with two values as coordinaties and display image
    imageMode(CORNER);
  }

  for (int i = 0; i < arLeafs.size(); i++) {
    image(branchleafImage, arBranchLeafs.get(i)[0], arBranchLeafs.get(i)[1]);                  //Acces the array with two values as coordinaties and display image
  }
  
  for (int i = 0; i < pinecone.length; i++) {    //display pinecones
    pinecone[i].display();
  }

  for (int i = 0; i < butterfly.length; i++) {    //display butterflies and bounce butterflies
    butterfly[i].bounce();//i
    butterfly[i].display();
  }



  if (keyPressed==true) {    //Only draw the shop window when you hold key 9
    if (key=='9') {
      pushMatrix();    
      translate(0, 0);    //translate is used to deal with pixel abstraction this is inside a pushMatrix() and popMatrix()
      
      fill(255, 255, 255, 100);    //The glass
      rect(0, 0, width, height);

      fill(100, 100, 100);        //The bars on the left, right and bottom
      rect(0, height-40, 1280, 40);
      rect (width-40, 0, 40, 853);
      rect (0, 0, 40, 853);

      fill(206, 206, 206);    //The gray top part and the La Stans Logo
      rect(0, 0, 1280, 180);
      imageMode(CENTER);
      image(stansLogo, width/2, 90);
      imageMode(CORNER);
      popMatrix();
    }
  }
} 

void mouseDragged() {
  for (int i = 0; i < squirrel.length; i++) {    //move squirrels: when selected and move when mouse is dragged
    squirrel[i].move(mouseX, mouseY);
  }

  for (int i = 0; i < squirrel.length; i++) {    //display squirrels
    butterfly[i].bounce();//i
  }
}

void mousePressed() {
  arLeafs.add(new Integer[]{mouseX, mouseY});          //When you press the mouse a new tuple will be added of the x-coordinate and y-coordinate of the mouse
  arBranchLeafs.add(new Integer[]{int(random(0, width)), int(random(0, height))});    //When you press the mouse a new tuple will be added of two random values

  for (int i = 0; i < squirrel.length; i++) { 
    squirrel[i].select(mouseX, mouseY);  //checks if mouse is near squirrel
    if (squirrel[i].isSelected) {    //returns it the function is true or not
      break;
    }
  }
}

void mouseReleased () {
  for (int i = 0; i < squirrel.length; i++) {
    squirrel[i].release();    //turns isSelected to false
  }
}

void keyPressed() {
  for (int i = 0; i < squirrel.length; i++) {
    if (key=='1') {
      squirrel[i].resizeSquirrel(0.5);    //resize smaller squirrels if you press key 1
    }

    if (key=='2') {
      squirrel[i].resizeSquirrel(2);  //resize bigger squirrels if you press key 2
    }

    if (key=='3') {
      squirrel[i].flipSquirrel();  //flip squirrels if you press key 3
    }

    if (key=='4') {
      squirrel[i].changeColorSquirrel();  //change color of the squirrels if you press key 4
    }

    if (key=='5') {
      squirrel[i].normalColorSquirrel();  //turn the color of the squirrels  to the normal state if you press key 5
    }

    if (key=='6') {
      for (int j = 0; j < pinecone.length; j++) { 
        pinecone[i] = new Pinecone(pineconeImage, int(random(20, width-80)), int(random(550, height-100)));    //give the pinecones a random place
      }
    }

    if (key=='7') {
      tintR = 100;      //Make it night
      tintG = 200;
      tintB = 200;
    }

    if (key=='8') {
      tintR = 255;    //Make it day
      tintG = 255;
      tintB = 255;
    }

    if (key==ENTER) {
      arLeafs.clear();    //Remove all the leaves by clearing the arrayList
    }
  }
}
