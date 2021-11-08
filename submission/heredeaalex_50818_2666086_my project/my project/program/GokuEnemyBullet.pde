class GokuEnemyBullet {
    PImage sprite;
    float currX, currY, targetX, targetY, startX, startY;
    boolean enabled, xPos, yPos;
    int counter;
    float totalFrameCount;

    /*
    * Creates a new GokuEnemyBullet based on the given sprite and coordinates.
    */
    GokuEnemyBullet(PImage sprite, float currX, float currY, float targetX, float targetY) {
        this.sprite = sprite;
        this.currX = this.startX = currX;
        this.currY = this.startY = currY;
        
        this.targetX = targetX;
        this.targetY = targetY;
        this.xPos = (targetX > currX);
        this.yPos = (targetY > currY);
        enabled = true;
        totalFrameCount = 60;
    }

    /*
    * Draws and updates this object.
    */
    void draw() {
        if (enabled) {
            ++counter;
            image(sprite, currX, currY);
            if (counter == 60)
                enabled = false;


            currX = lerp(startX, targetX, counter / totalFrameCount);
            currY = lerp(startY, targetY, counter / totalFrameCount);

            if (circleOverlap(currX, currY, sprite.width / 2, gokuGame.goku.currX, gokuGame.goku.currY, gokuGame.goku.sprite.width / 2)) {
                reset();
            }
        }
    }
}