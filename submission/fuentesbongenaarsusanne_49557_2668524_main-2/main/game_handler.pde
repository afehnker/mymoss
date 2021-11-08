/*
 The Game Handler is a class that manages the city with its games, the puzzle and fill the glass game.
 It indexes all the actions exectuded for mouse and keys handles.
 
 Code written by Susanne Fuentes Bongenaar
*/

class GameHandler {
  Surroundings city;

  GameHandler() {
    city = new Surroundings(0, 0);
    puzzleGame = new Puzzle();
    fillTheGlass = new BottleGame();
  }

  void display() {
    if (!game1 && !game2) {
      city.display();
    }
    if (game1) {
      puzzleGame.display();
    }
    if (game2) {
      fillTheGlass.display();
    }
  }

  void moveAvatar() {
    city.moveAvatar();
  }

  void gameNavigation() {
    city.selectGameButtonLeft(mouseX, mouseY);
    city.selectGameButtonRight(mouseX, mouseY);
    puzzleGame.selectLeaveButton(mouseX, mouseY);
    puzzleGame.selectPieces(mouseX, mouseY);
    fillTheGlass.selectLeaveButton(mouseX, mouseY);
    fillTheGlass.selectBottles(mouseX, mouseY);
  }

  void puzzlePieceDeselect() {
    puzzleGame.deselectPieces();
    fillTheGlass.deselectBottles();
  }

  void movePuzzlePiece() {
    puzzleGame.movePieces(mouseX, mouseY);
    fillTheGlass.moveBottles(mouseX, mouseY);
  }

  void leaveBottleGame() {
    if (key == 'e' || key == 'E') {
      fillTheGlass.leaveBottleGame();
    }
  }
}
