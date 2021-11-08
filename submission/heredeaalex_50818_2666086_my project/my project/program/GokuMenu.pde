class GokuMenu {
    PImage backgroundImage;
    PImage text;
    int backButtonX, backButtonY, backButtonWidth, backButtonHeight, gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight;

    /*
    * Initializes all the data used by this object.
    */
    void init() {
        state = 3;
        backgroundImage = loadImage("assets/goku_menu.png");
        backButtonX = 0;
        backButtonY = 580;
        backButtonWidth = gameButtonWidth = 200;
        backButtonHeight = gameButtonHeight = 100;

        gameButtonX = backgroundImage.width - gameButtonWidth; 
        gameButtonY = backgroundImage.height - gameButtonHeight;

        text = gradientText("Do you want to choose this character?", 750, 200, 36);

        surface.setSize(backgroundImage.width, backgroundImage.height);
    }

    /*
    * Draws the menu.
    */
    void draw() {
        background(backgroundImage);

        fill(255,0,0,255);
        textSize(20);
        text("Goku is a character from Dragon Ball series that is considered the strongest guy.\n" +
"He gets stronger with each fight training until he is close to death.\n" +
"He is a nice guy that fights a lot with bad and good guys.\n" +
"He has a character development somewhere in the plot.", 0, 50);
        image(text, 125, 387);

        fill(224, 63, 90, 100);
        rectMode(CORNER);
        rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight);

        fill(255, 255, 255, 255);
        textSize(36);
        text("Go back", backButtonX + backButtonWidth / 2 - 60, backButtonY + backButtonHeight / 2 + 10);

        fill(64, 194, 227, 100);
        rectMode(CORNER);
        rect(gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight);

        fill(255, 255, 255, 255);
        textSize(36);
        text("Play game", gameButtonX + gameButtonWidth / 2 - 75, gameButtonY + gameButtonHeight / 2 + 10);
    }

    /*
    * Handles mouse presses, checking if a button was pressed.
    */
    void mousePressed() {
        if (overRect(backButtonX, backButtonY, backButtonWidth, backButtonHeight)) {
            reset();
        } else if (overRect(gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight)) {
            gokuGame = new GokuGame();
            gokuGame.init();
        }
    }
}