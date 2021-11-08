class Spider {
  float beginWebX, endWebX, endWebY, speed;

  Spider() {
    beginWebX = 800;
    endWebX = 800;
    endWebY = -200;
    speed = 0;
  }

  void display() {
    //----web----
    stroke(200, 128);
    strokeWeight(10);
    line(beginWebX, 0, endWebX, endWebY);
    stroke(1);
    strokeWeight(1);
    //----spider----
    //pushMatrix();
    //rotate(atan(endWebX/endWebY));
    fill(30);
    //___body___
    ellipse(endWebX, endWebY + 100, 150, 200); //body
    ellipse(endWebX, endWebY + 200, 150, 100); //head
    //___legs___
    strokeWeight(10);
    stroke(30);
    //..rightside first layer..
    line(endWebX, endWebY + 150, endWebX + 150, endWebY + 50);
    line(endWebX, endWebY + 150, endWebX + 150, endWebY + 150);
    line(endWebX, endWebY + 150, endWebX + 125, endWebY + 190);
    line(endWebX, endWebY + 150, endWebX + 100, endWebY + 250);
    //..rightside second layer..
    line(endWebX + 150, endWebY + 50, endWebX + 130, endWebY - 80);
    line(endWebX + 150, endWebY + 150, endWebX + 220, endWebY + 80);
    line(endWebX + 125, endWebY + 190, endWebX + 180, endWebY + 250);
    line(endWebX + 100, endWebY + 250, endWebX + 80, endWebY + 300);
    //..lefside first layer..
    line(endWebX, endWebY + 150, endWebX - 150, endWebY + 50);
    line(endWebX, endWebY + 150, endWebX - 150, endWebY + 150);
    line(endWebX, endWebY + 150, endWebX - 125, endWebY + 190);
    line(endWebX, endWebY + 150, endWebX - 100, endWebY + 250);
    //..leftside second layer..
    line(endWebX - 150, endWebY + 50, endWebX - 130, endWebY - 80);
    line(endWebX - 150, endWebY + 150, endWebX - 220, endWebY + 80);
    line(endWebX - 125, endWebY + 190, endWebX - 180, endWebY + 250);
    line(endWebX - 100, endWebY + 250, endWebX - 80, endWebY + 300);
    strokeWeight(1);
    //___mouth___
    triangle(endWebX - 60, endWebY + 200, endWebX - 40, endWebY + 200, endWebX - 50, endWebY + 270);
    triangle(endWebX + 60, endWebY + 200, endWebX + 40, endWebY + 200, endWebX + 50, endWebY + 270);
    triangle(endWebX - 50, endWebY + 272, endWebX - 50, endWebY + 267, endWebX - 40, endWebY + 280);
    triangle(endWebX + 50, endWebY + 272, endWebX + 50, endWebY + 267, endWebX + 40, endWebY + 280);
    stroke(1);
    //___eyes___
    fill(255, 255, 255);
    ellipse(endWebX + 25, endWebY + 200, 20, 30);
    ellipse(endWebX - 25, endWebY + 200, 20, 30);
    fill(0);
    circle(endWebX + 26, endWebY + 212, 10);
    circle(endWebX - 24, endWebY + 212, 10);
  }

  void moveSpider(float xMouse, float yMouse) {
    if (dist(xMouse, yMouse, endWebX, endWebY + 200)<= 150) {
      endWebX = xMouse;
      endWebY = yMouse - 200;
    }
  }

  void swing() {
    float webLength = dist(beginWebX, 0, endWebX, endWebY);
    float x;
    //float speed = 1;
    /*
    in oder to let the spider swing also the other way around consider using an other variable in the if statement called something like
    moveRight. 
    
    OR maybe better do when the spider has passed the middle double the the thing that you add to the speed so the first time that would be
    0.1 will be 0.2 so you would have to make that a variable. And maybe a function that determents if the spider has passed the middle.
    
    */
    if (beginWebX - endWebX < - 10) { // swing to the left
      speed += 0.1;
      x = beginWebX - endWebX + speed;
      float y = abcFormulaGetA(x, webLength);
      //println(beginWebX - endWebX);
      endWebX -= speed;
      endWebY = y;
    } else if (beginWebX - endWebX > 10) { // swing to the right
      speed -= 0.1;
      x = beginWebX - endWebX + speed;
      float y = abcFormulaGetA(x, webLength);
      //println(beginWebX - endWebX);
      endWebX -= speed;
      endWebY = y;
    } else {
      speed = 0;
    }
    println(speed);
    println(endWebX);

    //println("y ", y);
  }





  float abcFormulaGetA(float b, float c) {
    b = pow(b, 2);
    c = pow(c, 2);
    float a = sqrt(c - b);
    return(a);
  }
}
