
//store front
StoreFront[] storefront= new StoreFront[1];
//trolly
trolly[] cart= new trolly[1];
//Costumers
Costumer[] lad= new Costumer[1];
Koya koya1;
Chimmy [] chimmy = new Chimmy[1];

void setup() {
  size(1920, 1080); 
  background(#E8A2E3);
  //storefront
  

  
  for (int i=0; i<storefront.length; i++) {
    storefront[i]= new StoreFront();
  }for (int i=0; i<cart.length; i++){
  cart[i] = new trolly();
  }for (int i=0; i<lad.length; i++){
    lad[i] = new Costumer();
  }for (int i=0; i<chimmy.length; i++){
    chimmy[i] = new Chimmy(width/2,height/2);
  }
   koya1= new Koya(width/4,height/2);
  //chimmy1 = new Chimmy(width/2,height/2);
  
}


void draw() {
  background(#E8A2E3);
 
 //for the store front drawing
  for (int i=0; i<storefront.length; i++) {
  lad[i].display();
  }
  for (int i=0; i<storefront.length; i++) {
    storefront[i].display();
  }
  for (int i=0; i<chimmy.length; i++){
    chimmy[i].display();
    chimmy[i].Crafity();
  }
  //the plushie heads
  koya1.display();
  koya1.kravity();
  //chimmy1.Crafity();
  
  //for the shopping cart
  for (int i=0; i<cart.length; i++){
   cart[i].display();
   cart[i].CartControl();
  }
  
}

void keyPressed(){
  if (key == TAB){
  for (int i=0; i<lad.length; i++){
   lad[i].CheckPressed = !lad[i].CheckPressed;
}
}
}

void mouseDragged() {
  for (int i=0; i<chimmy.length; i++){
  chimmy[i].dragChimmy();
  }
  koya1.dragKoya();
}
