//Hippie bus
//Pressing "c" the lights of the bus turn on, otherwise they are off
class Bus {
  PImage hippie; 
  PImage light;

  float posX;
  float posY;
  float sizeX;
  float sizeY;
  float sizeLightX;
  float sizeLightY;
  float sizeCarLights;

  color lightYellow;
  color metallicGold;

  boolean keyPress;

  Bus() {
    keyPress= false;
    lightYellow = color(255, 255, 153);
    metallicGold = color(197, 179, 88);
    hippie = loadImage("hippie.jpg");
    light = loadImage("headLight.png");
  }

  void display(float posX, float posY, float sizeX, float sizeY, float sizeLightX, float sizeLightY, float sizeCarLights) {
    image(hippie, posX, posY, sizeX, sizeY);

    if (keyPress) { //if you press "c" the lights turn on
      noLights();
      image(light, posX - 380, posY + 118, sizeLightX, sizeLightY);
      image(light, posX - 300, posY + 102, sizeLightX, sizeLightY);
    } else { //if key "c" is not pressed the lights turn off
      lights();
    }

    //lines that hold the poster
    line(posX + 5 - sizeX/2, posY - sizeY/2 - 2, posX, 500);
    line(posX - 5 + sizeX/2, posY - sizeY/2 - 2, posX, 500);

    //left headlight
    fill(metallicGold);
    stroke(metallicGold);
    strokeWeight(0);
    circle(posX - 88, posY + 105, sizeCarLights); // metallic circle around the bus headlight (on the left)
    fill(lightYellow);
    pushMatrix();
    noStroke();
    translate(posX - 88, posY + 105);
    sphere(sizeCarLights - 12); //left headlight
    popMatrix();

    //right headlight
    fill(metallicGold);
    circle(posX - 20, posY + 103, sizeCarLights + 3.4); // metallic circle around the bus headlight (on the left)
    fill(lightYellow);
    pushMatrix();
    translate(posX - 20, posY + 103);
    sphere(sizeCarLights - 10); //right headlight
    popMatrix();
  }

  void keyPress() {
    keyPress= true;
  }
  void keyRelease() {
    keyPress=false;
  }
}
