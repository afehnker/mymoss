//Programme made by Rita Youssif s2615444 for the final project for the subject programming. 
//Purpose: This programme shows a shop window that the user can interact with by pressing certain keys and clicking on specific items. 

Book book; 
Cube cube;
Frame frame;
Pictures pictures; 
WalkerR walkerR; 
WalkerL walkerL; 
Oval[] oval = new Oval[50];     // Creates an array of 50 ovals.

void setup() {                                              // The setup launches everything. It gets run once in total.
  size(1300, 900);
  book = new Book(); 
  cube = new Cube(); 
  frame = new Frame();
  walkerR = new WalkerR(); 
  walkerL = new WalkerL(); 
  pictures = new Pictures();
  for (int i=0; i<oval.length; i++) {                       // The for loop takes care of spawning the 50 ovals and their placement.
    oval[i] = new Oval(random(0, 1300), random(0, 900));
  }
}

void draw() {                                  // In the draw every one of these gets shown on the screen. 
  background(127);
  for (int i = 0; i < oval.length; i++) {     // This for loop makes the ovals visible and allows them to move by calling both methods from the class. 
    oval[i].display(); 
    oval[i].move();
  }
  frame.display(); 
  book.display(); 
  pictures.display(); 
  cube.display();
  walkerL.display(); 
  walkerL.move();                             // It keeps refreshing which allows movement to happen hence why the move methods are called here.
  walkerR.display();
  walkerR.move();
}

void mousePressed() {                          // Whenever a left mouse button is made on a specific area the methods from these classes activate.
  cube.Flowergrowth();
  book.TitleChange();
  walkerL.activateWalker();
}

void keyPressed() {                          //Whenever a specific key is pressed the methods in this method activate. 
  if (keyCode == ' ') {
    frame.ChangeColor(); 
  }
  pictures.PictureChange();
}
