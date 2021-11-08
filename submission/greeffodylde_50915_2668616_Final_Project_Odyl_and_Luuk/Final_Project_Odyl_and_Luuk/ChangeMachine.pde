class ChangeMachine {  

  color yellowColor, textColor;
  PImage imgA, imgB, imgC, imgD, imgE;

  ChangeMachine() {
    yellowColor = color(249, 206, 0); //Yellow for signs and machine
    textColor = color(184, 37, 0); //Red of the letters
    imgA = loadImage("imgA.png"); //50 euro cents coin
    imgB = loadImage("imgB.png"); //1 euro coin
    imgC = loadImage("imgC.png"); //2 euro coin
    imgD = loadImage("imgD.png"); //5 euro bill
    imgE = loadImage("imgE.png"); //Wallet
  }

  void display() {
    stroke(0);
    strokeWeight(6);
    fill(yellowColor);
    rect((8.5 * width / 10 + width / 100), (height - (height / 2.2)), (width / 8), (height / 2.5)); //Change machine big yellow box

    strokeWeight(1);
    fill(148, 140, 138); //Light gray
    rect((8.5 * width / 10 + width / 100), (height - (height / 1.76)), (width / 9), (height / 10), 20); //Gray rectangle which houses all the change items

    fill(108, 100, 98); //Dark gray
    rect((8.5 * width / 11 + width / 18.5), (height - (height / 1.72)), (width / 27), (height / 28.8), 9); //Small rectangle above the buttons which houses the green screen

    strokeWeight(2);
    fill(0, 200, 0); //Green
    rect((8.5 * width / 11 + width / 18.5), (height - (height / 1.72)), (width / 33), (height / 43.2), 7); //Green screen left to the coin slot

    strokeWeight(1);
    fill(107, 114, 134); //Gray for buttons
    ellipse((8.5 * width / 11 + width / 15.5), (height - (height / 1.82)), (width / 102), (height / 57.6)); //Buttons under green screen
    ellipse((8.5 * width / 11 + width / 22.5), (height - (height / 1.82)), (width / 102), (height / 57.6));

    fill(157, 164, 174); //Slightly lighter gray for inner buttons
    ellipse((8.5 * width / 11 + width / 15.5), (height - (height / 1.82)), (width / 170), (height / 96)); //Smaller circles inside the buttons
    ellipse((8.5 * width / 11 + width / 22.5), (height - (height / 1.82)), (width / 170), (height / 96));

    fill(0); //Black
    rect((8.5 * width / 10 + width / 100), (height - (height / 1.8)), (width / 330), (height / 48)); //Slots in the middle of the change machine
    rect((8.5 * width / 10 + width / 100), (height - (height / 1.7)), (width / 450), (height / 45.5));

    fill(50, 50, 50); //Almost black
    rect((8.5 * width / 10 + width / 100), (height - (height / 1.745)), (width / 80), (height / 57.6)); //Dark rectangle which houses the gray button

    fill(100, 100, 100); //Dark gray
    rect((8.5 * width / 10 + width / 85), (height - (height / 1.743)), (width / 110), (height / 72), 3); //Gray rectangle button
    rect((8.5 * width / 10 + width / 24), (height - (height / 1.72)), (width / 27), (height / 27), 2); //Screen housing to the right of the change machine slots

    fill(0); //Black
    rect((8.5 * width / 10 + width / 24), (height - (height / 1.72)), (width / 33), height / 39); //Black part of the screen on the right
    rect((8.5 * width / 10 + width / 40), (height - (height / 3)), (width / 20), (height / 15), 1); //Black box on the bottom right of the change machine

    fill(168, 169, 173); //Silver
    strokeWeight(4);
    rect((8.5 * width / 10 + width / 19), (height / 1.9), (width / 78), (height / 20), 1); //Silver button on the bottom right of the machine
    strokeWeight(2);
    ellipse((8.5 * width / 10 + width / 19), (height / 1.9), (width / 160), (height / 86));

    strokeWeight(3);
    fill(yellowColor); 
    rect((width / 10 + width / 100), (height / 16), (width / 4.75), (height / 9.6), 10); //Yellow text boxes above the windows and change machine
    rect((3.5 * width / 10 + width / 100), (height / 16), (width / 4.75), (height / 9.6), 10);
    rect((6 * width / 10 + width / 100), (height / 16), (width / 4.75), (height / 9.6), 10);
    rect((8.5 * width / 10 + width / 100), (height / 16), (width / 4.75), (height / 9.6), 10);

    rect((8.5 * width / 10 + width / 100), (height - (height / 1.25)), (width / 7), (height / 8), 3); //Rectangle for the text about change above the machine

    fill(textColor); 
    textSize(40);
    text("KROKET", (width / 10 + width / 100), (height / 17)); //Red text above the machines
    text("FRIKANDEL", (3.5 * width / 10 + width / 100), (height / 17));
    text("KAASSOUFFLE", (6 * width / 10 + width / 100), (height / 17));
    text("WISSELEN", (8.5 * width / 10 + width / 100), (height / 17)); 

    strokeWeight(0);
    textSize(35);
    text("WISSELEN:", (8.5 * width / 10 + width / 100), (height - (height / 1.19))); //Text on the top of the machine
    rect((8.5 * width / 10 + width / 100), (height - (height / 1.23)), (width / 11), (height / 375));

    textSize(30);
    text("€5,- €2,-", (8.5 * width / 10 + width / 100), (height - (height / 1.26))); //Text about the amount you can change above the machine
    text("  €1,-", (8.5 * width / 10 + width / 100), (height - (height / 1.31)));

    fill(0);
    text("Click on the snack you would like to eat, and type the word 'snack' to actually eat it!", (width / 3 - width / 200), (height * 0.96)); //Explanation in the bottom left of the display

    image(imgE, (8.5 * width / 10 + width / 100), (height - (height / 8)), 480, 350); //Wallet displayed
    image(imgA, (8.5 * width / 11 + width / 50), (height - (height / 7)), 75, 75); // 50 cents displayed
    image(imgB, (8.5 * width / 11 + width / 50), (height - (height / 16)), 75, 75); //1 euro displayed
    image(imgC, (8.5 * width / 10 + width / 20), (height - (height / 7)), 75, 75); //2 euro displayed
    image(imgD, (8.5 * width / 10 + width / 20), (height - (height / 16)), 125, 75); //5 euro displayed
  }
}
