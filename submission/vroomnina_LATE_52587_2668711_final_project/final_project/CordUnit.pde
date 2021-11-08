//One cord unit, physics can be significantly improved via
//backpropagation but I didn't figure that out until too late.

class CordUnit {
    float x;
    float y;
    float w;
    float l;
    float rotation;
    float av;

    CordUnit(float initR) {
        w = 3;
        l = 10;
        rotation = initR;
        av = 0;
    }

    //draws the cord unit
    void display() {
        pushMatrix();
        translate(x, y);
        rotate(rotation);
        
        rect(-w/2, 0, w, l+1);
        popMatrix();
    }
    
    //rotates towards vertical with acceleration
    void update(float newX, float newY) {
      
      x = newX;
      y = newY;
      
      if(abs(rotation) < 0.01 && abs(av) < 0.01) {
        av =+ 0;
      } else if(rotation > 0) {
        av -= 0.001;
      } else if(rotation < 0) {
        av += 0.001;
      }
      av *= .99;
      rotation += av;
    }
}