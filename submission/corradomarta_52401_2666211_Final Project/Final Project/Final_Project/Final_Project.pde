/* Marta & Hana 's vintage postcard shop
 
 Final project - Programming for We Create Identity - 2021/2022
 
 Group 28
 
 Marta Corrado - s2718626
 Hana Šinković - s2671646
 
 IMAGES & SOUNDS:
 Shop - https://cdn.businessyab.com/assets/uploads/3dc6d90f5e9cd75d647cc5efa36268e2_-united-states-texas-harris-county-katy-2nd-street-5717-limited-edition-art-antiques-281-391-1993.jpg
 Girl - https://image.shutterstock.com/image-illustration/illustration-crying-woman-style-60s-600w-1361380550.jpg
 Civ - https://e.snmc.io/i/1200/s/99f5d9961c292fba0fa2ceccbc1f6718/2835974
 Glass - http://theantiquesalmanac.com/art-deco-wine-card-waldorf-.gif
 Bus - https://www.greatbigcanvas.com/view/yukon-canada-vw-bus-scene-retro-travel-poster,2184058/
 Pink Floyd - https://www.invaluable.com/auction-lot/advertising-poster-pink-floyd-pulse-promo-rock-mu-1903-c-293496d91e
 Ski - https://www.google.com/search?q=poster+vintage+cortina&tbm=isch&source=iu&ictx=1&tbs=simg:CAESiQIJlT2EW7Ewdw8a_1QELELCMpwgaOwo5CAQSFIo-sTzZAdItiyi1M_1kLpiaOCsgxGhsoasL3XbTKA60Uh9vi9AX3x2cOKOwmqnX9DWIgBTAEDAsQjq7-CBoKCggIARIEExtdqgwLEJ3twQkanAEKKQoVdmludGFnZSBhZHZlcnRpc2VtZW502qWI9gMMCgovbS8waDhteTlzCiEKDXNraSBlcXVpcG1lbnTapYj2AwwKCi9tLzBjbDl0M3AKGQoGc3VtbWl02qWI9gMLCgkvbS8wMzg4c24KGQoGcG9zdGVy2qWI9gMLCgkvbS8wMW41anEKFgoEc25vd9qliPYDCgoIL20vMDZfZG4M&fir=Eay7h4Wp7DzCvM%252CsxU-CsWarNrlXM%252C_&vet=1&usg=AI4_-kS9xebKcijc3HrmbfiOP_wXQSrj4g&sa=X&ved=2ahUKEwim-fWdpPLzAhUiiv0HHZPhAXcQ9QF6BAg3EAE&biw=960&bih=879#imgrc=Eay7h4Wp7DzCvM
 Bike - https://www.google.com/imgres?imgurl=http://static1.squarespace.com/static/539dffebe4b080549e5a5df5/5419eddae4b0982954723c9e/5e6b9bc7099e5e661b0b989e/1612716008965/Invincible-Motor-Bike-vintage-bike-poster-museum-outlets.jpg&imgrefurl=http://repoblaciones.es/notes.aspx?iid%3D64054164-vintage%2Bcycling%2Bpictures%26cid%3D3&h=720&w=945&tbnid=qP0aHylhrSU3pM&tbnh=196&tbnw=257&usg=AI4_-kQb-nGQufHOWjzSR50XmxOBfhjHQQ&vet=1&docid=34hvNQyJ5u1b2M&itg=1
 Main sign - https://i1.wp.com/vintagesigns.it/wp-content/uploads/2018/04/cropped-Marchio-Old-Style-Signs-3D-web-400.jpg?fit=400%2C169&ssl=1
 
 Pink Floyd - San Tropez - https://www.youtube.com/watch?v=VEyDNTLlRgU
 Danny Kaye & The Andrew Sisters - Civilization - https://www.youtube.com/watch?v=Cv5uuhkS4j8
 */

import processing.sound.*;
SoundFile song1;
SoundFile song2;

Bike bikePoster;
Civ civPoster;
Movie moviePoster;
Ski skiPoster;
pinkFloyd pinkFloydPoster;
Girl girlPoster;
Bus busPoster;
Glass glassPoster;

PImage Shop;
PImage Sign;
PImage signGreen;

void setup() {
  size (1920, 1080, P3D);
  imageMode(CENTER);
  frameRate(6);

  Shop = loadImage("shop.jpg");
  Sign = loadImage("sign.png");
  signGreen = loadImage("signGreen.png");

  song1 = new SoundFile(this, "s1.wav");
  song2 = new SoundFile(this, "s2.wav");

  civPoster = new Civ();
  moviePoster = new Movie();
  skiPoster = new Ski();
  pinkFloydPoster = new pinkFloyd();
  girlPoster = new Girl();
  bikePoster = new Bike();
  busPoster = new Bus();
  glassPoster = new Glass();
}

void draw() {
  image(Shop, width/2, height/2, width, height);
  image(Sign, width/2, 125, 587, 260);
  image(signGreen, width/2, 300, 387, 88);

  //lines that hold the posters
  strokeWeight(6);
  stroke(0);
  line(width/2, 0, width/2, 7);
  line(1056, 256, 1056, 245);
  line(863, 256, 863, 245);
  line (0, 500, 767, 500);
  line (1153, 500, 1920, 500);
  strokeWeight(3);

  civPoster.display(240, 230, 400, 400, 370, 370);
  pinkFloydPoster.display(1700, 240, 333, 430, 221, 221);
  moviePoster.display(200, 800, 300, 449);
  skiPoster.display(1700, 800, 301, 430);
  girlPoster.display(width/2, 870, 385, 300);
  bikePoster.display(width/2, 520, 385, 300, 341, 213, 520);
  glassPoster.display(550, 800, 330.2, 416);
  busPoster.display(1350, 800, 311, 414, 595.85, 421, 20);
}
void keyPressed() {
  if (key == 'm' || keyCode == 'M') {
    moviePoster.keyPress();
  } else  if (key == 'b' || keyCode == 'B') {
    bikePoster.keyPress();
  } else  if (key == 'n' || keyCode == 'N') {
    girlPoster.keyPress();
  } else  if (key == 'v' || keyCode == 'V') {
    skiPoster.keyPress();
  } else  if (key == 'c' || keyCode == 'C') {
    busPoster.keyPress();
  } else  if (key == 'g' || keyCode == 'G') {
    glassPoster.keyPress();
  } else  if (key == 'x' || keyCode == 'X') {
    pinkFloydPoster.keyPress();
    civPoster.keyRelease();
    song2.play();
    song1.pause();
  } else  if (key == 'y' || keyCode == 'Y') {
    civPoster.keyPress();
    song1.play();
    song2.pause();
    pinkFloydPoster.keyRelease();
  }
}

void keyReleased() {
  moviePoster.keyRelease();
  bikePoster.keyRelease();
  girlPoster.keyRelease();
  busPoster.keyRelease();
  glassPoster.keyRelease();
}
