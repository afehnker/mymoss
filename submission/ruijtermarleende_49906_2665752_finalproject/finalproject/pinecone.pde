class Pinecone {
  int xPosPinecone;
  int yPosPinecone;

  Pinecone(PImage image, int initPineconeX, int initPineconeY) {    //ask for image and intitial position
    pineconeImage = image;
    xPosPinecone = initPineconeX;
    yPosPinecone = initPineconeY;
  }

  void display() {
    image(pineconeImage, xPosPinecone, yPosPinecone);    //display the image at given coordinates
  }
}
