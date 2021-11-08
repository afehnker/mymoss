class Productionline {

  float lineX;  
  float lineY;  

  Productionline(float initX, float initY) {   
    lineX = initX;   
    lineY = initY;
  }   

  void display() {     
    stroke(169);
    line(lineX+730, lineY+10, lineX+690, lineY+60);
    line(lineX+710, lineY+10, lineX+670, lineY+60);
    line(lineX+690, lineY+10, lineX+650, lineY+60);
    line(lineX+670, lineY+10, lineX+630, lineY+60);
    line(lineX+650, lineY+10, lineX+610, lineY+60);
    line(lineX+630, lineY+10, lineX+590, lineY+60);
    line(lineX+610, lineY+10, lineX+570, lineY+60);
    line(lineX+590, lineY+10, lineX+550, lineY+60);
    line(lineX+570, lineY+10, lineX+530, lineY+60);
    line(lineX+550, lineY+10, lineX+510, lineY+60);
    line(lineX+530, lineY+10, lineX+490, lineY+60);
    line(lineX+510, lineY+10, lineX+470, lineY+60);
    line(lineX+490, lineY+10, lineX+450, lineY+60);
    line(lineX+470, lineY+10, lineX+430, lineY+60);
    line(lineX+450, lineY+10, lineX+410, lineY+60);
    line(lineX+430, lineY+10, lineX+390, lineY+60);
    line(lineX+410, lineY+10, lineX+370, lineY+60);
    line(lineX+390, lineY+10, lineX+350, lineY+60);
    line(lineX+370, lineY+10, lineX+330, lineY+60);
    line(lineX+350, lineY+10, lineX+310, lineY+60);
    line(lineX+330, lineY+10, lineX+290, lineY+60);
    line(lineX+310, lineY+10, lineX+270, lineY+60);
    line(lineX+290, lineY+10, lineX+250, lineY+60);
    line(lineX+270, lineY+10, lineX+230, lineY+60);
    line(lineX+250, lineY+10, lineX+210, lineY+60);
    line(lineX+230, lineY+10, lineX+190, lineY+60);
    line(lineX+210, lineY+10, lineX+170, lineY+60);
    line(lineX+190, lineY+10, lineX+150, lineY+60);
    line(lineX+170, lineY+10, lineX+130, lineY+60);    
    line(lineX+150, lineY+10, lineX+110, lineY+60);
    line(lineX+130, lineY+10, lineX+90, lineY+60);
    line(lineX+110, lineY+10, lineX+70, lineY+60);
    line(lineX+90, lineY+10, lineX+50, lineY+60);
    line(lineX+70, lineY+10, lineX+30, lineY+60);
    line(lineX+50, lineY+10, lineX+10, lineY+60);
    line(lineX+30, lineY+10, lineX-10, lineY+60);
    line(lineX+10, lineY+10, lineX-30, lineY+60);
  }  

  void move() {  
    lineX = lineX +5;   
    if (lineX >= 20) {   
      lineX= 0;
    }
  }
}
