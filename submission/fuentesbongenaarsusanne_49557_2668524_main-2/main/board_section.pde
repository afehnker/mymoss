/*
 The BoarSection is a part of the puzzle pieces.
 It is an invisble "correct" place for the puzzle piece.
 
 Code written by Susanne Fuentes Bongenaar
*/

class BoardSection {
  float boardSectionX;
  float boardSectionY;

  BoardSection(float initX, float initY) {
    boardSectionX = initX;
    boardSectionY = initY;
  }

  void display() {
    pushMatrix();
    translate(boardSectionX, boardSectionY);

    //draw an invisible "correct" place for a puzzle piece
    noFill();
    noStroke();
    rect(0, 0, 100, 100);
    popMatrix();
  }
}
