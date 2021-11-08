/* This is the class of the LightBulb. Every lightbulb on the screen, accept for the lightbulb of the lamp located on the televison,
 is identical, the whole package of lightbulbs is made with an array. The diffrent bulbs spawn on random locations on the screen
 in the top quarter of the screen. The lightbulbs can be turned on with the lightswitch so that the color of the lightbulbs changes
 and a beam of light appear behind the lightbulbs. The disco mode (when the light switch is turned on and the radio is playing a song)
 gives the lightbulbs and the light beams behind it a random color, so that a disco effect appears.
 */
 
class LightBulb {
  float xBulb = random(0, width);
  float yBulb = random(40, height/4);

  void display() {
    pushMatrix();
    translate(xBulb, yBulb);
    //wire
    line(0, -30, 0, -yBulb);

    noStroke();
    fill(lightSwitchBulbs.ColorBeam);
    ellipse(0, 0, 200, 200); //breams of light behind the bulb

    if (lightSwitchBulbs.disco ==true||lightSwitchBulbs.turnOn==true) {
      fill(lightSwitchBulbs.redYellowOrDisco, lightSwitchBulbs.greenYellowOrDisco, lightSwitchBulbs.blueYellowOrDisco);
    } else {
      fill(210, 210, 210);
    }
    
    stroke(1);
    ellipse(0, 0, 30, 30); //bulb
    fill(111, 111, 111);
    rect(0, -22, 10, 15); //fitting
    
    popMatrix();
  }
}
