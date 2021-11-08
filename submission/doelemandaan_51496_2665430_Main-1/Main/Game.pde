class Game {

  Basket basket1;
  Timer timer;
  Pepernoten[] pepernoten;

  int totalPepernoten = 0;

  boolean showGame = false; //boolean variable to determine if the game is shown

  Game() {
    pepernoten = new Pepernoten[100];
    basket1 = new Basket();
    timer = new Timer(1500);
    timer.start();
  }

  void update(float xMouse, float yMouse) {
    basket1.basketPos(xMouse-100, yMouse-100);
  }

  // Function to display the game
  void display() {
    if (showGame == true) {
      // Check if the timer is done
      if (timer.isDone()) {
        // populate array with a pepernoten
        pepernoten[totalPepernoten] = new Pepernoten();
        totalPepernoten++;

        if (totalPepernoten >= pepernoten.length) {
          totalPepernoten = 0;
        }
        timer.start();
      }

      //Display basket at the position of the mouse
      basket1.display();

      for (int i = 0; i < totalPepernoten; i++) {
        pepernoten[i].bottom();
        pepernoten[i].move();
        pepernoten[i].display();
        //check if the basket collides with the pepernoten.
        if (basket1.collide(pepernoten[i])) {
          pepernoten[i].caught(); // call the caught() function to remove the Pepernoten from view
        }
      }
    } else {
      showGame = false;
    }
  }
  // function to control the boolean variable showGame
  void showGame() {
    // If condition that toggles between showing the game and removing it.
    if (showGame == true) {
      showGame = false;
    } else {
      showGame = true;
    }
  }
}
