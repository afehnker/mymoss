/*
  Dog 
  The dog
  Made by: Jakub Stachurski

*/


//PImage dogImgs[]; in the main class

class Dog{
  final int x,y;
  final int size;
  PImage img; 
  
  Dog(int x, int y, int size,int type){
    this.x = x; 
    this.y = y; 
    this.size = size; 
    img = dogImgs[type];
    img.resize(size,size);
  }
  
  boolean checkIfWithin(int x, int y){
    return (x > this.x && x < this.x + size && y > this.y && y < this.y + size);
  }
  
  void display(){
    image(img,x,y);
  }


}
