//This is an enum
//It is used to distinguish between the different forms of attacks
/* 
SideNote:
The attacks are decided by the button input, and beats
They also determine what each type of bullet will look like
Each attack type relates to an arrow key, by using an enum it is more clear to the programmer which attack does what
*/
enum AttackType {
  ONESHOT, LASER, SPRAY, WAVE, CACTUS;
}
