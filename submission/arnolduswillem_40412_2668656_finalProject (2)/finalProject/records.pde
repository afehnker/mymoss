class records {
  //creating the highlight color
  color leftRecordColor = color(0);
  color rightRecordColor = color(0);
  
  void display() {
    //creating the record highlight overlays
    pushStyle();
    fill(0);
    ellipseMode(RADIUS);
    
    fill(leftRecordColor);
    ellipse(142, 357, 38, 36);

    fill(rightRecordColor);
    ellipse(713, 361, 38, 40);
    popStyle();
    
  }
}
