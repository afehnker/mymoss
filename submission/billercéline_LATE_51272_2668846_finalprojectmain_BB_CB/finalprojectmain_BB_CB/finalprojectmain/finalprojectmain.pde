//Group: Brend Boer & Céline Biller
// made in Oktober 2021
//In the program you can control two dolls, they can each throw high heels
//when hit by a high heel the dolls will get mad
//you can also click the store logo for a cool battle song, click it again to restart it
//the controls are WASD (X to shoot) and ARROWKEYS (M to shoot)

import processing.sound.*; //import the sound library
SoundFile bgmSong;
String audioName = "bgm.mp3"; //sound name
boolean keyLeft, keyRight, keyUp, keyDown, keyX, keyW, keyA, keyS, keyD, keyM, keyK, Hit, Hit2;
//the following are images of the dolls, their arms and the high heels; 
PImage imgManneQuin1, imgManneQuin1Mad, imgArm1, imgManneQuin2, imgManneQuin2Mad, imgArm2, imgHeel;
ArrayList <BulletWhite> bulletsWhite = new ArrayList <BulletWhite> (); //creates arraylist
ArrayList <BulletBlue> bulletsBlue = new ArrayList <BulletBlue> (); //creates arraylist
int ammo = 100; //sets ammunition to 100
int ammo2 =100; // sets ammunition to 100
int maxammo = 100; //regulates max ammunition (high heels)
WhiteGirl AWhiteGirl; //class
WhiteGirl_Arm AWhiteGirl_Arm; //class
BlueGirl ABlueGirl; //class
BlueGirl_Arm ABlueGirl_Arm; //class
StoreFront AStoreFront; //class
StoreName AStoreName; //class

void setup() {
  size (1300, 600);
  AStoreFront = new StoreFront(0, 0); //class
  AStoreName = new StoreName(500, 40); //class
  AWhiteGirl = new WhiteGirl(200, 300);  //class
  AWhiteGirl_Arm = new WhiteGirl_Arm();//class
  ABlueGirl = new BlueGirl(1000, 200);//class
  ABlueGirl_Arm = new BlueGirl_Arm();//class
  imgManneQuin1 = loadImage ("mannequin1.png"); //loads image
  imgManneQuin1Mad = loadImage ("mannequin1angry.png");//loads image
  imgArm1 = loadImage ("arm1.png");//loads image
  imgManneQuin2 = loadImage ("mannequin2.png");//loads image
  imgManneQuin2Mad = loadImage ("mannequin2angry.png");//loads image
  imgArm2 = loadImage ("arm2.png");//loads image
  imgHeel = loadImage ("highheel.png");//loads image
  bgmSong = new SoundFile(this, "bgm.mp3"); //with the path of the sound
}
void draw() {
  background(194, 197, 204); //grey color
  AStoreFront.display(); //displays the store front
  AStoreName.display(); //displays the store name
  AWhiteGirl.countSpeed(); //counts the speed of the white girl
  AWhiteGirl.changePosition(); //changes the position of the white girl
  AWhiteGirl.display(); //displays the white girl
  AWhiteGirl_Arm.display(); //displays the arm of the white girl
  ABlueGirl.countSpeed(); //counts the speed of the blue girl
  ABlueGirl.changePosition(); //changes the position of the blue girl
  ABlueGirl.display();// displays the blue girl
  ABlueGirl_Arm.display(); //displays the arm of the blue girl
  if (keyM & ammo>0) {//shoots new bullet if there is ammo and if M is pressed
    bulletsWhite.add(new BulletWhite(AWhiteGirl.xPosWhiteGirl+30, AWhiteGirl.yPosWhiteGirl+50)); //shoots new bullet
    ammo-=50;
  } else if (ammo<maxammo) {
    ammo++;
  }
  if (keyX & ammo2>0) {//shoots new bullet if there is ammo and if x is pressed
    bulletsBlue.add(new BulletBlue(ABlueGirl.xPosBlueGirl+30, ABlueGirl.yPosBlueGirl+50)); //shoots new bullet
    ammo2-=50;
  } else if (ammo2<maxammo) {
    ammo2++;
  }
  for (int i = bulletsWhite.size()-1; i > 0; i--) { //for all bulletsWhite
    bulletsWhite.get(i).move(); //moves bullet
    bulletsWhite.get(i).display(); //displays bullet
    bulletsWhite.get(i).hitregestration(); //checks if a bullet is hit
    if (bulletsWhite.get(i).xPosBW > 1300) { //checks if bullet is to far away and removes it
      bulletsWhite.remove(i);
    }
  }
  for (int i = bulletsBlue.size()-1; i > 0; i--) {//for all bulletsBlue
    bulletsBlue.get(i).move(); //moves bullet
    bulletsBlue.get(i).display(); //displays bullet
    bulletsBlue.get(i).hitregestration(); //checks if a bullet hits

    if (bulletsBlue.get(i).xPosBB < 0) {//checks if bullet is to far away
      bulletsBlue.remove(i);
    }
  }
}
void keyPressed() { //indicates which keys are pressed
  if (keyCode == UP) {
    keyUp = true;
  }
  if (keyCode == DOWN) {
    keyDown = true;
  }
  if (keyCode == LEFT) {
    keyLeft = true;
  }
  if (keyCode == RIGHT) {
    keyRight = true;
  }
  if (key== 'w') {
    keyW = true;
  }
  if (key == 's') {
    keyS = true;
  }
  if (key =='a') {
    keyA = true;
  }
  if (key == 'd') {
    keyD = true;
  }
  if (key == 'm' || key == 'M') {
    keyM =  true;
  }
  if (key == 'x' || key == 'X') {
    keyX =  true;
  }
}
void keyReleased() { //indicates which keys are released
  //  if (key == CODED) {
  if (keyCode == UP) {
    keyUp = false;
  }
  if (keyCode == DOWN) {
    keyDown = false;
  }
  if (keyCode == LEFT) {
    keyLeft = false;
  }
  if (keyCode == RIGHT) {
    keyRight = false;
  }
  if (key== 'w') {
    keyW = false;
  }
  if (key == 's') {
    keyS = false;
  }
  if (key =='a') {
    keyA = false;
  }
  if (key == 'd') {
    keyD = false;
  }
  if (key == 'm' || key == 'M') {
    keyM =  false;
  }
  if (key == 'x' || key == 'X') {
    keyX =  false;
  }
}
void mouseClicked() { //method of the StoreName class, for activating the music
  AStoreName.mouseclick(mouseX, mouseY);
}
