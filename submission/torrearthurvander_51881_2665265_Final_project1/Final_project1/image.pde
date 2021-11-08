class BackgroundLoader {
  PImage forestBus;
  PImage shop;
  PImage shoplayer;
  Animation ShineAnimation;
  Animation SunAnimation; 


  BackgroundLoader() {
    imageMode(CENTER);
    forestBus = loadImage("bus.png");
    shop = loadImage("shop.png");
    shoplayer = loadImage("shopcut.png");
    ShineAnimation = new Animation(300,400);
    SunAnimation = new Animation(1113,51);
    
  }

  void display() { //Depending on the state machine, the background will differ
    if (StoryProgress == "intro" || StoryProgress == "walking") {
      background(0);
    }
    if (StoryProgress == "bus") {
      image(forestBus, 700, 450);
    }
    if (StoryProgress == "shop") {
      image(shop, 700, 450);
      ShineAnimation.play(); //enahncement of background with animation
      image(shoplayer, 700, 450);
    }
    if (StoryProgress == "end") {
      background(0);
    }
  }
}
