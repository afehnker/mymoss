/*
* Checks if the mouse cursor is over a mouse circle based on its coordinates and diameter.
*/
boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;

    if (sqrt(sq(disX) + sq(disY)) < diameter/2) {
        return true;
    }
    return false;
}

/*
* Checks if the mouse is over a rectangle based on its coordinates and dimensions.
*/
boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x + width && 
        mouseY >= y && mouseY <= y + height) {
            return true;
        }
    return false;
}

/*
* Checks if two circles overlap based on their positions and radii.
*/
boolean circleOverlap(float x1, float y1, float r1, float x2, float y2, float r2) {
    float distSq = (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2);
    float radSumSq = (r1 + r2) * (r1 + r2);
    if (distSq == radSumSq || distSq <= radSumSq)
        return true;
    return false;
}

/*
* Draws a text colored with a gradient rainbow.
*/
PImage gradientText(String text, int width, int height, int textImageSize) {
    int x = 0;
    PGraphics gradientMaskGraphics, textImageGraphics;
    PImage gradientMask, textImage;

    gradientMaskGraphics = createGraphics(width, height);
    gradientMaskGraphics.beginDraw();
    gradientMaskGraphics.colorMode(HSB, gradientMaskGraphics.width, 100, 100);
    gradientMaskGraphics.noStroke();
    x++;
    
    if (x > gradientMaskGraphics.width - 1) {x = 0;}
    for (int i = 0;i < gradientMaskGraphics.width; i++)   
    {
        gradientMaskGraphics.fill(i, 100, 100);
        gradientMaskGraphics.rect(i+x, 0, 1, 100);
        gradientMaskGraphics.rect(i+x-gradientMaskGraphics.width, 0, 1, 100);
        //gradientMaskGraphics.rect(i+x-(pg1.width*0), 0, 1, 100);
        gradientMaskGraphics.rect(i+x, 0, 1, 100);
    }

    gradientMaskGraphics.smooth();
    gradientMaskGraphics.endDraw();
    gradientMask = gradientMaskGraphics.get();

    textImageGraphics = createGraphics(width, height);
    textImageGraphics.beginDraw();
    textImageGraphics.textSize(textImageSize);
    textImageGraphics.text(text, 0, (int)((textImageSize * 1.5)));
    textImageGraphics.smooth();
    textImageGraphics.endDraw();

    textImage = textImageGraphics.get();
    gradientMask.mask(textImage);

    return gradientMask;
}

/*
* Creates an image with a single color.
*/
PImage colorImage(int width, int height, int r, int g, int b, int alpha) {
    PGraphics imageGraphics;

    imageGraphics = createGraphics(width, height);
    imageGraphics.beginDraw();

    imageGraphics.background(r, g, b, alpha);
    imageGraphics.endDraw();
    return imageGraphics.get();
}