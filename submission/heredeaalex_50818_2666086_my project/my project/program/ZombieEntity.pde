class ZombieEntity {
    int currX;
    boolean enabled;
    PImage sprite;

    /*
    * Creates a new zombie entity based on the given sprite and background image.
    */
    ZombieEntity(PImage bg, PImage sprite) {
        currX = bg.width + 25;
        enabled = true;
        this.sprite = sprite;
    }
    
    /*
    * Updates the entity, checking if it has gone offscreen.
    */
    void update() {
        if (currX > 0) {
            currX -= 3;
        } else {
            enabled = false;
       }
    }
        
   /*
   * Draws the entity.
   */
   void draw() {
        image(sprite, currX, 128);
    }
}