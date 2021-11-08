//A lamp with a cord!

class CordedLamp {
    float x;
    float y;

    Lamp lamp;
    Cord cord;
    
    color lightC;
    int cableLength;

    //creates a lamp and a cord at initX, initY
    CordedLamp(float initX, float initY, color initColor, int initLength, boolean startLit) {
        x = initX;
        y = initY;
        cableLength = initLength;
        lightC = initColor;

        cord = new Cord(700, 100, cableLength);
        lamp = new Lamp(cord.totalTranslation.x, cord.totalTranslation.y, 0, lightC, startLit);
    }

    //displays the cord and lamp and updates each
    void display() {
        cord.update();
        lamp.update(x+cord.totalTranslation.x, y+cord.totalTranslation.y, cord.units[cord.numUnits-1].rotation);
        cord.display();
        lamp.display();
        fill(255, 0, 0);
    }
}