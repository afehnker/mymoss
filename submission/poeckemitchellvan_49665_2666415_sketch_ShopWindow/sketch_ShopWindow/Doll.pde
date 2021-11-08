/*
this class is for displaying the doll and updating the right arm to move when the mouse cursor is on the doll square.
the void display() is for displaying the doll at an assigned possition given from the closet class.
the void update() has a timer and a boolean for making the right arm move and playing a sound every 240 frames.
It also makes the doll blink at random intervals.
the void dollPressed() makes the doll blink when the mouse is pressed.
*/
class Doll {
  //initialising variables and colors
  float dollXPos;
  float dollYPos;
  int wave;
  boolean reverseWave;
  boolean playedSound;
  int soundTimer;
  float blinkTimer;
  boolean blink;
  color dollColor;
  color eyeColor;
  
  Doll(float overX, float overY){
    //assigning values to variables
    dollXPos = overX;
    dollYPos = overY;
    wave = 0;
    reverseWave = true;
    blink = false;
    blinkTimer = 0;
    playedSound = false; //variable for not making the sound play multiple times.
    soundTimer = 240;
    dollColor = color(207, 178, 136);
    eyeColor = color(0,0,50);
  }
  
  void display(){
    noStroke();//revome stroke from doll
    fill(dollColor);//set color to dollColor
    
    //display doll legs
    ellipse(dollXPos + 7, dollYPos + 50, 10,35); 
    ellipse(dollXPos - 7, dollYPos + 50, 10,35); 
    ellipse(dollXPos + 7, dollYPos + 80, 10,30); 
    ellipse(dollXPos - 7, dollYPos + 80, 10,30); 
    
    //display doll right arm
    ellipse(dollXPos + 12, dollYPos, 20,20); 
    ellipse(dollXPos + 20 + 0.5 * wave, dollYPos - 10, 15,15); //move the arm when waving
    ellipse(dollXPos + 22 + wave, dollYPos - 20, 15,15); //move the arm when waving
    
    //display doll left arm
    ellipse(dollXPos - 12, dollYPos, 20,20);
    ellipse(dollXPos - 22, dollYPos + 10, 15,15); 
    ellipse(dollXPos - 22, dollYPos + 20, 15,15);
   
    ellipse(dollXPos, dollYPos + 10, 25, 70); //display doll body
    ellipse(dollXPos, dollYPos - 35, 25,30);  //display doll head
    
    //display doll eyes;
    fill(eyeColor);
    if(!blink){
      ellipse(dollXPos - 5, dollYPos - 38, 5,7);
      ellipse(dollXPos + 5, dollYPos - 38, 5,7);
    }
    if (blink){
      ellipse(dollXPos - 5, dollYPos - 38, 7,3);
      ellipse(dollXPos + 5, dollYPos - 38, 7,3);
    }
    stroke(1);
  }
   
  void update(){  
    //start waving when the mouse is inside the doll square and play a sound every 240 frames
    if (mouseX >= dollXPos - 100 && mouseX <= dollXPos + 100 && mouseY >= dollYPos - 100 && mouseY <= dollYPos + 100){
      //play sound
      if (!playedSound) {
        playedSound = true;
        wavingMan.play();
      }
      
      //a loop for waving
      if (reverseWave){
        wave -= 1;
      }
      if (!reverseWave){
        wave += 1;
      }
      if (wave >= 12){
       reverseWave = true; 
      }
      if (wave <= 0) {
       reverseWave = false; 
      }
      
      //a timer for playing the sound
      soundTimer = soundTimer - 1;
      if (soundTimer <= 0) {
        soundTimer = 240;
        playedSound = false;
      }
    }
    blinkTimer --; // decrease timer
    if (blinkTimer > 5){
      blink = false; // if timer is more than 5 eyes are open
    }
    if (blinkTimer <= 5 ){
       blink = true;//when blink timer hits 5 close eyes
    }
    if (blinkTimer <= 0 ){
       blinkTimer = random(30,210);// set timer to a random value
    }
  }
  
  void dollPressed(){
    if (mouseX >= dollXPos - 100 && mouseX <= dollXPos + 100 && mouseY >= dollYPos - 100 && mouseY <= dollYPos + 100){
      blinkTimer = 5; // make doll blink when pressed
    }
  }
}
