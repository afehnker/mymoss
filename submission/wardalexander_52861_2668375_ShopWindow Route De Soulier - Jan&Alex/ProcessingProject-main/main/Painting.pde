class Painting {
  int paintingRed;
  int paintingGreen;          //global variables that control the color of the painting
  int paintingBlue;

  Painting() {
    paintingRed=177;
    paintingGreen=230;          //sets values for color
    paintingBlue=224;
  }

  void display() {
    fill(paintingRed, paintingGreen, paintingBlue);
    stroke(120);
    strokeWeight(5);
    rect(0, 500, 700, 500);                    //draws the blue background and displays the image of the tree
    image(tree, 360, 830, 850, 650);
    noStroke();
  }
}
