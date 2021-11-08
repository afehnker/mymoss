//The clock that's in the middle of the screen

class Clock {

    float x;
    float y;
    PVector initTime;
    PShape hourHand;
    PShape minuteHand;
    
    //initialize assets and set the clock location to (initX, initY)
    Clock(float initX, float initY) {
        x = initX;
        y = initY;

        initTime = new PVector(hour(), minute());
        
        hourHand = loadShape("hourhand.svg");
        hourHand.disableStyle();
        hourHand.scale(0.1);
        hourHand.setFill(color(255, 255, 255));

        minuteHand = loadShape("minutehand.svg");
        minuteHand.disableStyle();
        minuteHand.scale(0.1);
        minuteHand.setFill(color(255, 255, 255));
    }

    //draw the clock
    void display() {
        pushMatrix();
        translate(x, y);
        
        //face of the clock
        noStroke();
        fill(100);
        circle(0, 0, 200);
        fill(255);
        circle(0, 0, 170);
        
        rectMode(CENTER);

        //ticks on the clock
        fill(0);
        pushMatrix();
        for(int i = 0; i <= 12; i++) {
            rotate(PI/6);
            if(i % 3 == 2) {
            rect(0, 65, 5, 23);
            }
            else {
            rect(0, 68, 5, 17);
            }
        }
        for(int i = 0; i <= 60; i++) {
            rotate(PI/30);
            rect(0, 73, 3, 7);
        }
        popMatrix();
        circle(0, 0, 10);
        
        //hands of the clock, rotate based on time and time since the program's started
        pushMatrix();
        rotate((initTime.x+millis()/1000/60/60)*PI/6);
        rotate((initTime.y)*PI/360);
        shape(hourHand, -hourHand.width*0.1*.5, -50);
        popMatrix();
        
        pushMatrix();
        rotate((initTime.y+millis()/1000/60)*PI/30);
        shape(minuteHand, -minuteHand.width*0.1*.5, -77);
        popMatrix();

        rectMode(CORNER);
        popMatrix();
    }
}