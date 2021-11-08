class Background {
  //array of bread
  BakeryObject[] breads;
  
  Background() {
    //array constructor calling
    breads = new BakeryObject[10];
    for (int i =0; i < breads.length; i++) {
      breads[i] = new BakeryObject(390 + i*80, 470);
    }
  }

  //background drawing
  void display() {
    background(156, 104, 83);
    fill(156, 104, 83);
    strokeWeight(7);
    
    //background walls
    quad(0, 800, 350, 650, 350, 0, 0, 0);
    quad(1500, 800, 1150, 650, 1150, 0, 1500, 0);
    
    //shelf
    rect(350, 300, 800, 200);
    fill(209, 189, 114);
    strokeWeight(2);
    rect(353, 440, 794, 60);
    
    //table
    rect(100, 800, 1300, 200);
    quad(100, 800, 1400, 800, 1150, 650, 350, 650);
    
    // logo
    strokeWeight(0);
    fill(255);
    rect(550, 75, 400, 160);
    fill(156, 104, 83);
    textSize(90);
    text("NOLLEN", 580, 185);
    
    //button left
    strokeWeight(3);
    fill(49, 191, 2);
    rect(150, 850, 200, 100);
    fill(209, 189, 114);
    textSize(40);
    text("ROTATE", 170, 915);
    
    //button right
    fill(191, 2, 49);
    rect(1150, 850, 200, 100);
    fill(209, 189, 114);
    textSize(40);
    text("BACK", 1200, 915);
    
    //loaves of bread displayed on a shelf
    for (int i =0; i < breads.length; i++) {
      breads[i].display();
    }
  }
}
