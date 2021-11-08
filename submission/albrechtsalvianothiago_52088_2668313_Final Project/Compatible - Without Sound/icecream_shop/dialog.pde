class Dialog {
  boolean btnClicked;
  int selectedCone = -1;
  void coneSelector() {
    float savebtnSize = 180; // Size is width. Height is width/2.5
    float coneSize = 147; // Size is width. Height is width/0.57
    image(dialog_box, 600, 450);
    textSize(48);
    textAlign(CENTER);
    fill(0);
    text("Choose a cone:", 600, 280); 
    for (int i = 0; i < cone.length; i++) {
      image(cone[i], 400+(200*i), 450, coneSize, coneSize/0.57);
      if (selectedCone == i) { // Draw checkbox over selected cone  
        image(ui_element[0], 400+(200*i), 450);
      }
    }
    if (mouseX > 600-(savebtnSize/2) && mouseX < 600+(savebtnSize/2) && mouseY > 625-((savebtnSize/2.5)/2) && mouseY < 625+((savebtnSize/2.5)/2)) { // Triggers if mouse over the 'Done' (or save) button
      savebtnSize = 195;
      if (mousePressed) { // Makes button smaller when pressed
        savebtnSize = 160;
        btnClicked = true;
      } else if (btnClicked) { // After pressed (btnClicked == true) and released, close the dialog window.
        showDialog = false;
        btnClicked = false;
      }
    } else { // If the user presses the button but releases the mouse outside the button area, don't close dialog.
      btnClicked = false;
    }

    for (int i = 0; i < cone.length; i++) { // Check which cone (1, 2 or 3) the mouse is over, and when mousePressed, set the selectedCone value to the corresponding cone number.
      if (mouseX > (200*i)+400-(coneSize/2) && mouseX < (200*i)+400+(coneSize/2) && mouseY > 450-((coneSize/0.57)/2) && mouseY < 450+((coneSize/0.57)/2)) {
        if (mousePressed) {
          selectedCone = i;
        }
      }
    }
    if (selectedCone >= 0) { // If a cone has already been selected at the beginning, display the 'Done' button.
      image(ui_element[1], 600, 625, savebtnSize, savebtnSize/2.5);
    } else { // Else (meaning it's the first time selecting a cone), do not display the button, instead display a message
      textSize(26);
      text("You can change the cone at\nanytime by pressing [SPACEBAR].", 600, 620);
    }
  }
}
