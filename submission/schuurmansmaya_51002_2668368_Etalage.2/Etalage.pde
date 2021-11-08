class Shoppingwindow{


PImage img;



void display(){
  background(255);
  
  img = loadImage("Intertoyslogo.png");
 img.resize(400,150);
 

  fill(51,187,255); //Sky
  rect(0,0,1500,140);
 
  fill(51,187,255,60);//Glass
  rect(0,170,1500,630);
  fill(150);//Roof and pillars
  noStroke();
  rect(0,170,50,630);
  rect(1450,170,50,630);
  rect(0,140,1500,50);
  rect(0,480,1300,20);
  stroke(10);{
  fill(54,190,245);
 rect(650,550,100,250);
 rect(750,550,100,250);
  }
  fill(0);
  circle(720,675,15);
  circle(780,675,15);
 
/* stroke(1);
 fill(180);
  
  rect(1350,600,50,250);
  rect(1400,550,50,300);
  rect(1450,500,50,350);
  
  stroke(1);
 fill(180);
  rect(1300,650,50,200);
  rect(1250,700,50,150);
  rect(1200,750,50,100); */
  
 
  image(img, 560,80);//Logo
 
}

}
