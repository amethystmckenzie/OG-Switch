/*  
 ** Amethyst G. H. McKenzie
 *
 ** TROPHY CLASS
 *
 ** this class represents the trophy of each level.
    it deals with the trophy's position, appearance, and ability to be collected by the player
 */


class Trophy {

  float x; //x-position of trophy
  float y; //y-position of trophy
  float w; //width of trophy
  float h; //height of trophy
  color c; //color of trophy
  boolean exist; //the trophy can be interacted with 

  //sets x and y variables to a value that can be inputted in the main function so that the position can be changed
  Trophy(float _x, float _y) {
    x = _x; 
    y = _y; 
    w = 29; //the width of the trophy is always 29 pixels 
    h = 29; //the height of the trophy is always 29 pixels  
    c = color(#A0FFE8); //cyan
    exist = true; //the trophy can be interacted with (exists!)
  }

  //displays trophy with set x and y coordinates as well as width and height (+colour) ONLY if it exists
  void display() {
    if (exist) {
      fill(c);
      rect(x, y, w, h);
    }
  }

  //determines if ball is in contact with enemy. returns false if it is. ball is only in contact if the trophy exists and the proper amount of coins have been collected.
  //once the trophy is collected it no longer exists 
  //newX = x-position of the ball ; newY = y-position of the ball ; size = size of the ball
  boolean contact(float newX, float newY, int size) {

    if (exist && coinAmount == neededCoins) {
      //right side
      if (newX + (size/2) > x && newX+(size/2) < x+w && newY < y+h && newY > y) {
        exist = false;
        return false;
      }
      //left side
      if (newX - (size/2) > x && newX - (size/2) < x+w && newY < y+h && newY > y) {
        exist = false;
        return false;
      }
      //down
      if (newY - (size/2) > y && newY - (size/2) < y+h && newX < x+w && newX > x) {
        exist = false;
        return false;
      } 
      //up
      if (newY + (size/2) < y+h && newY + (size/2) > y && newX < x+w && newX > x ) {
        exist = false;
        return false;
      }
    }
    return true;
  }
}
