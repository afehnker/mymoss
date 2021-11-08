class BulletEntity {
    int currX;
    boolean enabled;
    PImage sprite;
    BulletEntity(PImage sprite, BattleCruiserEntity battleCruiser) {
        currX = battleCruiser.x + 218;
        this.sprite = sprite;
        enabled = true;
    }
    
    /*
    * Updates the bullet entity.
    */
    void update() {
        if (enabled) {
            currX += 7;
            if (currX > battleCruiserGame.gameBackgroundImage.width - sprite.width) {
                enabled = false;
                return;
            }
            for (ZombieEntity z : battleCruiserGame.zombies) {
                if (z.enabled && z.currX - currX < 10) {
                    z.enabled = false;
                    this.enabled = false;
                    battleCruiserGame.killCount++;
                    break;
                }
            }
        }
    }
    
    /*
    * Draws the bullet entity to the screen.
    */
    void draw() {
        image(sprite, currX, 196);
    }
}