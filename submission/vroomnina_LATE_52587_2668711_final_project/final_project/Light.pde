//The glowy bits.

class Light {
  PShape texture;
  PGraphics light;
  float scale;

  color lightColor;
  
  Light(String shapeName, color c) {
    light = createGraphics(500, 500);
    lightColor = c;

    scale = 1.1;
    texture = loadShape(shapeName);
    texture.scale(scale);
    texture.disableStyle();
    
    makeLight(lightColor);
  }
  
  //draw the lamp
  void display() {
    blendMode(SCREEN);
    image(light, -light.width/2, -light.height/2);
    blendMode(BLEND);
  }

  //make a new PGraphics graphic only when needed to prevent unnecessary lag
  void makeLight(color c) {
    lightColor = c;
    
    light.beginDraw();
    light.fill(lightColor);
    light.shape(texture, light.width/2-texture.width/2*scale, light.height/2-texture.height/2*scale); // offsets light into the middle of the 500px * 500px image so it doesn't get cut off on blur
    light.filter(BLUR, 5);
    light.filter(BLUR, 5);
    light.filter(BLUR, 5);
    light.filter(BLUR, 5);
    light.endDraw();
  }
}
