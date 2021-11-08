class game 
{
  String[] words = {"pinocchio", "geppetto", "jiminy", "puppet", "cricket", "whale", "queue", "gnarly", "fluffiness", "peekaboo", "beekeeper", "funny", "lengths", "liar", "programming", "processing", "figaro", 
    "goldfish", "zucchini", "worldpeace", "incomprehensibilities", "ansgar", "jonathan", "demi", "greatgreatgreatgrandfather"}; //list of possible words that could be selected to be guessed randomly
  String word;
  char[] guessWord;
  int wrongAnswer;
  boolean anotherLetter;
  boolean youWin, youLose;

  confetti[] winConfetti = new confetti[2000]; //makes all the confetti

  game() 
  {
    word = words[int(random(words.length))]; //takes a random word out of the array of strings, this is the word the player is supposed to guess

    guessWord = new char[word.length()]; //this array of characters is what the player has guessed so far, it starts with just ___...
    for (int i=0; i<guessWord.length; i++) 
    {
      guessWord[i] = '_';
    }

    for (int i=0; i<winConfetti.length; i++)  
    {
      winConfetti[i] = new confetti();
    }
  }

  void PlayGame(int letter) 
  {
    boolean rightAnswer = false;
    if (!youLose && !youWin) //you cant play when the game has ended
    {
      pinocchio.PinoTalks(); //creates the textbox 
      allLetters[letter].LetterClicked(); //tells the letter it has been clicked
      for (int i=0; i<word.length(); i++)  
      {
        if (LetterInWord(letter)[i]) //if the guessed letter is in the word:...
        {
          guessWord[i] = word.charAt(i); //updates the guessed word with the correctly guessed letter
          rightAnswer = true;
        }
      }
      String guessedWord = new String(guessWord);
      if (guessedWord.equals(word) == true)         //you guessed the word
      {
        youWin = true;
      }
      if (!rightAnswer)  //the consequences of not guessing correctly
      {
        wrongAnswer++;
        pinocchio.GrowNose();
        if (wrongAnswer == 10) //you get at least 10 tries, more if you guessed right
        {
          youLose = true;  // game over, you tried to many times and the nose touches the flame
        }
      }
    }
  }

  void DrawWord() //Draws what te player has guessed so far (the thing at the top)
  {
    textSize(50);
    fill(255);
    String guessedWord = new String(guessWord);
    text(guessedWord, 400, 50);
  }

  void GameEnds() 
  {
    if (youWin) 
    {
      fill(0);
      noStroke();
      arc(80, 190, 50, 80, QUARTER_PI, PI - QUARTER_PI, CHORD); //pinocchio is happy he survived another day
      for (int i=0; i<winConfetti.length; i++) 
      {
        winConfetti[i].DrawConfetti(); //Array of confetti will be created in random colors at random places
      }
      noStroke();
      fill(255);
      textSize(100);
      text("YOU WON!!!", width/2 - 280, height/2);//displays text that you have won the game
    } else if (youLose)
    {
      textSize(100);
      fill(255);
      text("YOU LOST!!!", width/2 - 280, height/2);//displays text that you have lost the game
      pinocchio.BurnNose(); //pinocchio burns because the player lost
    }
  }

  boolean[] LetterInWord(int letter) //returns an array of booleans, true if the guessed letter is the same as the letter in the word; so for 't' in 'that' it will return true,false,false,true.
  {
    boolean[] result = new boolean[word.length()];
    for (int i=0; i<word.length(); i++) 
    {
      result[i] = false;
      if (alphabet.charAt(letter) == word.charAt(i)) //compares the guessed letter to a letter in the word
        result[i] = true;
    }    
    return result;
  }

  int WhichLetter(float initX) //determines which letter has been clicked by reversing how the letters are drawn based on their number, initX is the x-position of where the mouse clicked.
  {
    int letter = 0; 
    while ((initX+25)%45!=0) 
    {
      initX = floor(initX-1);
    }
    letter = floor(initX/45); 
    return letter;
  }
}
