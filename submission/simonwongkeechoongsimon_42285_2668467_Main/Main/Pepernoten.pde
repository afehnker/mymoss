class Pepernoten {

  float xAxis;
  float yAxis;
  float speed;

  PImage pepernotenBag;

  // Initialise Pepernoten object
  Pepernoten() {
    xAxis = random(width); // Place Pepernoten object randomly on the x-axis
    yAxis = -1; // The Pepernoten object starts at y = -1, above the screen
    speed = random(10, 20); // Assign random speeds to each Pepernoten
    pepernotenBag = loadImage("kruidnoten-500gr.png");
    pepernotenBag.resize(180, 180);
  }

  // Move pepernoten objects along the y-axis
  void move() {
    yAxis += speed;
  }

  // function to check if the Pepernoten has reached the bottom of the page.
  void bottom() {
    if (yAxis > height ) {
      yAxis = 0 ;
    }
  }

  // Display pepernoten object
  void display() {
    imageMode(CENTER); //switch to center mode
    image(pepernotenBag, xAxis, yAxis);
    imageMode(CORNER); //changes it back
  }

  // Stop the movement of the pepernoten if the pepernoten and basket collide
  void caught() {
    speed = 0;
    yAxis = -2000; // Place the Pepernoten in a random y position so that it will not show on the screen.
  }
}
