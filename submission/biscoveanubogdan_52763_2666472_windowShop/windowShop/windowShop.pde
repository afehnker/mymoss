//Project done by Bogdan Biscoveanu and Alexia Malita
//It is about a window of a shop specialized in spices, most of which were italian
//Some of its functions are: pressing on the menu to open it ,
PImage olive, pesto, tomato, mayo, brusc;
Menu menuPicture;
void setup()
{
  size(1000, 800);
  background(139, 112, 85);
  // making sure everything is centered for easier usage
  rectMode(CENTER);
  ellipseMode(CENTER);
  textAlign(CENTER, CENTER);
  //images for the items
  olive = loadImage("olive.png");
  pesto = loadImage("pesto.png");
  tomato = loadImage("tomato.png");
  mayo = loadImage("mayo.png");
  brusc = loadImage("brusc.png");
  imageMode(CENTER);
}
void draw()
{
  fill(99, 103, 104);                        //color for the table top
  rect(width/2, height/2+250, width, 40);
  fill(169, 146, 115);                        //color for the table front
  rect(width/2, height/2+335, width, 130);
  fill(233, 220, 202);     //color for the boxes on top of the table for the products
  rect(width/4-60, height/2+215, 100, 70);
  rect(width/4+165, height/2+215, 100, 70);
  rect(width/4+50, height/2+200, 150, 100);
  rect(width/2+280, height/2+200, 150, 100);
  fill(0);                                  //color for banner supporters
  rect(width/4+25, height/8, 20, 200);
  rect(width/2+225, height/8, 20, 200);
  fill(185, 198, 201);                        //color for top banner
  rect(width/2, height/4, 600, 100);
  //setting up everything for the text
  PFont myFont;                            //the variable for the font for various text
  myFont = createFont("DialogInput", 50);
  fill(0);
  textFont(myFont);
  text("Italian Condiments", width/2, height/4);      //the text on the banner
  //positioning the word menu
  text("Menu", width/2+80, height/2+200);
  //positioning pictures of items
  image(olive, width/2-315, height/2+120);
  image(tomato, width/2-200, height/2+90);
  image(brusc, width/2-100, height/2+135);
  image(mayo, width/2+280, height/2+100);
  image(pesto, width/2+420, height/2+177);
}

void mousePressed() { // when pressing on the word menu the menu pops up
  menuPicture = new Menu();
  if (((mouseX>=555) && (mouseX<=605) && (mouseY>=575) && (mouseY<=625)) == true) { //making sure of the position
    menuPicture.display();              //displays the menu when pressing the correct space
  }
}
