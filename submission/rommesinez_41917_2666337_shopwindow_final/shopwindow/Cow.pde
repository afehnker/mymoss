class Cow {
  int cowX, cowY;  
  float spotX = (random(cowX-100, cowX+100));
  float spotY = (random(cowY-55, cowY+55));

  Cow(int initX, int initY) {         
    cowX = initX;
    cowY = initY;
  } 

  void display() {
    //cow
    fill(255, 204, 229);
    ellipse(cowX-290, cowY-160, 80, 80);                                                  //nose

    fill (255, 255, 255);
    noStroke();
    rect(cowX, cowY, 400, 220, 80, 80, 80, 80);                                          //torso

    quad(cowX-200, cowY+40, cowX-120, cowY+80, cowX-140, cowY+260, cowX-180, cowY+260);     //front leg
    quad(cowX+100, cowY+80, cowX+180, cowY+80, cowX+180, cowY+260, cowX+140, cowY+260);      //behind leg
    quad(cowX-140, cowY-200, cowX-200, cowY-200, cowX-200, cowY-50, cowX-60, cowY+30);    //neck

    ellipse(cowX-200, cowY-200, 120, 120);                                                 //head
    quad(cowX-300, cowY-200, cowX-200, cowY-260, cowX-200, cowY-140, cowX-290, cowY-120);

    fill(0, 0, 0);
    ellipse(cowX-200, cowY-200, 18, 18);                                                    //eye
  }
}

/* 
 rect(cowX, cowY, 200, 110, 40, 40, 40, 40);                                          //torso
 
 quad(cowX-100, cowY+20, cowX-60, cowY+40, cowX-70, cowY+130, cowX-90, cowY+130);     //front leg
 quad(cowX+50, cowY+40, cowX+90, cowY+40, cowX+90, cowY+130, cowX+70, cowY+130);      //behind leg
 quad(cowX-70, cowY-100, cowX-100, cowY-100, cowX-100, cowY-25, cowX-30, cowY+15);    //neck
 
 ellipse(cowX-100, cowY-100, 60, 60);                                                 //head
 quad(cowX-150, cowY-100, cowX-100, cowY-130, cowX-100, cowY-70, cowX-145, cowY-60);
 
 fill(0, 0, 0);
 ellipse(cowX-100, cowY-100, 9, 9);                                                    //eye
 */
