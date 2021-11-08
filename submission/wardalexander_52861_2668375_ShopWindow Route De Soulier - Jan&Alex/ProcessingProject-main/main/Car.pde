/* Car class
 Displays the volkswagen - image source - https://www.carpixel.net/w/c9c75fe0364f185db422a09122cc580b/volkswagen-t1-deluxe-bus-car-wallpaper-46529.jpg
 Drives the car using left / right arrow
 */
class Car {

  float xCar;
  float yCar;            //global variables of class car
  float speedCar;


  Car() {
    xCar=420.0;
    yCar=170.0;      //constructor of class Car that sets initial values like position and speed
    speedCar=8;
  }

  void display() {
    smooth();
    frameRate(60);                    //makes the framerate and genaral
    imageMode(CENTER);
    image(T1, xCar, yCar, 428, 284);          //displays the car
  }

  void left() {
    xCar=xCar-speedCar;
  }                                      //changes the x Position of the car to make it move left and right

  void right() {
    xCar=xCar+speedCar;
  }

  void borders() {
    if (xCar<-600) {
      xCar=700;                          //if the car goes out of bounds, it spawns back in on the other side of the canvas
    }
    if (xCar>700) {
      xCar=-500;
    }
  }
}

// END OF CAR
