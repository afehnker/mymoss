/*=================
 The alarm code is written and designed by An.
 
 ==================
 This is an Alarm generator.
 If you hit into the window, it will trigger the void raise, if the noise is too high, you will lose the game,
 If you don't do anything, the noise will reduce.
 If you break the window, you also break the alarm system so they will not bother you anymore.
 
 =================*/

class Alarm {

  float alarmY = height - height/10 ;
  float alarmX = width/15;
  int noise = 0;
  boolean active = false;

  void display() {
    rectMode(CORNER);
    textSize(30);

    fill(255);
    text("Alarm", alarmX - 50, alarmY + 30 );
    fill(255);
    rect(alarmX, alarmY, 400, 50);
    fill(0);
    rect(alarmX, alarmY, noise, 50);
  }

  void update() {
    if (noise > 0) {
      active = true;
    } else {
      active = false;
    }
    if (active) {
      noise -= 0.5;
    }
    if (noise >= 400) {
      gameState = "GAMEOVER";
    }
  }

  void raise() {
    noise += int(random(50, 100));
  }
}
