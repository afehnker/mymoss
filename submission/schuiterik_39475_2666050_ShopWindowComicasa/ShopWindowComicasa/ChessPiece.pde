/*
The purpose of this class is displayig the different chesspieces, with different speeds
 random colours and at a random position.
 */

class ChessPiece {

  //Position and speed
  float xPosChessPiece;
  float yPosChessPiece;
  float speed;


  //Colours
  color black = color(0);
  color white = color(252, 252, 180);
  color tint;

  //Randomized pieces and color variables
  int colorCode = int(random(0, 3));
  int piecePicker = int(random(0, 7));

  //Booleans for each piece
  boolean pawn = false;
  boolean knight = false;
  boolean rook = false;
  boolean bishop = false;
  boolean king = false;
  boolean queen = false;


  ChessPiece (float newX, float newY, float newSpeed) {
    xPosChessPiece = newX;
    yPosChessPiece= newY;
    speed = newSpeed;
  }

  void display() {
    //Pawn
    if (piecePicker == 1) {
      fill(tint);
      stroke(tint);
      strokeWeight(1);
      rect(xPosChessPiece, yPosChessPiece+60, 100, 20);
      triangle(xPosChessPiece - 30, yPosChessPiece+60, xPosChessPiece, yPosChessPiece-40, xPosChessPiece + 30, yPosChessPiece+60);
      circle(xPosChessPiece, yPosChessPiece-40, 60);
    }
    //Knight
    if (piecePicker == 2) {
      stroke(tint);
      strokeWeight(1);
      fill(tint);
      rect(xPosChessPiece, yPosChessPiece+60, 100, 20);
      rect(xPosChessPiece, yPosChessPiece+10, 30, 80);
      ellipse(xPosChessPiece+10, yPosChessPiece+30, 40, 70);
      pushMatrix();
      translate(xPosChessPiece, yPosChessPiece);
      rotate(radians(10));
      ellipse(0+10, 0-35, 70, 30);
      popMatrix();
      ellipse(xPosChessPiece - 10, yPosChessPiece - 50, 10, 25);
      ellipse(xPosChessPiece, yPosChessPiece - 50, 10, 25);
      triangle(xPosChessPiece - 30, yPosChessPiece+60, xPosChessPiece, yPosChessPiece-40, xPosChessPiece + 30, yPosChessPiece+60);
    }
    //Rook
    if (piecePicker == 3) {
      stroke(tint);
      strokeWeight(1);
      fill(tint);
      rect(xPosChessPiece, yPosChessPiece+60, 100, 20);
      rect(xPosChessPiece, yPosChessPiece+10, 50, 90);
      rect(xPosChessPiece, yPosChessPiece-20, 70, 20);
      rect(xPosChessPiece, yPosChessPiece-20, 20, 70);
      rect(xPosChessPiece-25, yPosChessPiece-40, 20, 30);
      rect(xPosChessPiece+25, yPosChessPiece-40, 20, 30);
    }
    //Bishop
    if (piecePicker == 4) {
      fill(tint);
      stroke(tint);
      strokeWeight(1);
      rect(xPosChessPiece, yPosChessPiece+70, 100, 20);
      triangle(xPosChessPiece - 20, yPosChessPiece+70, xPosChessPiece, yPosChessPiece-70, xPosChessPiece + 20, yPosChessPiece+70);
      circle(xPosChessPiece, yPosChessPiece-50, 40);
      circle(xPosChessPiece, yPosChessPiece-80, 20);
    }
    //King
    if (piecePicker == 5) {
      stroke(tint);
      strokeWeight(1);
      fill(tint);
      rect(xPosChessPiece, yPosChessPiece+70, 100, 20);
      triangle(xPosChessPiece - 20, yPosChessPiece+70, xPosChessPiece, yPosChessPiece-70, xPosChessPiece + 20, yPosChessPiece+70);
      rect(xPosChessPiece, yPosChessPiece-30, 40, 40);
      triangle(xPosChessPiece - 18, yPosChessPiece-10, xPosChessPiece, yPosChessPiece+40, xPosChessPiece + 18, yPosChessPiece-10);
      rect(xPosChessPiece, yPosChessPiece-50, 10, 60);
      rect(xPosChessPiece, yPosChessPiece-65, 30, 10);
    }
    //Queen
    if (piecePicker == 6) {
      stroke(tint);
      strokeWeight(1);
      fill(tint);
      rect(xPosChessPiece, yPosChessPiece+70, 100, 20);
      triangle(xPosChessPiece - 20, yPosChessPiece+70, xPosChessPiece, yPosChessPiece-60, xPosChessPiece + 20, yPosChessPiece+70);
      rect(xPosChessPiece, yPosChessPiece-30, 40, 40);
      triangle(xPosChessPiece - 18, yPosChessPiece-10, xPosChessPiece, yPosChessPiece+40, xPosChessPiece + 18, yPosChessPiece-10);
      circle(xPosChessPiece, yPosChessPiece-70, 15);
      circle(xPosChessPiece-20, yPosChessPiece-60, 15);
      circle(xPosChessPiece+20, yPosChessPiece-60, 15);
      rect(xPosChessPiece+19, yPosChessPiece-50, 2, 10);
      rect(xPosChessPiece-19, yPosChessPiece-50, 2, 10);
    }
  }

  void movement() {
    //If speed is zero, re-randomize
    if (speed > -1 && speed < 1) {
      speed = random(-3, 3);
    }
    //Add speed to chess piece
    xPosChessPiece = xPosChessPiece + speed;
    //Display piece on other side of shop
    if (xPosChessPiece>width) {
      xPosChessPiece = random(-100, 0);
      speed = random(1, 2);
      colorCode = int(random(0, 3));
      piecePicker = int(random(0, 7));
    } else if (xPosChessPiece<0) {
      xPosChessPiece = random(width, width+100);
      speed = random(-2, -1);
      colorCode = int(random(0, 3));
      piecePicker = int(random(0, 7));
    }
    //Decide which color the piece is
    if (colorCode == 1) {
      tint = color(black);
    } else if (colorCode == 2) {
      tint = color(white);
    }
  }
}
