/*  
 ** Amethyst G. H. McKenzie
 *
 ** BALL COLOUR CLASS
 *
 ** this class represents the different colours the player can choose from to change their ball colour.
    it deals with the position and appearance of the selection of colours the player can choose from and the ability to change the ball's colour
 */


class ballColour {
  float x; //x-position of ball colour selection
  float y; //y-position of ball colour selection
  int radius; //radius of ball colour selection
  color c; //colour of ball colour selection 

  //sets all variables (except radius) to a value that can be inputted in the main function so that position and colour can be changed
  ballColour(float _x, float _y, color _c) {
    x = _x;
    y = _y;
    c = _c;
    radius = 100; //radius is always 100 pixels 
  }

  //displays ball colour selection with specfic colour and x/y positions 
  void display() {
    fill(c);
    ellipse(x, y, radius, radius);
  }

  //determines if the mouse is in contact with one of the ball colour selections, returns false if it is
  boolean contact() {
    if (mouseX >= x-(radius/2) && mouseX <= x+(radius/2) && mouseY >= y - (radius/2) && mouseY <= y + (radius/2)) {
      //colourSelect.play(); //colour is selected sound effect
      return false;
    }
    return true;
  }

  //changes the colour of the ball if the mouse is in contact with a ball colour selection
  //newBallColour = the colour that coordinates with the selection made by the player
  void changeColour(color newBallColour) {
    if (!contact()) {
      b.c = newBallColour;
    }
  }
}
