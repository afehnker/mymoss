class StoryProgress {
  ClickArea[] TextSpawner;
  //conditions set for text display
  boolean inspectedPlants;
  boolean inspectedBonsai;
  boolean inspectedRock;
  boolean inspectedBanner;
  boolean leaveAnnounce;

  StoryProgress() {
    TextSpawner = new ClickArea[20];    
    for (int i=0; i<20; i++) {
      TextSpawner[i]= new ClickArea();
    }
  }

  void update() { //The storyProgress alters depending on the last text displayed
    if (textCounter==0) { 
      StoryProgress="intro";
    }  
    if (textCounter==1) {
      StoryProgress="bus";
    }
    if (textCounter==11) {
      StoryProgress="walking";
    }
    if (textCounter==13) {
      StoryProgress="shop";
    }
    if (textCounter==42) {
      StoryProgress="end";
    }
    if (textCounter==15) {
      inspectedPlants=true;
    }
    if (textCounter==22) {
      inspectedBonsai=true;
    }
    if (textCounter==26) {
      inspectedRock=true;
    }
    if (textCounter==30) {
      inspectedBanner=true;
    }
    if (inspectedBonsai && inspectedRock && inspectedBanner && !leaveAnnounce) {
      textCounter=39;
      leaveAnnounce=true;
    }
    if (textCounter==48) {
      exit();
    }
  }
  void explore(int mx, int my) {
    if (StoryProgress=="bus") {
      TextSpawner[1].make(mx, my, 1060, 5, 1165, 95); //sun
      TextSpawner[2].make(mx, my, 175, 428, 281, 508); //bus
      TextSpawner[3].make(mx, my, 704, 315, 1112, 694); //bus
      TextSpawner[4].make(mx, my, 456, 386, 542, 463); //path
    }
    if (StoryProgress=="shop") {
      TextSpawner[5].make(mx, my, 438, 81, 1128, 458); //first time seeing plants
      TextSpawner[6].make(mx, my, 480, 93, 608, 423); //bonsai
      TextSpawner[7].make(mx, my, 641, 149, 847, 429); //rock
      TextSpawner[8].make(mx, my, 950, 127, 1158, 423); //banner
      TextSpawner[9].make(mx, my, 457, 25, 1167, 93); //inspect top shop
      TextSpawner[10].make(mx, my, 137, 340, 357, 666); //inspect board
      TextSpawner[11].make(mx, my, 862, 848, 1400, 900); // go to end (remaining ones aswell)
      TextSpawner[12].make(mx, my, 1021, 815, 1400, 900); //
      TextSpawner[13].make(mx, my, 1091, 784, 1400, 900); //
      TextSpawner[14].make(mx, my, 1238, 760, 1400, 900); // 
      TextSpawner[15].make(mx, my, 1357, 734, 1400, 900); //
    }
  }

  void resetInteractiveText() { //ensures that game does not get stuck on one Textbox
    for (int i=0; i<20; i++) {
      TextSpawner[i].reset();
    }
  }
}
