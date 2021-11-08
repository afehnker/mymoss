class TvFrame {

  //series of special pizzas to be displayed on screen
  String[] images_display = {
    "special_pizza_1.png", "special_pizza_2.png", "special_pizza_3.png"};
  String[] pizzaimages_display = {
    "special_pizza_1.png", "special_pizza_2.png", "special_pizza_3.png"};

  PImage[] images = new PImage[images_display.length];
  PImage[] Tv = new PImage[images_display.length];
  int currentImage = 0;

  boolean showpizza;

  int startTime;
  int waitTime;
  int passedTime;

  PFont font;

  void display() {


    for (int i=0; i <images_display.length; i++)
    { 
      images[i] = loadImage(images_display[i]);
      images[i].resize(125, 75);
      Tv[i] = loadImage(pizzaimages_display[i]);
    }

    showpizza = false;

    startTime = millis();
    waitTime = 5000;
    passedTime = 0;
  }

  void update() {
    // adds an effect when the pictures change
    image(images[0], 115, 85);
    pushMatrix();
    translate(180-images[currentImage].width/2, 123-images[currentImage].height/2);
    ////special effect happens when displaying a new pizza
    for (int j = 0; j < 500; j++) {
      int x = (int) random(images[currentImage].width);
      int y = (int) random(images[currentImage].height);
      color c = images[currentImage].get(x, y);
      fill(0);
      images[0].set(x, y, c);
    }
    popMatrix();


    passedTime = millis() - startTime;

    //one picture is displayed afer the other and when they finish their rotation, the first pizza is displayed again
    if (passedTime > waitTime) {
      currentImage++;
      showpizza = false;
      startTime = millis();
    }

    if (currentImage > images_display.length - 1)
      currentImage = 0;

    //text
    font = createFont("font_pizza.ttf", 15);
    textAlign(CENTER);
    textFont(font, 25);
    fill(255);
    text("coming", 178, 80);
    textFont(font, 25);
    text("soon", 177, 185);
  }
}
