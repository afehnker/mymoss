class ClickArea {
  boolean clickArea;
  
  ClickArea() {
  }

  void make(float posX, float posY, int a, int c, int b, int d) {
    if ((posX>a && posX<b) && (posY>c && posY<d)){
 clickArea=true;
    }
    else{
 clickArea=false; 
    }
  }
  
  void reset(){
    clickArea=false;
  }
}
