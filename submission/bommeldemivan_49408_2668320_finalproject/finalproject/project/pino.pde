class pino 
{
  int x, y;
  float noseX, noseTarget;
  color bodyColor, darkGreen, green, red, darkRed;
  int pinoSpeechDuration, pinoRandomSpeech;
  int flameHeight, flameSize = 20;
  fire deathFlame;


  pino(int pinoX, int pinoY) 
  {
    deathFlame = new fire(-100, 200, 20, 0.005, 0.0025);
    x = pinoX; 
    y = pinoY; //position of pinocchio
    noseX = 20; //decides how long the nose will be
    noseTarget = 20;

    //basic colors
    bodyColor = color(237, 202, 172);
    darkGreen = color(5, 100, 0);
    green = color(22, 121, 14);
    darkRed = color(182, 0, 0);
    red = color(225, 0, 10);
  }


  void DrawPino() 
  {
    pushMatrix();
    translate(x, y);

    //left arm
    fill(bodyColor);
    noStroke();
    pushMatrix();
    translate(20, 110);
    rotate(radians(12));
    translate(-20, -80);
    rect(20, 70, 45, 15); //under arm
    popMatrix();

    fill(red);
    triangle(65, 105, 62, 132, 110, 123);//lefthand

    //body
    fill(darkRed);
    arc(2, 155, 100, 180, PI, PI + 4*QUARTER_PI, CHORD); //shirt

    //legs
    noStroke();
    fill(bodyColor);
    rect(14, 220, 22, 40); //right
    rect(-34, 220, 22, 40); //left

    //shoes
    fill(0);
    ellipse(32, 265, 40, 20); //right
    ellipse(-25, 265, 40, 20); //left

    //pants
    strokeWeight(1);
    fill(green);
    stroke(darkGreen);
    rect(10, 160, 35, 60); //right
    rect(-40, 160, 35, 60); //left
    arc(2, 60, 145, 260, QUARTER_PI, PI - QUARTER_PI, CHORD); // top

    //head
    noStroke();
    fill(bodyColor);
    ellipse(0, 0, 80, 105);

    //neck
    rect(-10, 45, 20, 25);

    //right arm
    rect(-50, 90, 15, 35); //upperarm

    pushMatrix();
    translate(20, 110);
    rotate(radians(12));
    translate(-20, -80);
    rect(-45, 90, 45, 15); //under arm
    popMatrix();

    fill(red);
    triangle(-5, 110, -5, 135, 45, 130); //righthand

    //face
    //eyes
    fill(255);
    ellipse(-15, -10, 15, 25); //left
    ellipse(25, -10, 15, 25); //right

    //pupils 
    fill(0);
    circle(-15, -5, 10); //left
    circle(25, -5, 10); //right

    //cheeks
    fill(255, 102, 102);
    circle(-15, 15, 15); //left
    circle(25, 15, 15); //right

    //nose
    strokeWeight(10);
    stroke(225, 195, 165);
    line(5, 5, noseX, 5);

    //mouth
    noStroke();
    fill(0);
    arc(5, 20, 20, 35, QUARTER_PI, PI - QUARTER_PI, CHORD);

    //hair
    fill(0);
    ellipse(10, -30, 80, 30);

    ellipse(-37, 0, 25, 85);

    //hat
    fill(red); 
    arc(0, -30, 80, 130, PI, PI + 4*QUARTER_PI, CHORD); 

    fill(darkRed);
    ellipse(0, -87, 33, 15); //top of hat

    rect(-45, -40, 95, 10); //stroke of hat

    //feather
    fill(green);
    quad(-15, -30, -30, - 60, -52, -65, -45, -45); 
    stroke(darkGreen);
    strokeWeight(1);  
    line(-52, -65, -15, -30);
    popMatrix();

    UpdatePino();
  }

  void UpdatePino()
  {
    if (noseX < noseTarget) //lets the nose grow until it hits the noseTarget (the place of the flame)
    { 
      pushMatrix();
      translate(x, y);
      noseX += 2;
      noStroke();
      fill(0);
      circle(5, 35, 20);  //makes the mouth looks surprised while his nose grows.
      popMatrix();
    } else if (noseX > noseTarget+1) //+1 because the nose can become larger then noseTarget because of the noseX+= 2 it might miss the target by 1.
    {
      noseX = noseX - 5;
      deathFlame.UpdateFlame(noseX+80, 210, 20);
      deathFlame.DrawFlame();
      pushMatrix();
      translate(x, y);
      noStroke();
      fill(0);
      circle(5, 35, 20);  //makes the mouth looks surprised while his nose grows.
      popMatrix();
    }

    if (noseX <= 0) 
    {
      if (flameSize < 200) //lets the flame grow to a certain size
      {
        flameSize++;
      }
      if (flameHeight < 275) //moves the flame to cover pinocchio
      {
        flameHeight++;
      }
      deathFlame.UpdateFlame(80, 210+flameHeight, flameSize);
      deathFlame.DrawFlame();
      pushMatrix();
      translate(x, y);
      noStroke();
      fill(0, 100); //makes the mouth and eyes that are visible through the flames
      circle(5, 35, 20);  //makes the mouth looks surprised while his nose grows.
      //eyes
      fill(255, 100);
      ellipse(-15, -10, 15, 25); //left
      ellipse(25, -10, 15, 25); //right

      //pupils 
      fill(0, 100);
      circle(-15, -5, 10); //left
      circle(25, -5, 10); //right
      popMatrix();
    }
  }

  void GrowNose() 
  {
    noseTarget+=98;  //the border where the nose stops growing
  }

  void BurnNose() 
  {
    if (noseX >= noseTarget) //wait until nose is fully grown to the 
    {
      noseTarget = 0;
    }
  }


  void PinoTalks()   //displays a textblock when a key is pressed, always says your doing a good job. If the letter is correct he tells the truth otherwise he lies and his nose will grow.
  {
    pinoSpeechDuration = 75; //length of display textblock
    pinoRandomSpeech = int(random(4));  //says one of the four words/lines
  }

  boolean PinoIsSilent() //pinocchio stops talking the textblock will dissapear
  {
    if (pinoSpeechDuration == 0) 
    {
      return true;
    } else 
    {
      pinoSpeechDuration--;
      return false;
    }
  }

  void PinoSpeaks() 
  {
    String[] niceWordsFromPino = { "Correct!", "Well done!", "Good job!", "Doing great!" };  //random lines pinocchio can say
    if (!PinoIsSilent()) 
    {
      //text block
      noStroke();
      fill(255); 
      triangle(x + 60, y -20, X + 170, y - 75, x + 120, y - 35);
      ellipse( x + 180, y - 70, 195, 95);

      fill(0);
      textSize(25);
      text(niceWordsFromPino[pinoRandomSpeech], x + 115, y - 60);  // Prints one of the four words in the text block
    }
  }
}
