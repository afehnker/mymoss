class glassDoor {

  //creating the glass door

  void display() {
    //the lines in the glass
    pushStyle();
    noFill();
    strokeWeight(2);
    beginShape(LINES);
    //line door left
    vertex(282, 245);
    vertex(265, 615);
    //line door right
    vertex(582, 622);
    vertex(575, 246);
    //line door middle
    vertex(423, 619);
    vertex(426, 241);
    //line top left
    vertex(281, 233);
    vertex(282, 135);
    //line top right
    vertex(574, 235);
    vertex(573, 135);
    //line door top
    vertex(306, 240);
    vertex(549, 241);
    endShape();
    popStyle();

    //the locks and hinges
    pushStyle();
    fill(201);
    strokeWeight(0);
    beginShape();
    //hinge topleft
    vertex(272, 230);
    vertex(308, 230);
    vertex(308, 247);
    vertex(272, 247);
    endShape();
    //hinge top right
    beginShape();
    vertex(548,233);
    vertex(583,233);
    vertex(583,248);
    vertex(548,248);
    endShape();
    //hinge bottom right
    
    popStyle();
  }
}
