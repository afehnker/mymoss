class sunScreen {
  float sunScreenX;
  float sunScreenY;
  float offsetX;
  float offsetY;
  
  sunScreen(float gx, float gy, float go, float gp) {
    // Initialize the sunscreen at the ###############
    sunScreenX = gx;
    sunScreenY = gy;
    offsetX = go;
    offsetY = gp;
  }

  void display() {
    rectMode(CENTER);
    
    //creation of the sunscreen, including the offset.
    fill(165, 165, 165);
    rect(sunScreenX + width/23, sunScreenY + height/4.6, width/1.64, height/50);
    fill(0);
    quad(sunScreenX, sunScreenY + offsetY * (height/3), sunScreenX, sunScreenY + height/4.6, sunScreenX + width/14.7, sunScreenY + height/4.6, sunScreenX + offsetX * (width/11), sunScreenY + offsetY * (height/3));
    quad(sunScreenX - width/14.7, sunScreenY + height/4.6, sunScreenX + -offsetX * (width/11), sunScreenY + offsetY * (height/3), sunScreenX + -offsetX * (width/6.5), sunScreenY + offsetY * (height/3), sunScreenX - width/8.3, sunScreenY + height/4.6);
    quad(sunScreenX + offsetX * (width/5.7), sunScreenY + offsetY * (height/3), sunScreenX + width/7.4, sunScreenY + height/4.6, sunScreenX + width/5, sunScreenY + height/4.6, sunScreenX + offsetX * (width/3.9), sunScreenY + offsetY * (height/3));


    fill(255);
    quad(sunScreenX, sunScreenY + offsetY * (height/3), sunScreenX, sunScreenY + height/4.6, sunScreenX - width/14.7, sunScreenY + height/4.6, sunScreenX + -offsetX * (width/11), sunScreenY + offsetY * (height/3));
    quad(sunScreenX + width/14.7, sunScreenY + height/4.6, sunScreenX + offsetX * (width/11), sunScreenY + offsetY * (height/3), sunScreenX + offsetX * (width/5.7), sunScreenY + offsetY * (height/3), sunScreenX + width/7.4, sunScreenY + height/4.6);
    quad(sunScreenX + width/5, sunScreenY + height/4.6, sunScreenX + offsetX * (width/3.9), sunScreenY + offsetY * (height/3), sunScreenX + offsetX * (width/2.93), sunScreenY + offsetY * (height/3), sunScreenX + width/3.75, sunScreenY + height/4.6);
    quad(sunScreenX + -offsetX * (width/6.5), sunScreenY + offsetY * (height/3), sunScreenX - width/8.3, sunScreenY + height/4.6, sunScreenX - width/5.35, sunScreenY + height/4.6, sunScreenX + -offsetX * (width/4.2), sunScreenY + offsetY * (height/3));

    fill(165, 165, 165);
    rect(sunScreenX + offsetX * (width/23), sunScreenY + offsetY * (height/3), offsetX * (width/1.67), offsetY * (height/45));
  }

  void move(float mx, float my) {
    //changing of the offset and boundaries so it doesnt get to big
    if (offsetY > 1.4) offsetY = 1.4;
    if (offsetY < 1.0) offsetY = 1.0;
    if (offsetX >1.4) offsetX = 1.4;
    if (offsetX < 1.0) offsetX = 1.0;
    offsetX = mx + offsetX;
    offsetY = my + offsetY;
  }
}
