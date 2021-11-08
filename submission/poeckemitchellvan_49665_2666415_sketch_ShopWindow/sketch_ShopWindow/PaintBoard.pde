/*
this class is for displaying the canvas and paint bottles and displaying the paint on the canvas.
the void display() is for displaying the canvas the brush and eraser and the array for paint and paintbottles.
the void makePaint() is for making a new object paint at the location of the mouse.
the void erasePaint() is for resetting the array of paint effectively erasing the paint from the canvas.
the void selectedColor() is for selecting a color from the pressed paint bottle.
*/
class PaintBoard {
  //initialising variables, colors and the arrays for the paint and paintbottles
  int paintBoardXPos;
  int paintBoardYPos;
  int paintBoardHeight;
  int ammountBottles = 10;
  int usedPaint = 0;
  int maxPaint = 100000;
  color selectedColor;
  color eraserRedColor;
  color eraserBlueColor;
  color brushColor;
  PaintBottle bottles[] = new PaintBottle[ammountBottles];
  Paint paint[] = new Paint[maxPaint];
  
  PaintBoard() {
    //asinging value to variables and colors
    paintBoardXPos = 855;
    paintBoardHeight = 670;
    paintBoardYPos = height - paintBoardHeight;
    selectedColor = color(255);
    eraserRedColor = color(214, 69, 69);
    eraserBlueColor = color(67, 100, 232);
    brushColor = color(178, 149, 115);
    //creating the array objects for bottles
    for (int i = 0; i < ammountBottles; i ++) {
      bottles[i] = new PaintBottle(paintBoardXPos + 40 * i,paintBoardYPos + 600); // each new bottle is 40 px further
    }
  }

  void display() {
    fill(255);
    rect(paintBoardXPos, paintBoardYPos, 400, 500);//displaying canvas
    
    //displaying brush
    fill(brushColor);
    rect(paintBoardXPos + 40,paintBoardYPos + 521,180,7); // displaying wood part
    noStroke();
    fill(selectedColor);// fill the brush with seleted color
    ellipse(paintBoardXPos + 220,paintBoardYPos + 525,20,12);//display brush
    triangle(paintBoardXPos + 220, paintBoardYPos + 520, paintBoardXPos + 220, paintBoardYPos + 530, paintBoardXPos + 235, paintBoardYPos + 525);// display brush tip
    stroke(1);
    
    //display eraser
    fill(eraserRedColor);
    rect(paintBoardXPos + 290, paintBoardYPos + 530,50,20);
    fill(eraserBlueColor);
    rect(paintBoardXPos + 340, paintBoardYPos + 530,30,20);
    
    //display the void display() for the array bottles and paint
    for (int i = 0; i < ammountBottles; i ++) {
      bottles[i].display();
    }
    for (int i = 0; i < usedPaint; i ++){
      paint[i].display();
    }
  }
  
  void makePaint(){
    //displaying the paint on the canvas
    if (mouseX >= paintBoardXPos + 4 && mouseX <= paintBoardXPos + 396 && mouseY >= paintBoardYPos + 4 && mouseY <= paintBoardYPos + 496){ 
      stroke(0);
      ellipse(mouseX,mouseY,5,5); // mouse cursor for paint
      stroke(1);
      if (mousePressed && usedPaint < maxPaint){ // if mouse is pressed create a new paint object with the selected color at the position of the mouse
        paint[usedPaint] = new Paint(mouseX,mouseY,selectedColor); 
        usedPaint ++;
      }
    }  
  }
  
  void erasePaint(){
    // if mouse is pressed at the position of the eraser the amount of paint to 0, deleting all paint from the canvas
    if (mouseX >= paintBoardXPos + 290 && mouseX <= paintBoardXPos + 370 && mouseY >= paintBoardYPos + 530 && mouseY <= paintBoardYPos + 550){  
      usedPaint = 0;
    }
  }
  
  void selectColor(){
    // executing the code from the bottle, setting the var selectedColor to the color of the pressed bottle
    for (int i = 0; i < ammountBottles; i ++) {
      bottles[i].bottlePressed();
    }
  }
}
