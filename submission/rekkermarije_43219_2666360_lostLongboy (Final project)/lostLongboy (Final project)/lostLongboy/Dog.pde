/*
Making the dog a teckel that is playable!
 */

class Dog {
  float dogX;
  float dogY;
  float speed = 3;
  float maxSpeed = 7;
  float radius = 12;
  PImage teckelHead;
  float size;
  color boneColor = #D8CE95;
  color dogColor = #AD7B10;


  //multiple middle parts to make the dog a long sausage :)
  ArrayList <Body_dog>
    body = new ArrayList <Body_dog>();
  Body_dog dogbody = new Body_dog(width/2, 20);

  Dog(float x, float y) {
    dogX = x;
    dogY = y;
    size = 60;
    imageMode(CENTER);
    teckelHead = loadImage("teckelHead.PNG");
    imageMode(CORNER);
  }

  //combining all the parts of the dog
  void wholeDog() {
    body.add(new Body_dog(dogX, dogY));

    //makes new elipses for the middle part of the dog, which makes the longboy longer ;)
    for (int count = 0; count < body.size(); count += 1) {
      Body_dog bodypart = body.get(count);
      bodypart.dogBody();
    }
  }

  //draw the back of the dog
  void dogBack() {
    noStroke();
    fill(dogColor);
    ellipse(width/2-5, 20, 2 * radius, 2 * radius);
    ellipse(width/2-10, 20, 2 * radius, 2 * radius);
    ellipse(width/2-15, 20, 2 * radius, 2 * radius);
    ellipse(width/2-20, 20, 2 * radius, 2 * radius);
    ellipse(width/2-25, 20, 2 * radius, 2 * radius);
    rect(width/2-22, 30, 5, 10);
    rect(width/2-30, 30, 5, 10);
  }

  //draw the front of the dog
  void dogFace() {
    image(teckelHead, dogX-17, dogY-13, size, size);
  }

  //wall detection. (Because we used images for the maze we look for white space instead of black walls, because they are not pure black(0))
  void moveDog(char inputKey) {
    //press W to go up
    if (direction(inputKey) == 0 && ((get(int(dogX), int(dogY - speed - radius))) == color(255) || get(int(dogX), int(dogY - speed - radius)) == color(dogColor) ||
      get(int(dogX), int(dogY - speed - radius)) == color(boneColor))) {

      dogY -= speed;
    }
    //press D to go right
    if (direction(inputKey) == 1 && ((get(int(dogX + speed + radius), int(dogY))) == color(255) || get(int(dogX + speed + radius), int(dogY)) == color(dogColor) ||
      get(int(dogX + speed + radius), int(dogY)) == color(boneColor))) {

      dogX += speed;
    }
    //press A to go left
    if (direction(inputKey) == 2 && ((get(int(dogX - speed - radius), int(dogY))) == color(255) || get(int(dogX - speed - radius), int(dogY)) == color(dogColor) ||
      get(int(dogX - speed - radius), int(dogY)) == color(boneColor))) {

      dogX -= speed;
    }
    //press S to go down
    if (direction(inputKey) == 3 && ((get(int(dogX), int(dogY + speed + radius))) == color(255) || get(int(dogX), int(dogY + speed + radius)) == color(dogColor) ||
      get(int(dogX), int(dogY + speed + radius)) == color(boneColor))) {

      dogY += speed;
    }
  }

  //keyStuff
  int direction(char inputKey) {
    int direction;

    if (inputKey == 'w') {
      direction = 0;
    } else if (inputKey == 'd') {
      direction = 1;
    } else if (inputKey == 'a') {
      direction = 2;
    } else if (inputKey == 's') {
      direction = 3;
    } else {
      direction = 4;
    }
    return direction;
  }

  //If Longboy eats a bone he becomes faster
  void speedUp() {
    if (speed <= maxSpeed) {
      speed++;
    }
  }
}
