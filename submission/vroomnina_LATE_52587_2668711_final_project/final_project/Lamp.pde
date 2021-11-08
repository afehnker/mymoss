//The lamps, the point of the store.

class Lamp {
  
  Light light;
  boolean lit;
  PShape texture;

  float x;
  float y;
  float rotation;
  String shapeName;
  color lightC;
  float scale;
  
  //initilize lamp texture, position, and the light's status.
  //I was planning to have multiple textures but didn't have time for that.
  Lamp(float initX, float initY, float initR, color lightColor, boolean startLit) {
    x = initX;
    y = initY;
    rotation = initR;
    shapeName = "lamp.svg";
    
    scale = 0.7;
    texture = loadShape(shapeName);
    texture.disableStyle();
    texture.scale(scale);
    
    lit = startLit;
    lightC = lightColor;
    light = new Light(shapeName, lightC);
  }
  
  //draws the lamp and it's light if needed
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(rotation+PI);
    
    if(lit) {
      fill(255, 255, 255);
    } else {
      fill(150, 150, 150);
    }
    shape(texture, -texture.width/2*scale, -texture.height*scale);
  
    if(lit) {
      translate(0, -texture.height*scale/2);
      light.display();
    }

    popMatrix();
  }

  //update lamp position for the corded lamp movement
  void update(float newX, float newY, float newR) {
    x = newX;
    y = newY;
    rotation = newR;
  }
}
