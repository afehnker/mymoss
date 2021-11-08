//Class made by Rita Youssif s2615444 for the final project for the subject programming. 
//Purpose: the cubes are mainly for display purposes. It holds a vase and a stack of books. 
//Disclaimer: all images used are from Google images and used for educational purposes. 

class Cube {
  PImage Vase;
  PImage Flower;
  boolean Grown = false; 

  Cube() {
    Vase = loadImage("Vase.png");                     // Loads in the images for the variables.
    Flower = loadImage("Flower.png");
  }

  void display() {
    //Cube center
    fill(190, 140, 79);
    rect(width/3 *1.2, height/2 *1.47, 300, 400);

    // Cube left
    fill(175, 175, 175,220);
    rect(width/8 *1.12, height/2 *1.605, 240, 300);

    //Cube right 
    fill(80, 180, 200);
    rect(width/2 *1.4, height/2 *1.58, 300, 300);
  
    
    if (Grown) {                                         // When the if-statement condition of Grown being true has been met then the image of variable Flower will appear.
      Flower.resize(width/7, height/6);
      image(Flower, width/3 *1.36, height/3 *1.3);
    }

    Vase.resize(width/5, height/6);                      // This code makes the vase displayed.
    image(Vase, width/3 *1.26, height/2 *1.145);
  } 

  void Flowergrowth() {                                                  // This method changes the boolean Grown into true or false by meeting the conditions of the if-statements.
    if (mouseX > 628 && mouseX <720 && mouseY >518 && mouseY <660) {
      Grown = true;
    } else if (mouseX >638 && mouseX <725 && mouseY >392 && mouseY <513) {
      Grown = false;
    }
  }
}
