class Background {    
  PImage img;
  float backgroundX;    
  float backgroundY;    
  float backgroundW;    
  float backgroundH;    

  Background(float initX, float initY, float initW, float initH) {    
    backgroundX = initX;    
    backgroundY = initY;    
    backgroundW = initW;    
    backgroundH = initH;
  }    
  void images() {
    background1 = loadImage("6.png");
    royaldonuts = loadImage("Royaldonuts.png"); 
    window = loadImage("window.png"); 
    shop1 = loadImage("Shop1.jpg");
    maggie = loadImage("Maggie.png"); 
    marge = loadImage("Marge.png");
    bart = loadImage("Bart.png");
    lisa = loadImage("Lisa.png");
    drip = loadImage("Drip1.png");
  }

  void display() {    
    // Images of the family
    image(maggie, 1260, 400, 100, 100);   
    image(marge, 1115, 240, 235, 270);   
    image(bart, 1390, 320, 150, 190);   
    image(lisa, 1340, 350, 75, 150);

    //Shop
    strokeWeight(5);  
    stroke(171, 0, 142);  

    //Building    
    fill(255, 102, 179);    
    rect(backgroundX, backgroundY, backgroundW, backgroundH);    

    fill(255, 255, 255);    
    //Shop name board      
    image(royaldonuts, backgroundX +10, backgroundY +10, backgroundW -20, backgroundH - 180);      

    //Shop window   
    image(window, backgroundX +40, backgroundY +100, backgroundW -225, backgroundH -125);    

    //shop door
    image(shop1, backgroundX +270, backgroundY +100, backgroundW -300, backgroundH -100);    

    //Shop door    
    noFill();  
    stroke(171, 0, 142);  
    strokeWeight(7);  
    rect(backgroundX +270, backgroundY +100, backgroundW -300, backgroundH -100);    

    strokeWeight(5);  
    stroke(171, 0, 142);  

    //Shop outside    
    fill(255, 102, 179);    
    quad(backgroundX, backgroundY, backgroundX +400, backgroundY, backgroundX +450, backgroundY -50, backgroundX +50, backgroundY -50);    
    quad(backgroundX +450, backgroundY -50, backgroundX +400, backgroundY, backgroundX +400, backgroundY +250, backgroundX +450, backgroundY +200);  

    strokeWeight(5);  
    stroke(0);  
    rect(backgroundX +200, backgroundY -120, backgroundW -380, backgroundH -150);    

    //Donut    
    strokeWeight(1);  
    noStroke();  
    fill(0, 0, 0);    
    ellipse(backgroundX +215, backgroundY -135, backgroundW -250, backgroundH -100);    

    strokeWeight(5);  
    stroke(0);  
    fill(222, 184, 135);    
    ellipse(backgroundX +210, backgroundY -130, backgroundW -250, backgroundH -100);    


    //Hole donut 
    fill(255, 255, 255);    
    ellipse(backgroundX +210, backgroundY -130, backgroundW -350, backgroundH -200);    

    //Donut topping    
    fill(255, 102, 179);    
    noStroke();    
    ellipse(backgroundX +160, backgroundY -130, backgroundW -350, backgroundH -200);    
    ellipse(backgroundX +175, backgroundY -165, backgroundW -350, backgroundH -200);    
    ellipse(backgroundX +210, backgroundY -180, backgroundW -350, backgroundH -200);    
    ellipse(backgroundX +260, backgroundY -130, backgroundW -350, backgroundH -200);    
    ellipse(backgroundX +210, backgroundY -80, backgroundW -350, backgroundH -200);    
    ellipse(backgroundX +175, backgroundY -95, backgroundW -350, backgroundH -200);    
    ellipse(backgroundX +245, backgroundY -165, backgroundW -350, backgroundH -200);    
    ellipse(backgroundX +245, backgroundY -95, backgroundW -350, backgroundH -200);    

    strokeWeight(1);  
    noStroke();  

    //Donut sprinkles           
    //White    
    fill(255, 255, 255);    
    ellipse(backgroundX +245, backgroundY -95, backgroundW -395, backgroundH -235);   
    ellipse(backgroundX +255, backgroundY -135, backgroundW -395, backgroundH -235);    
    ellipse(backgroundX +165, backgroundY -150, backgroundW -395, backgroundH -235);        

    //Red    
    fill(255, 0, 0);    
    ellipse(backgroundX +235, backgroundY -90, backgroundW -395, backgroundH -235);
    ellipse(backgroundX +250, backgroundY -165, backgroundW -395, backgroundH -235);    
    ellipse(backgroundX +150, backgroundY -135, backgroundW -395, backgroundH -235);        

    //Teal    
    fill(0, 128, 128);    
    ellipse(backgroundX +205, backgroundY -90, backgroundW -395, backgroundH -235);    
    ellipse(backgroundX +195, backgroundY -170, backgroundW -395, backgroundH -235);    
    ellipse(backgroundX +160, backgroundY -120, backgroundW -395, backgroundH -235);    

    //Yellow    
    fill(255, 255, 0);    
    ellipse(backgroundX +180, backgroundY -95, backgroundW -395, backgroundH -235);    
    ellipse(backgroundX +220, backgroundY -175, backgroundW -395, backgroundH -235);          

    //Cyan    
    fill(0, 255, 255);    
    ellipse(backgroundX +175, backgroundY -120, backgroundW -395, backgroundH -235);    
    ellipse(backgroundX +170, backgroundY -170, backgroundW -395, backgroundH -235);    
    ellipse(backgroundX +215, backgroundY -80, backgroundW -395, backgroundH -235);     
    ellipse(backgroundX +270, backgroundY -120, backgroundW -395, backgroundH -235);        

    noFill();

    //Background horizon
    fill(255);
    rect(backgroundX -700, backgroundY +270, backgroundW +1400, backgroundH +650);


    //Background drip
    image(drip, backgroundX -700, backgroundY +270, backgroundW -200, backgroundH -180);
    image(drip, backgroundX -500, backgroundY +270, backgroundW -200, backgroundH -180);
    image(drip, backgroundX -300, backgroundY +270, backgroundW -200, backgroundH -180);
    image(drip, backgroundX -100, backgroundY +270, backgroundW -200, backgroundH -180);
    image(drip, backgroundX +100, backgroundY +270, backgroundW -200, backgroundH -180);
    image(drip, backgroundX +300, backgroundY +270, backgroundW -200, backgroundH -180);
    image(drip, backgroundX +500, backgroundY +270, backgroundW -200, backgroundH -180);
    image(drip, backgroundX +700, backgroundY +270, backgroundW -200, backgroundH -180);
    image(drip, backgroundX +900, backgroundY +270, backgroundW -200, backgroundH -180);
    
    //Donuts background
    image(background1, backgroundX -700, backgroundY -195);

  }
}    
