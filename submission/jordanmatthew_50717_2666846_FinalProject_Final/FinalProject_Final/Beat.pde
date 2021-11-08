//This is the beat class, they are used to tell the user which arrow to press
//They are also used to determine the damage of eachy users attack
class Beat {
  /* SideNote: Using final is good because it means the programmer no longer has to worry about accidently changing the value in-game, it also makes the intent of the code more clear
    This is very helpful when multiple programers work on the same code like for this project
  */
  
  //These variables do not change but are useful to have as variables
  //This is because it easier to use these when coding, so I have an organized place to change them if I want
  //The programer does not have to go looking through the code to find where to change certain values
  final int size = 68;
  final int y = 680;
  final float xMinimum = 335;
  final float speed = 5;
  final AttackType AT;
  
  //This is the variable for the beats sprite, it is determined based on the beats attacktype when it is created
  final PImage sprite;
  
  //This is the only variable that will change for the beat, the x position is used to show the user when the beat should be 'hit' and determine its distance from the rythmbar
  //The distance is then used to determine damage dealt by the user/cowboy
  float x = 900;
  
  Beat (AttackType newAT) {
    AT = newAT;
    switch(AT){
      //Depending on the attack type, a different sprite is assigned
      //This is done by loading different images for each unique case
      case ONESHOT:
        sprite = loadImage("Thing_0003_beatUp.png");
        break;
      case LASER:
        sprite = loadImage("Thing_0002_beatLeft.png");
        break;
      case SPRAY:
        sprite = loadImage("Thing_0001_beatDown.png");
        break;
      case WAVE:
        sprite = loadImage("Thing_0000_beatRight.png");
        break;
      //Cactus should not ever be used on a beat, however as the PImage sprite must be given a value in every sceneraio possible, we have to have it as an option
      case CACTUS:
        sprite = loadImage("none");
        break;
      //default is used in the case that none of the above cases match, although this should not happen
      default:
        sprite = loadImage("none");
    }
  }
  
  void moveBeat(){
    //This moves the beat left across the screen by its speed
    x -= speed;
  }
  
  void drawBeat(){
    imageMode(CENTER);
    image(sprite, x, y, 68, 68);
  }
  
  public boolean isOutOfBounds() {
    return x < xMinimum;
  }
}
