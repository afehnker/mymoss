class CellMenu {
    PImage backgroundImage, text;
    int backButtonX, backButtonY, backButtonWidth, backButtonHeight, gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight;

    /*
    * Initializes all the data used by this object.
    */
    void init() {
        backgroundImage = loadImage("assets/cell.png");
        surface.setSize(backgroundImage.width, backgroundImage.height);
        state = 6;

        backButtonX = 0;
        backButtonY = backgroundImage.height - 100;
        backButtonWidth = gameButtonWidth = 200;
        backButtonHeight = gameButtonHeight = 100;

        gameButtonX = backgroundImage.width - gameButtonWidth; 
        gameButtonY = backgroundImage.height - gameButtonHeight;

        text = gradientText("Do you want to choose this character?", 750, 200, 32);
    }

    /*
    * Draws the menu to the screen.
    */
    void draw() {
        background(backgroundImage);

        textSize(17);
        fill(0, 0, 0, 255);
        text("Cell is the ultimate creation of Dr. Gero, designed via cell recombination\n" +
"using the genetics of the greatest fighters that the remote tracking\n" +
"device could find on Earth. The result was a \"perfect warrior\",\n" +
"possessing numerous favorable genetic traits and special abilities from\n" +
"Goku, Vegeta, Piccolo, Frieza and King Cold.", 0, 50);
        image(text, 10, 387);

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
    * Handles mouse presses inside the menu, checking whether or not a button was pressed.
    */
    void mousePressed() {
        if (overRect(backButtonX, backButtonY, backButtonWidth, backButtonHeight)) {
            reset();
        } else if (overRect(gameButtonX, gameButtonY, gameButtonWidth, gameButtonHeight)) {
            cellGame = new CellGame();
            cellGame.init();
        }
    }
}