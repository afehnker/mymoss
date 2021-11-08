/*=================
 The window code is written and designed by An and Hielke.
 
 ==================
 This is the window class where it will show a different picture when you hit the window
 by updating the hitCouter
 
 The window is gradually breaking if you smash into it, beware of the alarm
 =================*/

class Window {

  PImage window1, window2, window3, window4, window5, window6, window7, window8, window9, window10, window11, window12;
  float posX, posY;
  int hitCounter=0;
  int windowWidth = 658;
  int windowHeight = 353;

  Window(float posX, float posY) {
    window1 = loadImage("window.png");
    window2 = loadImage("Asset 1.png");
    window3 = loadImage("Asset 2.png");
    window4 = loadImage("Asset 3.png");
    window5 = loadImage("Asset 4.png");
    window6 = loadImage("Asset 5.png");
    window7 = loadImage("Asset 6.png");
    window8 = loadImage("Asset 8.png");
    window9 = loadImage("Asset 9.png");
    window10 = loadImage("Asset 10.png");
    window11 = loadImage("Asset 11.png");
    window12 = loadImage("Asset 12.png");
    this.posX = posX + 96;
    this.posY = posY + 210;
  }

  void display() {
    switch(hitCounter) {
    case 0:
      image(window1, posX, posY);
      break;
    case 1:
      image(window2, posX, posY);
      break;
    case 2:
      image(window3, posX, posY);
      break;
    case 3:
      image(window4, posX, posY);
      break;
    case 4:
      image(window5, posX, posY);
      break;
    case 5:
      image(window6, posX, posY);
      break;
    case 6:
      image(window7, posX, posY);
      break;
    case 7:
      image(window8, posX, posY);
      break;
    case 8:
      image(window9, posX, posY);
      break;
    case 9:
      image(window10, posX, posY);
      break;
    case 10:
      image(window11, posX, posY);
      break;
    case 11:
      image(window12, posX, posY);
      break;
    case 12:
      isBroken = true;
    default:
      break;
    }
  }


  void update(float pointerX, float pointerY) {
    if (pointerX >= posX && pointerX <= posX+windowWidth &&
      pointerY >= posY && pointerY <= posY+windowHeight && mousePressed == true) {
      hitCounter ++;
    }
  }
}
