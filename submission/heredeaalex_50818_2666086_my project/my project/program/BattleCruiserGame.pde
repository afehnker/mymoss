class BattleCruiserGame {
    PImage gameBackgroundImage, battleCruiserSprite, zombieSprite, bulletSprite;
    BattleCruiserEntity battleCruiser;
    ArrayList<ZombieEntity> zombies;
    ArrayList<BulletEntity> bullets;
    int counter, targetVal, killCount;
    
    /*
    * Initializes all the data that this object requires.
    */
    void init() {
        state = 2;
        counter = 0;
        gameBackgroundImage = loadImage("assets/game_bg.jpeg");
        battleCruiserSprite = loadImage("assets/battlecruiser_sprite.png");
        zombieSprite = loadImage("assets/zombie.png");
        bulletSprite = loadImage("assets/blast.png");
        surface.setSize(gameBackgroundImage.width, gameBackgroundImage.height);
        battleCruiserSprite.resize(196, 196);
        zombieSprite.resize(196, 196);
        bulletSprite.resize(bulletSprite.width * 2, bulletSprite.height * 2);
        
        zombies = new ArrayList<ZombieEntity>();
        bullets = new ArrayList<BulletEntity>();
        battleCruiser = new BattleCruiserEntity(battleCruiserSprite);
        targetVal = int(random(30, 60));
    }
    
    /*
    * Draws the battle cruiser, zombies and bullets.
    */
    void draw() {
        background(gameBackgroundImage);
        counter++; 
        if (counter == targetVal) {
            zombies.add(new ZombieEntity(gameBackgroundImage, zombieSprite));
            counter = 0;
            targetVal = int(random(15, 69));
        }
        battleCruiser.update();
        battleCruiser.draw();
        for (ZombieEntity zombie : zombies) {
            if (zombie.enabled) {
                zombie.draw();
                zombie.update();
            }
        }
        for (BulletEntity bullet : bullets) {
            if (bullet.enabled) {
                bullet.draw();
                bullet.update();
            }
        }
        fill(209, 112, 2, 255);
        textSize(36);
        text(String.format("Your score is: %s", killCount), 11, 40);
    }
    
    void mousePressed() {
        
    }
    
    /*
    * Handles button presses.
    */
    void keyPressed() {
        switch(key) {
            case ESC : {
                    key = 0;
                    battleCruiserMenu.init();
                    break;
                }
                case'z':
                case'Z' : {
                    if (!battleCruiser.hasShot) {
                        battleCruiser.shoot();
                    }
                    break;
            }
        }
    }
    
    /*
    * Handles button releases.
    */
    void keyReleased() {
        switch(key) {
            case 'z':
                case'Z' : {
                    battleCruiser.hasShot = false;
                    break;
            }
        }
    }
}