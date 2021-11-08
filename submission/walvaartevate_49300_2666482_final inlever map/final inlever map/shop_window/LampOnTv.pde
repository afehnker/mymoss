/* This is the class for the lamp that is located on top of the television.
 Features of the lamp: The light of the lamp can be turned on and off using the light switch on the left side of the screen. There is also a disco mode
 for the light, where the lamp gives off random colors of light. The disco mode turns on when a song is played through the radio and the lamp is turned on at the same time.*/
 
class LampOnTv {
  int redLightColor;
  int greenLightColor;
  int blueLightColor;

  void display() {
    pushMatrix();
    translate(170, 434);

    stroke(0);
    strokeWeight(2);
    fill(90);

    //stick of the lamp
    rect(0, -55, 5, 100);

    //lamp shade
    rect(0, -55-50-30, 60, 60);

    //lower part of the lampshade
    arc(0, -106, 60, 10, 0, PI, OPEN);

    //upper part of the lampshade
    ellipse(0, -140-25, 60, 10);


    if (lightSwitchBulbs.turnOn == true) {
      redLightColor = 233;
      greenLightColor= 233;
      blueLightColor = 0;
      fill(lightSwitchBulbs.redYellowOrDisco, lightSwitchBulbs.greenYellowOrDisco, lightSwitchBulbs.blueYellowOrDisco, 30);
      noStroke();
      arc(0, -163, 350, 200, PI, TWO_PI, OPEN); //light beams from the top of the lampshade
      arc(0, -106, 220, 125, 0, PI, OPEN);//light beams from the bottom of the lampshade
      fill(90);
      arc(0, -106, 60, 10, 0, PI, OPEN);// this causes that it looks like that the beams from the bottom of the lampcome from inside the lampshade
    } else {
      redLightColor =210;
      greenLightColor = 210;
      blueLightColor = 210;
    }
    if (lightSwitchBulbs.disco ==true||lightSwitchBulbs.turnOn==true) {
      fill(lightSwitchBulbs.redYellowOrDisco, lightSwitchBulbs.greenYellowOrDisco, lightSwitchBulbs.blueYellowOrDisco);
    } else {
      fill(redLightColor, greenLightColor, blueLightColor);
    }
    //bulb of the lamp
    ellipse(0, -163, 30, 8);

    fill(90);
    stroke(0);
    strokeWeight(2);
    //feet of the lamp
    rect( 0, 0, 60, 10);
    popMatrix();
  }
}
