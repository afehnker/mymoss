class GokuBullet {
    PImage sprite;
    float currX, currY, targetX, targetY, startX, startY;
    boolean enabled, xPos, yPos;
    float counter, totalFrameCount;
    /*
    * Constructs a new GokuBullet object with the given parameters.
    */
    GokuBullet(PImage sprite, float currX, float currY, float targetX, float targetY) {
        this.sprite = sprite;
        this.currX = this.startX = currX;
        this.currY = this.startY = currY;
        println(String.format("%s %s", this.currX, this.startX));
        
        this.targetX = targetX;
        this.targetY = targetY;
        this.xPos = (targetX > currX);
        this.yPos = (targetY > currY);
        enabled = true;
        counter = 0;
        totalFrameCount = 15;
    }
    
    /*
    * Draws and updates this object.
    */
    void draw() {
        if (enabled) {
            image(sprite, currX, currY);
        

            currX = lerp(startX, targetX, counter / totalFrameCount);
            currY = lerp(startY, targetY, counter / totalFrameCount);
            ++counter;
            if (counter == 200) {
                enabled = false;
                return;
            }
            
            for (GokuEnemy enemy : gokuGame.enemies) {
                if (enemy.enabled && circleOverlap(currX, currY, sprite.width, enemy.currX, enemy.currY, gokuGame.enemySprite.width)) {
                    enemy.enabled = false;
                    enabled = false;
                    gokuGame.killCount++;
                    break;
                }
            }
        }
    }
}