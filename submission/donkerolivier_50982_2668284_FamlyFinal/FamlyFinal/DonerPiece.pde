class DonerPiece {
  float xDonerPiece, yDonerPiece;
  int DonerPieceR, DonerPieceG, DonerPieceB; //for tint function to make some pieces blacker.
  PImage pieceImage1, pieceImage2;
  float vxDonerPiece, vyDonerPiece;
  float g = 0.0981; //g for gravitaional constant

  DonerPiece(float initX, float initY, float initVX, float initVY, int initR, int initG, int initB) {    //x/yShaver go into initX/Y in main
    xDonerPiece = initX;
    yDonerPiece = initY;
    vxDonerPiece = initVX;
    vyDonerPiece = initVY;
    DonerPieceR = initR;
    DonerPieceG = initG;
    DonerPieceB = initB;
    pieceImage1 = loadImage("donerpiece1.png");      //Both images from http://pngimg.com/download/63468
    pieceImage2 = loadImage("donerpiece2.png");
  }
  
  void display(){
    pushMatrix();
    translate(xDonerPiece, yDonerPiece);        //I see this could've also been done without push/popMatrix. For next time!
    tint(DonerPieceR, DonerPieceG, DonerPieceB);    //And tint!
    image(pieceImage1, 0, 0);
    noTint();
    popMatrix();
  }
  
  void changePos(){
    xDonerPiece += vxDonerPiece; //looping, so units do make sense this way after all (space + velocity * time(frame))
    yDonerPiece += vyDonerPiece;
    vyDonerPiece += g;
  }
}
