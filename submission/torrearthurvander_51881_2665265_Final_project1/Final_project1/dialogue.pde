int textCounter=0;
class Dialogue {

 
  TextBox[] texts = new TextBox[50]; 

  Dialogue() {
    // bus dialgue
    texts[0] = new TextBox("Shit, I overslept! ", "", "");
    texts[1] = new TextBox("Of course, the bus is already long gone...", "", "");
    texts[2] = new TextBox("I've got an important tutorial today that I can't miss no matter what. Seems like", "the only way I can still make it on time is if I take the shortcut through the forest.", "");
    texts[3] = new TextBox("", "", "");
    texts[4] = new TextBox("Someone once told me that if you stare at the sun for long enough, you eventually", "go blind.", "");
    texts[5] = new TextBox("I think I still need my eyesight for now.", "", "");
    texts[6] = new TextBox("", "", "");
    texts[7] = new TextBox("Yeah, the next one comes in around an hour.", "", "");
    texts[8] = new TextBox("If I wait around for that one, my teacher will figuratively murder me.", "", "");
    texts[9] = new TextBox("", "", "");
    texts[10] = new TextBox("If I remember correctly, uni should be exactly south of this forest. I just hope", "that this path actually leads there.", "");
    texts[11] = new TextBox("Damn, this is going to be such a pain to walk...", "", "");
    texts[12] = new TextBox("Huh? What's that ahead?", "", "");
    //shop dialogue
    texts[13] = new TextBox("It looks like some sort of shop window, but why would someone put this in the", "middle of a forest where almost no one comes around?", "");
    texts[14] = new TextBox("", "", "");
    texts[15] = new TextBox("I have never seen plants like these before in my entire life, there is no way", "that they are native to the Netherlands.", "");
    texts[16] = new TextBox("No... it's more than that.", "", "");
    texts[17] = new TextBox("I can't think of a good explanation as to why I feel this way, but when I look", "at those plants in front of me, it feels as though it should not be possible for them", " to actually exist...");
    texts[18] = new TextBox("", "", "");
    texts[19] = new TextBox("It's a little bonsai with rings floating around some of it's branches.", "", "");
    texts[20] = new TextBox("When I try to touch it, it feels devistatingly cold, as if my entire body ", "screams at me to pull back my hand.", "");
    texts[21] = new TextBox("I... I should probably leave this one alone for now...", "", "");
    texts[22] = new TextBox("", "", "");
    texts[23] = new TextBox("Is this even a plant?", "", "");
    texts[24] = new TextBox("It looks like a rock, it feels like a rock, it's immobile like a rock, so according to", "logic, this should be a rock, but still...", "");
    texts[25] = new TextBox("Something tells me that this isn't a rock.", "", "");
    texts[26] = new TextBox("", "", "");
    texts[27] = new TextBox("It looks like this is a plant where someone attached banners to the end of", "each branch.", "");
    texts[28] = new TextBox("I wonder what those markings on there indicate? And how are those banners", "even attached to the plant in the first place??", "");
    texts[29] = new TextBox("They couldnt've grown out of there themselves, right?", "", "");
    texts[30] = new TextBox("", "", "");
    texts[31] = new TextBox("How can this be? Am I still in my bed, asleep?", "", "");
    texts[32] = new TextBox("This part of the shop is literally floating! I can't find any anchor points", "to the ground for the roof of this thing!", "");
    texts[33] = new TextBox("On top of that, the part behind the plants is just magically whited-out,", "despite the fact that there's no glass around this shop window!", "");
    texts[34] = new TextBox("What in the hell is going on?!", "", "");
    texts[35] = new TextBox("", "", "");
    texts[36] = new TextBox("It looks like some sort of blackboard, but I can't make out what it says on it,", "this isn't written in any kind of language I've seen before.", "");
    texts[37] = new TextBox("Who could've put this here?", "", "");
    texts[38] = new TextBox("", "", "");
    texts[39] = new TextBox("I don't know how much time I've spent here already, but I should get going.", "", "");
    texts[40] = new TextBox("If I want to get out of here, I should inspect the PATH that I took to get", "here in the first place.", "");
    texts[41] = new TextBox("", "", "");
    //end dialogue
    texts[42] = new TextBox("...", "", "");
    texts[43] = new TextBox("Despite the incident, I made it back to campus just in time before my tutorial", "actually started. Not like it mattered...", "");
    texts[44] = new TextBox("The entire day, I couldn't focus on what was going on in front of me, because", "my thoughts kept on drifting back to that mysterious shop window from the forest.", "");
    texts[45] = new TextBox("I went back there as soon as my lecture was over, but...", "", "");
    texts[46] = new TextBox("When I got there, there was nothing left anymore. Not even a trace that the shop", "had ever existed in the first place.", "");
    texts[47] = new TextBox("I haven't told anyone about what happened, because I figured that I would come", "across as crazy, and I never saw that little shop again.", "");
    texts[48] = new TextBox("", "", "");
  }

  void display() {
    texts[textCounter].display();
    texts[textCounter].reveal();
  }

  void next(char k) {
    if (k==' ' && texts[textCounter].reveal()) {

      if (textCounter<texts.length-1) {
        textCounter++;
      }
    } else if (k==' ' && !texts[textCounter].reveal()) {
      texts[textCounter].finish();
    }
  }

  void checkPrompt() {
    texts[textCounter].PromptFill();
  }

  void clicked() { //if clickArea is activated, a certain text will display
    if (ThisStory.TextSpawner[1].clickArea) {
      textCounter=4;
    }
    if (ThisStory.TextSpawner[2].clickArea || ThisStory.TextSpawner[3].clickArea) {
      textCounter=7;
    }
    if (ThisStory.TextSpawner[4].clickArea) {
      textCounter=10;
    }
    if (ThisStory.TextSpawner[5].clickArea && !ThisStory.inspectedPlants) {
      textCounter=15;
    }
    if (ThisStory.TextSpawner[6].clickArea && ThisStory.inspectedPlants) {
      textCounter=19;
    }
    if (ThisStory.TextSpawner[7].clickArea && ThisStory.inspectedPlants) {
      textCounter=23;
    }
    if (ThisStory.TextSpawner[8].clickArea && ThisStory.inspectedPlants) {
      textCounter=27;
    }
    if (ThisStory.TextSpawner[9].clickArea) {
      textCounter=31;
    }
    if (ThisStory.TextSpawner[10].clickArea) {
      textCounter=36;
    }
    if (ThisStory.TextSpawner[11].clickArea || ThisStory.TextSpawner[12].clickArea || ThisStory.TextSpawner[13].clickArea || ThisStory.TextSpawner[14].clickArea || ThisStory.TextSpawner[15].clickArea) {
      textCounter=42;
    }
  }
  
  boolean isActive() {
    return texts[textCounter].isActive();
  }
  
  void resetTextAnimation(){
      if (textCounter>0) {
      texts[textCounter-1].PromptReset(); //ensures that the reveal animation plays again when the same Textbox is activated
    }
  }
}
