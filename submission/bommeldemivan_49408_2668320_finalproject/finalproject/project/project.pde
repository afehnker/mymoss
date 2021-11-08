/*Hangman game: starring Pinocchio. You have to guess the word by choosing letters, if you picked the wrong letter Pinocchio lies and his nose grows. 
 If his nose touches the fire he burns and you lose.*/
houseBackground gameBackground; //iniates all the objects
pino pinocchio;
game hangman;
letters[] allLetters = new letters[26];
String alphabet = "abcdefghijklmnopqrstuvwxyz";  //the alphabet is used to draw all the right letters

void setup() 
{
  size(1200, 600);

  gameBackground = new houseBackground(); //creates the objects
  pinocchio = new pino(75, 190);
  hangman = new game();
  for (int i=0; i<allLetters.length; i++) 
  {
    allLetters[i] = new letters(25+45*i, 580, alphabet.charAt(i)); //creates all the letters with the right letter at the right spot by going through the entire alphabet string with different x-positions
  }
}

void draw() 
{
  gameBackground.DrawBackground(); //draws the objects
  pinocchio.DrawPino();
  pinocchio.PinoSpeaks();
  hangman.DrawWord();
  for (int i=0; i<allLetters.length; i++) 
  {
    allLetters[i].DrawLetter();
  }
  hangman.GameEnds();
}

void mousePressed() 
{
  if (mouseY>555 && mouseY<580 && mouseX>25 && mouseX<1190) //if a letter is clicked it plays a game
  {
    hangman.PlayGame(hangman.WhichLetter(mouseX));
  }
}
