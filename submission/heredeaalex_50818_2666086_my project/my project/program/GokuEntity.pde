class GokuEntity {
    float currX, currY;
    PImage sprite;
    int cooldown;

    /*
    * Creates a new GokuEntity based on the given sprite.
    */
    GokuEntity(PImage sprite) {
        this.sprite = sprite;
        currX = 150;
        currY = 150;
    }

    /*
    * Draws and updates this object.
    */
    void draw() {
        pushMatrix();
        translate(currX, currY);
        image(sprite, 0, 0);
        popMatrix();
        if (cooldown > 0)
            --cooldown;
        currX = lerp(currX, mouseX, 0.02);
        currY = lerp(currY, mouseY, 0.02);
    }

    /*
    * Shoots a bullet if enough times has passed since the last one.
    */
    void shoot() {
        if (cooldown == 0) {
            float targetX = float(mouseX);
            float targetY = float(mouseY);
            gokuGame.bullets.add(new GokuBullet(gokuGame.enemyBulletSprite, this.currX, this.currY, targetX, targetY));
            cooldown = 15;
        }
    }
}