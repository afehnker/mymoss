/*
 The Puzzle game is a game with puzzle pieces you can move to the right position.
 Before the game starts, a loading screen is showed.
 The goal is to complete the puzzle.
 After the puzzle is completed, you will be congratulated.
 
 Illustrations made by Jacelynn Moesker
 Code written by Susanne Fuentes Bongenaar
*/

class Puzzle {
  boolean gameStart;
  boolean solved;
  float boardX;
  float boardY;
  int boardSize;
  int[] colums = {0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3};
  int[] rows = {0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3};
  PreGame loadScreen;
  Piece[] pieces = new Piece[16];
  
  Puzzle() {
    gameStart = false;
    boardX = 0;
    boardY = 0;
    boardSize = pieces.length;
    loadScreen = new PreGame();
    for (int i = 0; i < pieces.length; i++) {
      pieces[i] = new Piece(colums[i]*width/8 + 240, rows[i]*height/7 +150, loadImage(i+".png"));
    }
  }

  void display() {
    if (!gameStart) {
      loadScreen.display();
      leavePreGame();
    } else if (gameStart) {
      solved = true;
      background(210);

      //draw the puzzle board
      pushMatrix();
      //take this as the top left as reference point
      translate(boardX, boardY);
      noFill();
      stroke(0);
      strokeWeight(4);
      for (int i = 0; i < pieces.length; i++) {
        rect(colums[i]*width/8 + 240, rows[i]*height/7 +150, 100, 100);
      }
      popMatrix();

      //draw exit button
      fill(0);
      rect(20, 20, 40, 40);
      
      //draw the cross
      stroke(255,0,0);
      strokeWeight(4);
      line(30,30,50,50);
      line(30,50,50,30);

      //draw the puzzle pieces, the invisible piece place, check and update the correct place
      update();

      //draw congratulation message when the puzzle is solved
      solvedPuzzle();
    }
  }

  // ---------------------------------------------------------------------------------- screen setup
  //deactive the current game and reinitialize the main screen
  void leavePuzzleGame() {
    game1 = false;
    gameStart = false;
  }

  //when the button is clicked, run the deactivation of the current game
  void selectLeaveButton(float newX, float newY) {
    //check if the mouse position is within the correct button area
    if (newX < 60 && newX > 20 && newY < 60 && newY > 20) {
      leavePuzzleGame();
      puzzleGame.resetPieces();
    }
  }

  //leave the loading screen and start the game, a short time after 100% has been reached
  void leavePreGame() {
    if (loadScreen.counter == loadScreen.waitingTime) {
      gameStart = true;
    }
  }

  //show the puzzle pieces, update their position correctly and check whether the puzzle is solved
  void update() {
    for (int i = 0; i <pieces.length; i++) {
      pieces[i].display();
      pieces[i].puzzleInPlace();
      if (pieces[i].inPlace != true) {
        solved = false;
      }
    }
  }
  
  //reset important values of the loadscreen
  void resetLoadScreenValues() {
    loadScreen.reset();
  }

  //reset the position of the puzzle pieces
  void resetPieces() {
    for (int i = 0; i < pieces.length; i++) {
      pieces[i].pieceX = random(0, width-100);
      pieces[i].pieceY = random(600, height-100);
    }
  }

  // ---------------------------------------------------------------------------------- game play
  //select the puzzle pieces
  void selectPieces(float newX, float newY) {
    for (int i = pieces.length; i > 0; i--) {
      if (pieces[i-1].select(newX, newY)) {
        break;
      }
    }
  }

  //deselect the puzzle pieces
  void deselectPieces() {
    for (int i = 0; i < pieces.length; i++) {
      pieces[i].deselect();
    }
  }

  //move the puzzle pieces
  void movePieces(float newX, float newY) {
    for (int i = 0; i < pieces.length; i++) {
      pieces[i].move(newX, newY);
    }
  }

  //congratulation message when the puzzle is solved
  void solvedPuzzle() {
    if (solved) {
      fill(0);
      textSize(50);
      textAlign(CENTER);
      text("Congrats, you solved the puzzle!", width/2, height-100);
    }
  }
}
