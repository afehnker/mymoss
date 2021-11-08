//Class made by Rita Youssif s2615444 for the final project for the subject programming. 
//Purpose: This class shows two books that the user can click on which makes the book change color and title. It can be reset by pressing the cube below the books. 
//Disclaimer: all images used are from Google images and used for educational purposes. 

class Book {
  boolean changeText= false; 
  boolean changeTitle = false; 
  void display() {

    //The book that is on top
    if (changeText==false) {                              // These sizes, colors and titles (text) will appear as a default
      pushMatrix();
      fill(80, 200, 220);
      rect(width/6 * 1.12, height/2 *1.458, 120, 30, 2);
      fill(0, 0, 0);
      textSize(14);
      text("Travel", width/5 *1.07, height/4 *2.99);
      textSize(9);
      text("GUIDE", width/5 *1.1, height/4 *3.03);
      popMatrix();
    }

    if (changeText) {                                     // These sizes, colors and titles (text) will appear after the boolean changeText has become true.
      pushMatrix(); 
      fill(300, 100, 9);
      rect(width/6 * 1.12, height/2 *1.458, 120, 30, 5);
      fill(20, 50, 100);
      textSize(12); 
      text("COOKING RECIPES", width/6 *1.152, height/4 *3.01);
      popMatrix();
    }
    // The book that is on the bottom
    if (changeTitle ==false) {                            // These sizes, colors and titles (text) will appear as a default
      pushMatrix(); 
      fill(200, 20, 10);
      rect(width/6 *1.05, height/4 *3.05, 150, 35, 5);
      fill(255, 255, 255);
      textSize(14);
      text("PROGRAMMING 101", width/6 *1.08, height/4 *3.15);
      popMatrix();
    }
    if (changeTitle) {                                     // These sizes, colors and titles (text) will appear after the boolean changeTitle has become true.
      pushMatrix(); 
      fill(150, 220, 80);
      rect(width/6 *1.05, height/4 *3.05, 150, 35, 7);
      fill(200, 10, 90);
      textSize(20); 
      text("PICTURE BOOK", width/6 *1.07, height/4 *3.16);
      popMatrix();
    }
  }

  void TitleChange() {                                                    // In this void the booleans changeTitle and changeText are controlled
    if  (mouseX < 330 && mouseY >657 && mouseX >270 && mouseY < 684) {
      changeText = true;                                                  // When the if-statement conditions have been met the boolean changeText will become true
    }
    if (mouseX <375 && mouseY > 686 && mouseX >227 && mouseY < 720) {
      changeTitle = true;                                                 // When the if-statement conditions have been met the boolean changeTitle will become true
    }
    if (mouseX < 420 && mouseY > 721 && mouseX > 180 && mouseY < 899) {
      changeText = false;                                                // When the if-statement conditions have been met the boolean changeText and changeTitle will become false
      changeTitle = false;
    }
  }
}
