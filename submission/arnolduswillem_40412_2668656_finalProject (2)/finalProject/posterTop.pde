class posterTop {
  //creating the colors fot the posters, outside the void diplay to make them easier to work with
  color colorPoster1 = color(0);
  color colorPoster2 = color(0);
  color colorPoster3 = color(0);
  color colorPoster4 = color(0);
  color colorPoster5 = color(0);
  color colorPoster6 = color(0);
  color colorPoster7 = color(0);
  color colorPoster8 = color(0);
  color colorPoster9 = color(0);
  color colorPoster10 = color(0);

  //creating all the top posters

  void display() {
    pushStyle();

    fill(colorPoster1);
    beginShape();
    vertex(36, 136);
    vertex(114, 136);
    vertex(107, 243);
    vertex(28, 243);
    endShape();

    fill(colorPoster2);
    beginShape();
    vertex(116, 136);
    vertex(194, 137);
    vertex(190, 245);
    vertex(110, 245);
    endShape();

    fill(colorPoster3);
    beginShape();
    vertex(198, 138);
    vertex(276, 138);
    vertex(274, 245);
    vertex(192, 245);
    endShape();

    fill(colorPoster4);
    beginShape();
    vertex(284, 137);
    vertex(351, 138);
    vertex(349, 230);
    vertex(281, 230);
    endShape();

    fill(colorPoster5);
    beginShape();
    vertex(366, 139);
    vertex(431, 141);
    vertex(430, 232);
    vertex(363, 231);
    endShape();

    fill(colorPoster6);
    beginShape();
    vertex(442, 141);
    vertex(509, 141);
    vertex(509, 229);
    vertex(442, 228);
    endShape();

    fill(colorPoster7);
    beginShape();
    vertex(518, 140);
    vertex(586, 141);
    vertex(587, 232);
    vertex(518, 232);
    endShape();

    fill(colorPoster8);
    beginShape();
    vertex(601, 139);
    vertex(667, 140);
    vertex(671, 232);
    vertex(603, 233);
    endShape();

    fill(colorPoster9);
    beginShape();
    vertex(670, 142);
    vertex(751, 143);
    vertex(756, 254);
    vertex(673, 254);
    endShape();

    fill(colorPoster10);
    beginShape();
    vertex(754, 143);
    vertex(837, 145);
    vertex(842, 257);
    vertex(758, 255);
    endShape();
    popStyle();
  }
}
