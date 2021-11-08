//background for our shop window
//Image created by Rene de Haan, https://www.stocksy.com/2952913/empty-shopwindow

class window {

  PImage shop;
 
 void display(){
   size (600,900);
   shop = loadImage("emptyshop2.jpg");
   image(shop,300,450,width,height);
 }
}
