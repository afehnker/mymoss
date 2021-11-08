/*
This class will make the painting on the left appear when clicked.
Before running the first function, the variable randomImage is already decided.
When the function display() runs it will already print the image on the canvas, but with an alpha of 0.
Because of this the image will not be shown to the user without clicking it.
When clicked, the function pressedMouse() will trigger the code inside the function update(), and the alfa will higher slowly.
After this the image will be revealed to the user and a sound will play.
*/
class Painting {
  //initialising variables, colors and images
  int paintingXPos;
  int paintingYPos;
  int paintingHeight;
  int alpha;
  boolean revealImage;
  boolean soundPlayed;
  int totalImages = 5;
  PImage[] images = new PImage[totalImages]; // an array to store the images in
  PImage Image0;
  PImage Image1;
  PImage Image2;
  PImage Image3;
  PImage Image4;
  int randomImage;
  
  Painting() {
    //assinging value to variables and colors
    paintingXPos = 25;
    paintingHeight = 600;
    paintingYPos = height - paintingHeight;
    revealImage = false;
    soundPlayed = false; //variable for not making the sound play multiple times.
    randomImage = floor(random(0,totalImages)); //select a random image when program starts
    
    //load images
    Image0 = loadImage("Image0.png");
    Image1 = loadImage("Image1.png");
    Image2 = loadImage("Image2.png");
    Image3 = loadImage("Image3.png");
    Image4 = loadImage("Image4.png");
    images[0] = Image0;
    images[1] = Image1;
    images[2] = Image2;
    images[3] = Image3;
    images[4] = Image4;
  }

  void display() {
    fill(255);
    rect(paintingXPos, paintingYPos, 299,399); // display white canvas for image
    tint(255,alpha);
    image(images[randomImage],paintingXPos, paintingYPos); // display image
    if (revealImage && !soundPlayed) {
      soundPlayed = true; //makes the sound only play once.
      if (randomImage == 0)  image0.play();
      if (randomImage == 1)  image1.play();
      if (randomImage == 2)  image2.play();
      if (randomImage == 3)  image3.play();
      if (randomImage == 4)  image4.play();
    }
  }
  
  void update() {
    if (revealImage && alpha <= 255){
      alpha += 2; //makes the image appear slowly instead of instantly.
    }
  }
  
  void pressedPainting() {
    if (mouseX >= paintingXPos && mouseX <= paintingXPos + 300 && mouseY >= paintingYPos && mouseY <= paintingYPos + 400){
       revealImage = true; //makes the image only reveal when the mouse is in the correct area.
    }
  }
}
