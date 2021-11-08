class BlueGirl {
  float xPosBlueGirl = 1000;
  float yPosBlueGirl = 200;
  float xSpeed;
  float ySpeed;
  float hittimer;
  //constructor
  BlueGirl(float init2X, float init2Y) {
    xPosBlueGirl = init2X;
    yPosBlueGirl = init2Y;
  }
  void display() {//displays the store girl2
    if (!Hit) {//draws storegirl 2 if it is not hit
      image(imgManneQuin2, xPosBlueGirl, yPosBlueGirl, width/11, height/3);
    } else if (Hit)  image(imgManneQuin2Mad, xPosBlueGirl, yPosBlueGirl, width/11, height/3); //if she is hit it draws her with an angry face
    hittimer++;//starts hit timer
    if (hittimer >100) {
      Hit = false; // makes hit false if the hittimer is to high
      hittimer =0;//resets hittimer
    }
  }
  void countSpeed() {//counts the speed of the bluegirl
    if (keyA && xPosBlueGirl >845) xSpeed-= 0.5;
    if (keyD && xPosBlueGirl < 970) xSpeed+= 0.5;
    if (keyW && yPosBlueGirl > 140) ySpeed-= 0.5;
    if (keyS && yPosBlueGirl < 400) ySpeed+= 0.5;
    xSpeed *= 0.9; //Apply some drag so that the she wouldn't fly off to fast
    ySpeed *= 0.9;
  }
  void changePosition() {//changes the position of the blue girl
    xPosBlueGirl+=xSpeed;
    yPosBlueGirl+=ySpeed;
  }
}
