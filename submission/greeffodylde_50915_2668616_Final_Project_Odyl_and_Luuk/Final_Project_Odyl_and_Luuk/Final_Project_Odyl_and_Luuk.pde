/*
Final project for P4WCI
 Designed and coded by Odyl de Greeff and Luuk Wessels
 Click on the snack you would like to eat, and type the word 'snack' to actually eat it!
 */

int windowAmount = 5;
int snackAmount = 5;

Window[] windowscolumn1;
Window[] windowscolumn2;
Window[] windowscolumn3;
Snack [] kroket;
Snack [] frikandel;
Snack [] kaassouffle;
ChangeMachine changeMachine;
KroketEating kroketEating;
FrikandelEating frikandelEating;
KaassouffleEating kaassouffleEating;

void setup() {
  fullScreen();
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  changeMachine = new ChangeMachine();

  kroketEating = new KroketEating();
  frikandelEating = new FrikandelEating();
  kaassouffleEating = new KaassouffleEating();

  kroket = new Snack[snackAmount]; //Make kroket array
  frikandel= new Snack[snackAmount]; //Make frikandel array
  kaassouffle= new Snack[snackAmount]; //Make kaassouffle array

  windowscolumn1 = new Window[windowAmount]; //Making the window arrays
  windowscolumn2 = new Window[windowAmount];
  windowscolumn3 = new Window[windowAmount];

  for (int i = 0; i < snackAmount; i++) {
    kroket[i] = new Snack((width / 10 + width / 100), (i * (height / 6) + height / 5), 0); //Left column of snacks(kroket)
    frikandel[i] = new Snack((3.5 * width / 10 + width / 100), (i * (height / 6) + height / 5), 1); //Middle column of snacks(frikandel)
    kaassouffle[i] = new Snack((6 * width / 10 + width / 100), (i * (height / 6) + height / 5), 2); //Right column of snacks(kaassouffle)
  }

  for (int i = 0; i < windowAmount; i++) {
    windowscolumn1[i] = new Window((width / 10 + width / 100), (i * (height / 6) + height / 5)); //Left column of windows
    windowscolumn2[i] = new Window((3.5 * width / 10 + width / 100), (i * (height / 6) + height / 5)); //Middle column of windows
    windowscolumn3[i] = new Window((6 * width / 10 + width / 100), (i * (height / 6) + height / 5)); //Right column of windows
  }
}

void draw() {
  background(168, 169, 173); //Gray/silver background

  for (int i = 0; i < snackAmount; i++) {
    kroket[i].display(); //Drawing of the kroketten
    frikandel[i].display(); //Drawing of the frikandellen
    kaassouffle[i].display(); //Drawing of the kaassouffles
  }

  for (int i = 0; i < windowAmount; i++) {
    windowscolumn1[i].display(); //Drawing of the left windows
    windowscolumn2[i].display(); //Drawing of the middle windows
    windowscolumn3[i].display(); //Drawing of the right windows
  }

  changeMachine.display(); //Drawing of the Change machine
  kroketEating.display(); //Displaying and updating all the snacks when being eaten
  kroketEating.update();
  frikandelEating.display();
  frikandelEating.update();
  kaassouffleEating.display();
  kaassouffleEating.update();
}

void mousePressed() {
  kroketEating.isOver(mouseX, mouseY); //Checks if mouse is over frikandel column
  frikandelEating.isOver(mouseX, mouseY); //Checks if mouse is over frikandel column
  kaassouffleEating.isOver(mouseX, mouseY); //Checks if mouse is over frikandel column

  kroketEating.bite0 = true; //Starts the eating sequence when the mouse is pressed over the kroket colummn
  frikandelEating.bite0 = true; //Starts the eating sequence when the mouse is pressed over the frikandel colummn
  kaassouffleEating.bite0 = true; //Starts the eating sequence when the mouse is pressed over the kaassouffle colummn
}

void keyPressed() {
  kroketEating.eatingKroket(keyCode); //Makes it possible to eat the kroket by typing the word "snack"
  frikandelEating.eatingFrikandel(keyCode); //Makes it possible to eat the frikandel by typing the word "snack"
  kaassouffleEating.eatingKaassouffle(keyCode); //Makes it possible to eat the kaassouffle by typing the word "snack"
}
