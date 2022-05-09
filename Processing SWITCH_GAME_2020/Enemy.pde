/*  
 ** Amethyst G. H. McKenzie
 *
 ** ENEMY CLASS
 *
 ** this class represents the still rectangular enemies scattered throughout the game. 
    it deals with the enemy's position, appearance, and contact with the player
 */


class Enemy {

  float x; //x-position of enemy
  float y; //y-position of enemy
  float w; //width of enemy
  float h; //height of enemy
  color c; //color of enemy

  //sets all variables (except colour) to a value that can be inputted in the main function so that each enemy can have different dimensions and positions on the screen
  Enemy(float _x, float _y, float _w, float _h) {
    x = _x; 
    y = _y; 
    w = _w; 
    h = _h; 
    c = color(#E8695B); //light-ish red
  }

  //displays enemy with set x and y coordinates as well as width and height (+colour)
  void display() {
    fill(c);
    rect(x, y, w, h);
  }


  //determines if ball is in contact with enemy, returns false if it does
  //newX = x-position of the ball ; newY = y-position of the ball ; size = size of the ball
  boolean contact(float newX, float newY, float size) {

    //right side
    if (newX + (size/2) > x && newX+(size/2) < x+w && newY < y+h && newY > y) {
      return false;
    }
    //left side
    if (newX - (size/2) > x && newX - (size/2) < x+w && newY < y+h && newY > y) {
      return false;
    }
    //down
    if (newY - (size/2) > y && newY - (size/2) < y+h && newX < x+w && newX > x) {
      return false;
    } 
    //up
    if (newY + (size/2) < y+h && newY + (size/2) > y && newX < x+w && newX > x ) {
      return false;
    } 

    return true;
  }
}
