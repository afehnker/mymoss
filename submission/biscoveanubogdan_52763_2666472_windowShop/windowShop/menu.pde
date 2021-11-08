// class for the menu and the items that are listed on it
class Menu {
  String[] menuItems = new String[5];
  PImage meniu;

  Menu() {
    //constructing the array for the names of the items on the menu
    menuItems[0]= "Olive Oil";
    menuItems[1]= "Pesto Sauce";
    menuItems[2]= "Tomato Sauce";
    menuItems[3]= "Truffle Mayonnaise";
    menuItems[4]= "Bruschetta Sauce";
    meniu = loadImage("meniu.png");
  }  

  void display() {
    int newX;
    imageMode(CENTER);
    //textAlign(CENTER, CENTER);
    image(meniu, width/2+50, height/2);
    PFont ourFont;      //the variable for the font for various text
    ourFont = createFont("Monospaced", 16);
    textFont(ourFont);
    //loop to create the placement of the names on the menu
    for(int i=0; i<5 ; i++){
      newX = height/4+ 120 + i*40;
      text(menuItems[i], width/2 + 50, newX);
    }
  }
}
