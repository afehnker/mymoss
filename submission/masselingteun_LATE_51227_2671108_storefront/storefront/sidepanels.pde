class sidepanels{
  
  float panelOneX= 200;
  float panelOneY= 200;
  float panelTwoX= 805;
  color panelColor;
  //constructor sidepanels
  sidepanels(float sideOneX, float sideOneY){
    panelColor = color(252, 119, 3);
    panelOneX = sideOneX;
    panelOneY = sideOneY;
    
  }
  //display sidepanels
  void display(){
    fill(panelColor);
    rect(panelOneX, panelOneY, 150, 480);
    rect(panelTwoX, panelOneY, 150, 480);
    
    
  
  }
}
