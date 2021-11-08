class RainbowMenu {
    int red, green, blue;
    boolean decrement;

    /*
    * Initializes all the data used by this object.
    */
    void init() {
        state = 5;
        red = 0;
        surface.setSize(1280, 720);
        colorMode(HSB);
        decrement = false;
    }

    /*
    * Draws a rainbow background.
    */
    void draw() {
        if (red >= 255) {
            decrement = true;
        } else if (red <= 0) {
            decrement = false;
        }
        red = red + (decrement ? -1 : 1);
        background(red, 255, 255);
    }
}