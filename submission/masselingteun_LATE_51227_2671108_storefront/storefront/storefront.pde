sidepanels sidePanels;
bats[] Bats = new bats[10];

PImage storeImg;

//setup a background with the storefront. then add sidepanels. I want the bats to fly in the sidepanels when one of the panels are clicked.
void setup(){
 size(1200,800);
 storeImg = loadImage("storefront.jpg");
 image(storeImg, 0, 0, width, height);
 sidePanels = new sidepanels (115,240);
 sidePanels.display();
 for(int i = 0; i<=9; i++){
   Bats[i] = new bats(random(130,240), random(260,700));
 }
}
//try to display the bats. however, this doesnt work and i dont know why.
void draw(){
  
  for (int i = 0; i<=9; i++){
   Bats[i].batDisplay(); 
  }
}
