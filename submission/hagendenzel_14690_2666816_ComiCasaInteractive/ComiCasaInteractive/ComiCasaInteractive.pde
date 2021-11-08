Shop comicasa;
Pawn[] pawn;
Square[] board;
int players;
int currentPlayer;
int visibleSquares;
int winningPlayer;

boolean gameStarted;
boolean pawnStill;    // pawns are not moving
boolean gameOver;

void setup() {
  size(1800, 900);
  comicasa = new Shop();

  //initialising all pawns
  pawn = new Pawn[6];
  for (int i = 0; i < pawn.length; i++) {
    pawn[i] = new Pawn(115, 500+i*50, i+1);
  }
  players = 0;
  currentPlayer = 0;
  winningPlayer = -1;

  // initialising the board
  createBoard();

  // initialising booleans and numeric variables
  gameStarted = false;
  pawnStill = true;
  gameOver = false;

  visibleSquares = 0;
}

void draw() {
  background(255, 0, 255);
  comicasa.display();
  // UPDATING

  //updating pawns
  for (int i = 0; i < pawn.length; i++) {
    pawn[i].update();
  }

  // checking whether a pawn is moving
  pawnStill = movingPawnCheck();

  // DRAWING

  //drawing the board
  if (gameStarted) {
    for (int i = 0; i < visibleSquares && i < board.length; i++) {
      board[i].display();
    }
    visibleSquares++;
  }
  //drawing pawns
  for (int i = 0; i < pawn.length; i++) {
    pawn[i].display();
  }

  // drawing the player numbers
  if (!gameStarted) {
    playerSelection();
  }

  // drawing the roll button
  if (gameStarted && pawnStill) {
    textAlign(CENTER);

    fill(0);
    if (!gameOver) {
      textSize(100);
      text("ROLL", 1125, 180+25);
    } else {
      int winner = winningPlayer + 1;
      text("Player " + winner + " wins!", 1125, 180+25);
    }
  }
}

void playerSelection() {
  textAlign(LEFT);
  textSize(100);
  fill(0);
  for (int i = 0; i < 4; i++) {
    text(i+1, i*225+112.5-40, 180+40);
  }
  for (int i = 4; i < 6; i++) {
    text(i+1, (i+2)*225+112.5-40, 180+40);
  }
}

boolean movingPawnCheck() {
  boolean still = true;
  for (int i = 0; i < pawn.length; i++) {
    still = still && pawn[i].onTarget();
  }
  return still;
}

void createBoard() {
  board = new Square[100];
  for (int i = 0; i < 10; i++) {
    if (i%2 ==0) {
      for (int j = 0; j < 5; j++) {
        board[i*10+j] = new Square(515+j*80, 800-i*45, i*10+j+1);
      }
      for (int j = 5; j < 10; j++) {
        board[i*10+j] = new Square(1015+j*80, 800-i*45, i*10+j+1);
      }
    } else {
      for (int j = 0; j < 5; j++) {
        board[i*10+j] = new Square(1735-j*80, 800-i*45, i*10+j+1);
      }
      for (int j = 5; j < 10; j++) {
        board[i*10+j] = new Square(1235-j*80, 800-i*45, i*10+j+1);
      }
    }
  }
}

void roll() {
  int roll = int(random(1, 6));  // roll a d6
  int currentSquare = pawn[currentPlayer].getSquare(); // get the square the player is on
  int targetSquare = currentSquare + roll; // find the square the player will be on
  // --- I probably want to move square checking to Pawn
  if (targetSquare == 99) {        // check if the player has won.
    winningPlayer = currentPlayer;
    gameOver = true;
  } else if (targetSquare >= 100) {
    targetSquare = 198 - targetSquare;
  }
  pawn[currentPlayer].setSquare(targetSquare);
  pawn[currentPlayer].setTarget(board[targetSquare].getX(), board[targetSquare].getY());
  currentPlayer = (currentPlayer + 1)% players;
}

void mousePressed() {
  if (!gameOver) {
    // checking how many players will play
    if (mouseY > 130 && mouseY < 230 && !gameStarted) {
      boolean actualNumber = false;        // used to check whether a number was actually selected
      if (mouseX > 65 && mouseX < 165) {
        players = 1;
        actualNumber = true;
      }
      if (mouseX > 290 && mouseX < 390) {
        players = 2;
        actualNumber = true;
      }
      if (mouseX > 515 && mouseX < 615) {
        players = 3;
        actualNumber = true;
      }
      if (mouseX > 740 && mouseX < 840) {
        players = 4;
        actualNumber = true;
      }
      if (mouseX > 1390 && mouseX < 1490) {
        players = 5;
        actualNumber = true;
      }
      if (mouseX > 1615 && mouseX < 1715) {
        players = 6;
        actualNumber = true;
      }
      if (actualNumber) {
        for (int i = 0; i < players; i++) {
          pawn[i].setTarget(board[0].getX(), board[0].getY());
          pawn[i].setSquare(0);
        }
        gameStarted = true;
      }
    }
    // check whether the player is clicking the roll button
    if (mouseY > 130 && mouseY < 230 && gameStarted && mouseX > 900 && mouseX < 1350) {
      roll();
    }
  }
}
