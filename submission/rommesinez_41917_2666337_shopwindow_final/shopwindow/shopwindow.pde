Spot[] spots = new Spot[20];
Fruit[] fruits = new Fruit[15];

boolean rainingFruit = false;
boolean rainingWater = false;

Table table;
Outside outside;
Cow cow;

void setup() {
  size (800, 1000); 
  rectMode (CENTER);

  table = new Table(300, 450);
  outside = new Outside (0, 0);
  cow = new Cow (300, 300);

  for (int i = 0; i<fruits.length; i++) {
    fruits[i] = new Fruit(random(width), random(height));
  }
}

void draw() {
  background(100, 244, 244); //gray   
  cow.display();
  table.display();

  if (rainingFruit) {
    for (int i = 0; i<fruits.length; i++) { 
      fruits[i].fruit();
      fruits[i].fall();
    }
  }
  if (rainingWater) {
    for (int i = 0; i<fruits.length; i++) { 
      fruits[i].water();
    }
  }
}

void keyPressed() {
  if (key == 'f') {
    rainingFruit = true;
    if (key == 'w') {
      rainingWater = true;
    }
  }
}
