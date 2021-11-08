/*
The purpose of this class is drawing the background of the shopwindow, with
 some moving chesspieces inside of the shop. These chesspieces are made in 
 the class ChessPiece and are displayed behind the background of the shopwindow.
 */

class BackgroundShopWindow {
  ChessPiece[] pieces;

  //Constructor
  BackgroundShopWindow() {
    pieces = new ChessPiece[5];
    for (int i=0; i< pieces.length; i++)
    {
      pieces[i] = new ChessPiece(random(0, width), 430, random(-3, 3));
    }
  }

  void display() {
    background(255);
    stroke(0);
    strokeWeight(1);

    //Displaying and updating the chesspieces
    for (int i=0; i< pieces.length; i++)
    {
      pieces[i].display();
      pieces[i].movement();
    }

    //Red border
    noFill();
    strokeWeight(73);
    stroke(232, 128, 128);
    rect(width/2, height/2, width-26, height-25);
    stroke(0);
    strokeWeight(1);
    fill(125, 124, 124);

    //Bar
    rect(width/2, 675, 1400, 350); 
    fill(166, 252, 252, 125);

    //Glass
    rect(width/2, height/2, 1400, 800);
    fill(255, 255, 255);
  }
}
