PImage backgroundImage;

int battleCruiserX, battleCruiserY, gokuX, gokuY, cellX, cellY, red;
boolean decrement;
int state;
BattleCruiserMenu battleCruiserMenu;
BattleCruiserGame battleCruiserGame;
GokuMenu gokuMenu;
GokuGame gokuGame;
RainbowMenu rainbowMenu;
CellMenu cellMenu;
CellGame cellGame;
/*
* Sets up the initial window.
*/
void setup() {
    size(720, 960);
    rectMode(CENTER);
    strokeWeight(10);
    battleCruiserX = 240;
    battleCruiserY = 654;
    gokuX = 484;
    gokuY = 210;
    cellX = 195;
    cellY = 308;
    backgroundImage = loadImage("assets/gameshop.jpeg");
    reset();
}

/*
* Resets the window to its original state.
*/
void reset() {
    surface.setSize(backgroundImage.width, backgroundImage.height);
    state = 0;
    red = 0;
    decrement = false;
    battleCruiserMenu = new BattleCruiserMenu();
    gokuMenu = new GokuMenu();
    rainbowMenu = new RainbowMenu();
    cellMenu = new CellMenu();
}

/**
* Main draw loop. Passes draw function on to objects based on the current state.
*/
void draw() {
    switch (state) {
        case 0: {
            if (red >= 255) {
                decrement = true;
            } else if (red <= 0) {
                decrement = false;
            }
            red = red + (decrement ? -1 : 1);
            pushMatrix();
            image(backgroundImage, 0, 0);
            PImage image = colorImage(width, height, red, 255, 255, 100);
            image(image, 0, 0);
            popMatrix();

            //Lower memory usage as each image is only used once.
            g.removeCache(image);

            fill(255, 255, 0, 255);
            ellipse(battleCruiserX, battleCruiserY, 25, 25);
            ellipse(gokuX, gokuY, 25, 25);
            ellipse(cellX, cellY, 25, 25);
            break;
        }
        case 1: {
            battleCruiserMenu.draw();
            break;
        }
        case 2: {
            battleCruiserGame.draw();
            break;
        }
        case 3: {
            gokuMenu.draw();
            break;
        }
        case 4: {
            gokuGame.draw();
            break;
        }
        case 5: {
            rainbowMenu.draw();
            break;
        }
        case 6: {
            cellMenu.draw();
            break;
        }
        case 7: {
            cellGame.draw();
            break;
        }
    }
}

/**
* Main mousePressed function. Passes the event to objects based on the current state.
*/
void mousePressed() {
    println("X: " + mouseX + " Y: " + mouseY);
    switch (state) {
        case 0: {
            if (overCircle(battleCruiserX, battleCruiserY, 25)) {
                battleCruiserMenu.init();
            } else if (overCircle(gokuX, gokuY, 25)) {
                gokuMenu.init();
            } else if(overCircle(cellX, cellY, 25)) {
                cellMenu.init();
            }
            break;
        }
        case 1: {
            battleCruiserMenu.mousePressed();
            break;
        }
        case 2: {
            battleCruiserGame.mousePressed();
            break;
        }
        case 3: {
            gokuMenu.mousePressed();
            break;
        }
        case 6: {
            cellMenu.mousePressed();
        }
        case 7: {
            cellGame.mousePressed();
        }
    }
}

/**
* Main keyPressed function. Passes the event to objects based on the current state.
*/
void keyPressed() {
    switch (state) {
        case 2: {
            battleCruiserGame.keyPressed();
            break;
        }
        case 4: {
            gokuGame.keyPressed();
            break;
        }
        case 7: {
            cellGame.keyPressed();
            break;
        }
    }
}


/**
* Main keyReleased function. Passes the event to objects based on the current state.
*/
void keyReleased() {
    switch (state) {
        case 2: {
            battleCruiserGame.keyReleased();
            break;
        }
        case 4: {
            gokuGame.keyReleased();
            break;
        }
    }
}
