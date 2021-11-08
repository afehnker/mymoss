class MenuScreen {
  int textMover = 0;

  MenuScreen() {
  }

  void display() {    //general instructions
    textSize(40);
    fill(255); //white
    String intro = "After an August Wednesday night, 07:23. There's a lecture in the morning, and you're absolutely STEAMING.";
    text(intro, mousex-100, mousey-textMover, 500, 300);    //textbox!
    String intro2 = "Luckily, the bossman of a famous döner shop will let you shave your own. Should sort things out.";
    text(intro2, mousex-100, mousey+300-textMover, 500, 300);

    String intro3 = "General instructions for the weak-willed;";
    text(intro3, mousex-100, mousey+650-textMover, 500, 300);

    String intro4 = "A. Use the mouse/WiiMote to shave off as much of the döner cone as possible. But hurry up, customers are waiting.";
    text(intro4, mousex-100, mousey+800-textMover, 600, 400);

    String intro5 = "B. Keep in mind that döner shaving is a fine art - go too fast and you might end up disappointed.";
    text(intro5, mousex-100, mousey+1075-textMover, 600, 300);

    String intro6 = "C. If using the WiiMote, hold the trigger for an extra feature.";
    text(intro6, mousex-100, mousey+1300-textMover, 600, 300);

    String intro7 = "Press 'M' to use the Mouse, or 'W' to use a WiiMote to continue the saga.";
    text(intro7, mousex-100, mousey+1500-textMover, 600, 300);
    

    textMover += 1;
    if(showMenu == false){
      textMover = 0;  //reset when menu disappears
    }
  }


  void displayInstructions() {      //The wiimote instructions
    textSize(30);
    fill(255);
    String instruction1 = "How daring! Now be good, and follow these steps:";
    text(instruction1, mousex-100, mousey, 500, 300);

    fill(0, 250, 100);
    String instruction2 = "-4. Connect a WiiMote to this computer via Bluetooth through Control Panel\\Hardware and sound\\Devices and printers.";
    text(instruction2, mousex-100, mousey+200, 900, 300);

    fill(0, 210, 140);
    String instruction3 = "-3. Set up two sources of infrared (700 nm < λ < 1 mm) light.";
    text(instruction3, mousex-100, mousey+300, 900, 300);
    
    fill(0, 200, 160);
    String instruction35 = "-2.5. Minimise the processing IDE and all other windows.";
     text(instruction35, mousex-100, mousey+350, 1100, 300);

    fill(0, 180, 180);
    String instruction4 = "-2. Open 'wii2mousev2.PIE' with GlovePIE and\n press F9, followed by Win + down.";
    text(instruction4, mousex-100, mousey+400, 900, 300);

    fill(0, 140, 210);
    String instruction5 = "-1. You should be in charge of the WiiMote now. Use it to switch context back to this sketch";
    text(instruction5, mousex-100, mousey+500, 900, 300);

    fill(0, 100, 250);
    String instruction6 = "0. Press 'w' once again when you feel ready.";
    text(instruction6, mousex-100, mousey+600, 900, 300);
  }
}
