class GokuEnemy {
    float currX, currY;
    int xMovement, yMovement, attackCounter, target;
    boolean enabled;
    PImage sprite;
    
    /*
    * Creates a new GokuEnemy based on the given sprite and coordinates
    */
    GokuEnemy(PImage sprite, float startX, float startY) {
        this.sprite = sprite;
        this.currX = startX;
        this.currY = startY;
        xMovement = yMovement = 1;
        attackCounter = 0;
        target = int(random(30, 60));
        enabled = true;
    }    
    
    /*
    * Draws and updates this object.
    */
    void draw() {
        if (enabled) {
            image(sprite, currX, currY);
            if (attackCounter != target)
                ++attackCounter;
            else{
                target = int(random(30, 60));
                attackCounter = 0;
                gokuGame.enemyBullets.add(new GokuEnemyBullet(gokuGame.enemyBulletSprite, currX, currY, gokuGame.goku.currX, gokuGame.goku.currY));
            }   
        }
    }
}