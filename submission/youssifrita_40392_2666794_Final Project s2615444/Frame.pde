//Class made by Rita Youssif s2615444 for the final project for the subject programming. 
//Purpose: Shows frames that hold the pictures shown. They change color when the spacebar is pressed. 
//Disclaimer: all images used are from Google images and used for educational purposes. 

class Frame {                                            
  color FrameColor1 = color(19, 90, 100); 
  color FrameColor2 = color(100, 200, 90);
  color FrameColor3 = color(255, 0, 19);                                 //These colors are the default colors of the frames.
  color FrameColor4 = color(200, 100, 90);
  color FrameColor5 = color(0, 255, 200); 

  void display() {
    //Photoframe 1
    fill(FrameColor1);
    rect(width/5 *1.1, height/6 *1.1, 120, 140); 

    //Photoframe 2
    fill(FrameColor2);
    rect(width/4, height/3 *1.1, 280, 150);

    //Photoframe 3
    fill(FrameColor3);
    rect(width/3 *1.48, height/6, 200, 338); 

    //Photoframe 4
    fill(FrameColor4); 
    rect(width/2 *1.31, height/5 *1.12, 215, 330);

    //Photoframe 5
    fill(FrameColor5);
    rect(width/4 *1.32, height/8, 200, 200);
  }

  void ChangeColor() {                                                             // This method allows the framecolors to change to a random RGB value between 0 and 255. 
    FrameColor1 = color(random(0, 255), random(0, 255), random(0, 255));
    fill(FrameColor1);
    FrameColor2 = color(random(0, 255), random(0, 255), random(0, 255));
    fill(FrameColor2);
    FrameColor3 = color(random(0, 255), random(0, 255), random(0, 255));
    fill(FrameColor3);
    FrameColor4 = color(random(0, 255), random(0, 255), random(0, 255));
    fill(FrameColor4);
    FrameColor5 = color(random(0, 255), random(0, 255), random(0, 255));
    fill(FrameColor5);
  }
} 
