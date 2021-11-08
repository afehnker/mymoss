/*
 The Piece is a part of the Puzzle game.
 Every piece is created with an image.
 The Piece has a board section, which is the correct position within the game.
 A Piece can be selected and change position.
 Whenever a Piece is close to its board section, it will automatically go to that position.
 
 Code written by Susanne Fuentes Bongenaar
*/

class Piece {
  boolean isSelected;
  boolean inPlace;
  float pieceX;
  float pieceY;
  PImage pieceImage;
  BoardSection place;

  Piece(float initX, float initY, PImage initImage) {
    isSelected = false;
    inPlace = false;
    pieceX = random(0, width-100);
    pieceY = random(600, height-100);
    pieceImage = initImage;
    place = new BoardSection(initX, initY);
  }

  void display() {
    place.display();
    pushMatrix();
    translate(pieceX, pieceY);
    imageMode(CENTER);
    image(pieceImage, 50, 50, 100, 100);
    popMatrix();
    pieceOnScreen();
  }

  //return true when the correct piece is selected
  boolean select(float newX, float newY) {
    if (newX < pieceX + 100 && newX > pieceX && newY < pieceY + 100 && newY > pieceY) {
      isSelected = true;
      return true;
    } else {
      return false;
    }
  }

  void deselect() {
    isSelected = false;
  }

  //move the puzzle pieces
  void move(float newX, float newY) {
    if (isSelected) {
      pieceX = newX-50;
      pieceY = newY-50;
    }
  }

  //make sure the piece stays within the playing field
  void pieceOnScreen() {
    if (pieceX > width) {
      pieceX = width-105;
    }
    if (pieceX < -25) {
      pieceX = 5;
    }
    if (pieceY > height) {
      pieceY = height-105;
    }
    if (pieceY < -25) {
      pieceY = 65;
    }
  }

  //put the puzzle pieces in the right place, when the pieces are dragged near the correct position
  void puzzleInPlace() {
    if (pieceX > place.boardSectionX -60 && pieceX < place.boardSectionX +50 && pieceY > place.boardSectionY -60 && pieceY < place.boardSectionY +50 && isSelected == false) {
      pieceX = place.boardSectionX;
      pieceY = place.boardSectionY;
    }
    //check if the position of the piece is correct
    if (pieceX == place.boardSectionX && pieceY == place.boardSectionY) {
      inPlace = true;
    } else {
      inPlace = false;
    }
  }
}
