class BattleCruiserEntity {
    int x;
    PImage sprite;
    boolean canFire, hasShot;
    int counter;
    int bulletDelay;
    BattleCruiserEntity(PImage sprite) {
        x = 0;
        this.sprite = sprite;
        canFire = true;
        hasShot = false;
        counter = 0;
        bulletDelay = 20;
    }
    
    /**
    * Updates the battle cruiser entity, checking if collision with an enemy has happened.
    */
    void update() {
        if (!canFire && counter != bulletDelay) {
            ++counter;
        } else if (!canFire && counter == bulletDelay) {
            canFire = true;
            counter = 0;
        }
        for (ZombieEntity z : battleCruiserGame.zombies) {
            if (z.currX - this.x < 10) {
                reset();
            }
        }
    }

    /**
    * Adds a bullet to the list if enough time has passed since the last one.
    */   
    void shoot() {
        if (canFire) {
            battleCruiserGame.bullets.add(new BulletEntity(battleCruiserGame.bulletSprite, battleCruiserGame.battleCruiser));
            canFire = false;
            hasShot = true;
        }
    }
    
    /**
    * Draws the battle cruiser.
    */
    void draw() {
        //rotate(radians(180));
        image(sprite, x, 128);
    }
}