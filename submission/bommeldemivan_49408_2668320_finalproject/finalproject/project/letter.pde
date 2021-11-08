class letters 
{
  float x, y;
  char letter;
  boolean letterHasBeenChosen; //boolean to check if the player has selected the letter, once true never becomes false again because each letter should only be selected once (except if the player is a bit of an idiot or just really wants to murder pinocchio)


  letters(float letterX, float letterY, char initLetter) 
  {
    x = letterX;
    y = letterY;
    letter = initLetter;
  }

  void DrawLetter() 
  {
    if (letterHasBeenChosen) //if you clicked on a letter it will become red
    {
      fill(255, 0, 0);
      stroke(255, 0, 0);
      strokeWeight(2);
      textSize(50);
      text(letter, x, y);
      noFill();
      rect(x, y-25, 40, 25);
    } else  //the letter is displayed in the button
    {
      fill(255);
      strokeWeight(2);
      textSize(50);
      stroke(255);
      text(letter, x, y);
      noFill();
      stroke(255);
      rect(x, y-25, 40, 25);
    }
  }

  void LetterClicked()
  {
    letterHasBeenChosen = true;
  }
}
