//Class made by Rita Youssif s2615444 for the final project for the subject programming. 
//Purpose: shows pictures that the user can change based on what key they press. 
//Disclaimer: all images used are from Google images and used for educational purposes. 

class Pictures {
  PImage[] CityPictures = new PImage[2];
  PImage[] AnimalPictures = new PImage[2]; 
  PImage[] ArtPictures = new PImage[2];          // Here an array of each kind of picture is created.
  PImage[] GamePictures = new PImage[2]; 
  PImage[] SceneryPictures = new PImage[2]; 

  boolean qPressed = false; 
  boolean ePressed = false; 
  boolean tPressed = false;                     // The booleans that make it possible to change the pictures. 
  boolean uPressed = false; 
  boolean oPressed = false; 

  Pictures() {

    AnimalPictures[0] = loadImage("Animal1.png"); 
    AnimalPictures[1] = loadImage("Animal2.png");


    CityPictures[0] = loadImage("City1.png"); 
    CityPictures[1] = loadImage("City2.png");

                                                                        // Here each picture is loaded in.
    ArtPictures[0] = loadImage("Art1.png"); 
    ArtPictures[1] = loadImage("Art2.png"); 


    GamePictures[0] = loadImage("Game1.png"); 
    GamePictures[1] = loadImage("Game2.png"); 


    SceneryPictures[0] = loadImage("Scenery1.png"); 
    SceneryPictures[1] = loadImage("Scenery2.png");
  }

  void display() {
    //Animal pictures
    image(AnimalPictures[0], width/5 *1.14, height/5);
    if (qPressed) {
      image(AnimalPictures[1], width/5 *1.14, height/5);
    } 

    //City pictures
    image(CityPictures[0], width/4 *1.035, height/3 *1.14);
    if (ePressed) {
      image(CityPictures[1], width/4 *1.035, height/3 *1.14);
    }

    //Art pictures
    image(ArtPictures[0], width/3 *1.036, height/8 *1.1);
    if (tPressed) {
      image(ArtPictures[1], width/3 *1.036, height/8 *1.1);
    }

    //Game pictures
    image(GamePictures[0], width/2 *1.335, height/5 *1.2);
    if (oPressed) {
      image(GamePictures[1], width/2 *1.335, height/5 *1.2);
    }

    //Scenery pictures
    image(SceneryPictures[0], width/3 *1.5, height/6 *1.12);
    if (uPressed) {
      image(SceneryPictures[1], width/3 *1.5, height/6 *1.12);
    }
  }

  void PictureChange() {                                      // This method holds if-statements that when met allow the booleans to change to true or false which influences the display.
    if (key == 'q'|| key =='Q') {
      qPressed = true;  
      println("You just changed the animal picture!");
    }
    if (key =='w'|| key =='W') {
      qPressed = false;
      println("You just changed the animal picture!");
    }
    if (key =='e' || key == 'E') {
      ePressed = true;
      println("You just changed the city picture!");
    } 
    if (key =='r' || key == 'R') {
      ePressed = false;
      println("You just changed the city picture!");
    }
    if (key =='t' || key == 'T') {
      tPressed = true;
      println("You just changed the art picture!");
    }
    if (key =='y' || key == 'Y') {
      tPressed = false;
      println("You just changed the art picture!");
    }
    if (key =='u' || key == 'U') {
      uPressed = true;
      println("You just changed the scenery picture!");
    }
    if (key =='i' || key == 'I') {
      uPressed = false;
      println("You just changed the scenery picture!");
    }
    if (key =='o' || key == 'O') {
      oPressed = true;
      println("You just changed the game picture!");
    }
    if (key =='p' || key == 'P') {
      oPressed = false;
      println("You just changed the game picture!");
    }
  }
}
