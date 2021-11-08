/* This is final project by Arthur van der Torre last edited on the 25/Oct/21 for the course "Introduction to programming".
 The game is played only with the space bar, the mouseclick and mouse movement.
 Title: Daydreams on sale
 Drawings manufactured by me
 */
String StoryProgress="intro";
PFont textFont;
Dialogue mainText;
BackgroundLoader Backgrounds;
StoryProgress ThisStory;

void setup() {
  size(1400, 900); 
  frameRate(60);
  mainText = new Dialogue();
  textFont = loadFont("Constantia-Bold-55.vlw");
  textFont(textFont);

  Backgrounds = new BackgroundLoader();
  ThisStory = new StoryProgress();
  background(0);
}

void draw() {
  Backgrounds.display();
  
  if (mainText.isActive()) {    
    mainText.display();
    ThisStory.resetInteractiveText();
  } else {
    mainText.clicked();
  }
  
  mainText.checkPrompt();
  mainText.resetTextAnimation();
  ThisStory.update(); //state machine of this game
  
}

void keyPressed() {
  //When space is pressed, the next prompt is revealed (under appropriate conditions)
  if (mainText.isActive()) { 
    mainText.next(key);
  }
}

void mouseClicked() {
  //When the mouse is clicked inside a designated "clickArea", a prompt will be revealed
  if (!mainText.isActive()) {
    ThisStory.explore(mouseX, mouseY);
  }
}
