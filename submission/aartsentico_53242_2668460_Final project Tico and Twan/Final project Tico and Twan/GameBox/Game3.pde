//This program is made by Tico Aartsen and Twan de Groot
class Game3 {                                                      //declaring and initializing
  int amountOfBlocks = 9;                                          //variables
  int blockX[] = {808, 861, 916, 808, 861, 916, 808, 862, 916};
  int blockY[] = {29, 29, 28, 83, 83, 83, 137, 137, 137};
  color col[] = {color(255, 255, 255), color(255, 0, 0), 
    color(0, 255, 68), color(255, 137, 0), color(0, 0, 255), 
    color(255, 255, 0)};

  color colBlock[] = new color[amountOfBlocks];

  Game3() {
    for (int i = 0; i<amountOfBlocks; i++) {
      colBlock[i] = col[int(random(col.length))];
    }
  }

  void display() {                                   //display all the blocks with their colors
    for (int i = 0; i<amountOfBlocks; i++) {
      fill(colBlock[i]);
      rect(blockX[i], blockY[i], 50, 50);
    }
  }

  void clicked() {
    for (int i = 0; i<amountOfBlocks; i++) {                 //check for all blocks if the click-
      if ((mouseX > blockX[i] && mouseX < blockX[i] + 50) && //location is the block and change
        mouseY > blockY[i] && mouseY < blockY[i] + 50 ) {    //the color of it
        colBlock[i] = col[int(random(col.length))];
      }
    }
    int amountOfSameColor = 1;                               //Count the total amount of
    for (int i = 1; i<amountOfBlocks; i++) {                 //blocks that have the same color
      if (colBlock[0] == colBlock[i]) {                      //as the first block
        amountOfSameColor++;
      }
    }
    if (amountOfSameColor == 9) {                            //if all colors are the same,
      for (int i = 1; i<amountOfBlocks; i++) {               //Change the loaded background
        colBlock[i] = col[int(random(col.length))];          //image and change the current game
      }                                                      //to game 2
      shopping_front = loadImage("Shopping_front2.jpg");
      currentGame = 2;
    }
  }
}
