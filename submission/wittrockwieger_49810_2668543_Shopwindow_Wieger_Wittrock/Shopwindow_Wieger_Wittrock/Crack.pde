/*
Shopwindow by Wieger Wittrock, group 1.
 31-10-2021
 This interactive shopwindow has elements of the real shop "By Jan Marc" in Hengelo
 */
class Crack { //class for the cracks in the window when you smash it with a crowbar. Object of this class are created in a ArrayList in the Window class.

  float xPosition;
  float yPosition;

  float randomRotation; //these variables hold random values and so can not be in the display methods, since then the value will change every frame
  float[] randomPosition;

  Crack(float initialXposition, float initialYposition) {
    xPosition = initialXposition; //we use this in the window class when you click the glass
    yPosition = initialYposition;
    randomRotation = random(0, 360);
    randomPosition = new float[8]; //we use an array, because we want a random value 8 times
    for (int i = 0; i<randomPosition.length; i++) {
      randomPosition[i] = random(-20, 40);
    }
  }

  void display() {
    pushMatrix();
    translate(xPosition, yPosition); //easier to draw and to rotate! And since this is in a pop and push matrix all the cracks will look different with the same code
    rotate(radians(randomRotation));
    fill(159, 189, 207, 200); //color and opacity of glass
    stroke(109, 109, 137, 110);
    quad(randomPosition[0], randomPosition[1], randomPosition[2], randomPosition[3], randomPosition[4], randomPosition[5], randomPosition[6], randomPosition[7]);
    line(randomPosition[0], randomPosition[1], 30, 30);
    line(randomPosition[2], randomPosition[3], -30, -30);
    line(randomPosition[4], randomPosition[5], 30, -30);
    line(randomPosition[6], randomPosition[7], -30, 30); //by using the random variable array and a ranodm rotation we can create real looking cracks
    line(30, 30, 60, 60);
    line(-30, -30, -60, -60);
    line(30, -30, 60, -60);
    line(-30, 30, -60, 60);
    popMatrix();
  }
}
