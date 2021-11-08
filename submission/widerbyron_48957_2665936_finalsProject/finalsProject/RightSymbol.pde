/*
 RightSymbol Class 
 Right Montblanc Symbol, if pressed slows down the portal, if pressed again, resets the speed to the initial one.
 Author: Byron
 */


class RightSymbol {

  float symbolX;
  float symbolY;

  Button button;

  boolean buttonIsPressed = false;

  Storefront store;

  Circle circle;

  Star[] stars;

  RightSymbol(float xPos, float yPos, Storefront sceneStore) {

    symbolX = xPos;
    symbolY = yPos;

    button = new Button(0, 0, 150);

    stars = new Star[2];

    circle = new Circle(width*0.32, 0, 0);

    store = sceneStore;

    //draws the stars and places the buttins on the stars points
    stars[0] = new Star(width*0.32, 0, 1, #C2B886, 0);
    stars[1] = new Star(width*0.32, 0, 0.6, #98917F, 0);
  }

  void display() {
    pushMatrix();
    translate(symbolX, symbolY);
    circle.display();
    stars[0].display();
    stars[1].display();
    button.display();

    popMatrix();
  }

  void update() {

    if (buttonIsPressed) {
      store.portalSpeed();
    }
  }


  void clicked(float mouseX, float mouseY) {

    if (!buttonIsPressed) {
      buttonIsPressed = button.isPressed(mouseX-symbolX-width*0.32, mouseY-symbolY, 0);
    } else {
      store.portalReset();
      buttonIsPressed = false;
    }
  }
}
