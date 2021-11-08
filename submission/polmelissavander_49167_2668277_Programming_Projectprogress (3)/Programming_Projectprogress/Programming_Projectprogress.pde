/*   
 Programming Project  
 Made by Melissa van der Pol and Madelon Gorter  
 */

Donuts [] donuts = new Donuts[10];   
Background background;    
Production production;    
Productionline productionline;  
Donutgameleft[] donutgameleft = new Donutgameleft[7];  
Donutgameright[] donutgameright = new Donutgameright[5];  
Homer homer;  
Start start; 
Bed bed;
Background2 background2;

PImage background1;
PImage drip;  
PImage maggie;  
PImage marge;  
PImage bart;  
PImage lisa;  
PImage bg;  
PImage homer1;  
PImage homer2;  
PImage startsc;  
PImage letter;  
PImage click;  
PImage royaldonuts;  
PImage window;
PImage shop1;

boolean startpage = true;
boolean end = false;
boolean newposition = false;
boolean falling = true;
boolean gameover = false;


void setup() {    
  size(1800, 950);     

  production = new Production(0, 400);    
  productionline = new Productionline(0, 400);  
  homer = new Homer(200, 650, 300, 300);  
  start = new Start(0, 0, 1800, 950);  
  bed = new Bed(500, 600, 50, 50);
  background2 = new Background2(200, 100, 200, 200);
  background = new Background(700, 250, 400, 250);


  for (int i = 0; i < donuts.length; i++) {    
    donuts[i] = new Donuts(random(0, 900), 400, 50, 50);
  }  

  for (int i = 0; i < donutgameleft.length; i++) {    
    donutgameleft[i] = new Donutgameleft(1020, 420);
  }  

  for (int i = 0; i < donutgameright.length; i++) {    
    donutgameright[i] = new Donutgameright(1020, 420);
  }  


  drip = loadImage("Drip1.png");  
  bg = loadImage("background.jpg");  
  background.images();
  homer.images();  
  start.images();
}    

void draw() {    
  background(255);  
  if (!gameover){
  if (!startpage && !end) {
    image(bg, 0, 0, 1800, 600);     
    fill(0);    
    rect(0, 500, 1800, 100);    
    image(drip, 0, 0);       
    image(drip, 600, 0);       
    image(drip, 1200, 0);    


    production.display();    
    productionline.display();  
    productionline.move();  
    background.display();

    for (int i = 0; i < donuts.length; i++) {    
      donuts[i].move();    
      donuts[i].display();
    }    

    for (int i = 0; i < donutgameright.length; i++) {      
      donutgameright[i].display();    
      donutgameright[i].move();
    }    
    for (int i = 0; i < donutgameleft.length; i++) {      
      donutgameleft[i].display();    
      donutgameleft[i].move();
    }    
    if (homer.homerY >= 700 && homer.homerY <=910) {
      homer.homerY = homer.homerY+5;
      homer.bellyUpY = homer.bellyUpY +5;
    }
    if (homer.homerY >=910 ) {
      end = true;
      newposition = true;
    }
  }
  if (end) {
    if (newposition) {
      homer.homerY = homer.homerY - 1200;
      homer.bellyUpY = homer.bellyUpY - 1200;
      falling = true;
      newposition = false;
    }
    if (falling) {
      homer.homerY = homer.homerY+1;
      homer.bellyUpY = homer.bellyUpY +1;
    }
    if (homer.homerX >= 470 && homer.homerX <= 530 &&  homer.homerY == 280 ) {
      falling = false;
    }
    if (homer.homerY >= 450){
      delay(1000);
      gameover = true;
    }
    background2.display();
    bed.display();
    
    // to see where homer needs to lay down
    fill(255, 0, 0, 0);  //color red semi-transparent
    stroke(128, 0, 255, 128); //color purple semi-transparent
    rect(470, 280, 110, 50);
  }

  homer.display();
  }
  if (startpage) {  
    start.display();
  }
}     

void mousePressed() {  
  if (mouseX > 1100 && mouseX < 1700) {                                                                                 
    if (mouseY > 200 && mouseY < 255) {                                            
      startpage = false;
    }
  }
} 

void keyPressed() {
  if (key == 'a' || key == 'A') {
    if (falling) {
      homer.homerX = homer.homerX -5;
    } else {
      homer.homerX -= 1;;
      bed.bedX -= 1;
    }
  } else if (key == 'd' || key == 'D') {  
    if (falling) {
      homer.homerX = homer.homerX +5;
    } else {
      homer.homerX += 1;
      bed.bedX += 1;
    }
  }  
  if (key == 'w' || key == 'W') {  
    end = true;
    newposition = true;
  }
}
