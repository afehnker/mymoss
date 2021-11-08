/* 

 Automaterialen Jan Boersma Shop Window Program made by Jacelynn Moesker and Susanne Fuentes Bongenaar.
 Illustrations made by Jacelynn Moesker and Susanne Fuentes Bongenaar.
 
 In front of our shop window is your avatar named Carlos.
 You can control Carlos with the W, A, S,D keys.
 Also, if you wait a bit, you can see the sky change from night to day and to night again.
 The shop window displays 2 game buttons.
 Click on the left button to play a puzzle game, can you solve the it?
 Click on the right button to play the "Fill the glass" game, can you fill all the glasses in time?
 
*/

boolean game1 = false;
boolean game2 = false;
Puzzle puzzleGame;
BottleGame fillTheGlass;
GameHandler mainGameHandler;

void setup() {
  size(900, 800);
  mainGameHandler = new GameHandler();
}

void draw() {
  mainGameHandler.display();
}

void keyPressed() {
  mainGameHandler.moveAvatar();
  mainGameHandler.leaveBottleGame();
}

void mousePressed() {
  mainGameHandler.gameNavigation();
}

void mouseReleased() {
  mainGameHandler.puzzlePieceDeselect();
}

void mouseDragged() {
  mainGameHandler.movePuzzlePiece();
}
