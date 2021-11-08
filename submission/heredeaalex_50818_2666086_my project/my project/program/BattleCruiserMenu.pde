class BattleCruiserMenu {
    PImage backgroundImage;
    PImage text;
    int x;
    int backButtonX, backButtonY, backButtonWidth, backButtonHeight;
    int gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight;
    BattleCruiserMenu() {
        backgroundImage = loadImage("assets/battlecruiser4.png");
    }

    /*
    * Initializes all the data that this object requires.,
    */
    void init() {
        state = 1;
        surface.setSize(backgroundImage.width, backgroundImage.height);
        backButtonX = 0; backButtonY = 570; backButtonWidth = 200; backButtonHeight = 100;
        gameButtonWidth = 200; gameButtonHeight = 100;
        gameButtonX = backgroundImage.width - gameButtonWidth; gameButtonY = backgroundImage.height - gameButtonHeight;

        text = gradientText("Do you want to choose this ship?", 750, 250, 36);
    }

    /*
    * Draws the battle cruiser menu.
    */
    void draw() {
        background(backgroundImage);
        fill(0, 0, 0, 255);
        textSize(24);
        text("Battlecruisers fire rapid low damage shots from laser batteries,\n" +
"with the anti-ground attack being more powerful than the anti-air attack.\n" +
"This makes them better able at handling groups of weaker, low armor, units.\n" +
"Battlecruisers are heavily armored.\n" + 
"Controls: Z to shoot.", 5, 25);

        image(text, 284, 325);

        fill(224, 63, 90, 100);
        rectMode(CORNER);
        rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight);

        fill(255, 255, 255, 255);
        textSize(36);
        text("Go back", backButtonX + backButtonWidth / 2 - 60, backButtonY + backButtonHeight / 2 + 10);

        fill(64, 194, 227);
        rect(gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight);
        fill(255, 255, 255, 255);
        text("Play game", gameButtonX + gameButtonWidth / 2 - 85, gameButtonY + gameButtonHeight / 2 + 10);
    }

    /*
    * Handles mouse presses inside the battle cruiser menu.
    */
    void mousePressed() {
        if (overRect(backButtonX, backButtonY, backButtonWidth, backButtonHeight)) {
            reset();
        } else if (overRect(gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight)) {
            battleCruiserGame = new BattleCruiserGame();
            battleCruiserGame.init();
        }
    }
}