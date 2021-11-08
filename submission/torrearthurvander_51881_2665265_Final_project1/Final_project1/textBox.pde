class TextBox {
  int a, b, c, d, e, f;
  boolean line1done;
  boolean line2done;
  boolean line3done;
  boolean showPrompt;
  String textline1;
  String textline2;
  String textline3;

  TextBox(String t1, String t2, String t3) {
    textline1=t1;
    textline2=t2;
    textline3=t3;
  }

  void display() {

    fill(0);
    stroke(255);
    strokeWeight(4);
    rect(100, 850, 1200, -250);
    fill(255);
    textAlign(LEFT);
    textSize(25);
    text(textline1, 150, 675);
    text(textline2, 150, 725);
    text(textline3, 150, 775);
    noStroke();
    fill(0);
  }

  boolean reveal() { 
    /*
  The text will gradually be displayed because a black box above it will shrink each frame. If spacebar is pressed, the entire text will display immediately.
     If spacebar is pressed when the entire text is visible, the next textBox will display.
     The textBox distinguishes between different situations where some lines are left empty. In such cases, the text may finish sooner to prevent pointless lingering.
     */
    rect(150+e, 680, 1140-f, -39.9);
    if (e<1100) {
      e+=15;
      f+=15;
    }
    if (e>=1100) {
      line1done=true;
    } else {
      line1done=false;
    }
    rect(150+c, 740, 1140-d, -59.9);
    if (c<1100 && line1done && textline2!="") {
      c+=15;
      d+=15;
    }
    if (c>=1100) {
      line2done=true;
    } else {
      line2done=false;
    }
    rect(150+a, 820, 1140-b, -67.9);
    if (a<1100 && line2done && textline2!="") {
      a+=15;
      b+=15;
    }
    if (a>=1100) {
      line3done=true;
    } else {
      line3done=false;
    }

    if (textline2 == "" && textline3 == "") {
      return line1done;
    } else if (textline2 != "" && textline3 == "") {
      return line2done;
    } else if (textline3 != "") {
      return line3done;
    }
    return false;
  }

  void finish() {
    if (a<1100 || c<1100 || e<1100) {
      a=1100;
      b=1100;
      c=1100;
      d=1100;
      e=1100;
      f=1100;
    }
  }

  void PromptFill() {
    if (textline1=="") {
      showPrompt=false;
    } else {
      showPrompt=true;
    }
  }

  boolean isActive() {
    return showPrompt;
  }

  void PromptReset() {
    a=0;
    b=0;
    c=0;
    d=0;
    e=0;
    f=0;
  }
}
