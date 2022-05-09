/*  
 ** Amethyst G. H. McKenzie
 *
 ** SPIKE CLASS
 *
 ** this class represents the spikes throughout level2 and level3 (functions as an enemy)
    it deals with the spike's position, appearance, and contact with the ball 
 */



class Spike {
  float x1; //first x-position of spike 
  float y1; //first y-position of spike
  float x2; //second x-position of spike
  float y2; //second y-position of spike
  float x3; //third x-position of spike
  float y3; //third y-position of spike
  color c; //colour of spike


  //sets all variables (except colour) to a value that can be inputted in the main function so that each spike can have different dimensions and positions on the screen
  Spike(float _x1, float _y1, float _x2, float _y2, float _x3, float _y3) {
    x1 = _x1; 
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
    x3 = _x3;
    y3 = _y3;
    c = color(#E8695B); //light-ish red
  }

  //displays spikes 
  void display() {
    fill(c);
    triangle(x1, y1, x2, y2, x3, y3);
  }

  //checks to see if the ball makes contact with any of the x or y coordinates of the spike, returns false if it does 
  //newX = x-position of the ball ; newY = y-position of the ball
  boolean contact(float newX, float newY) {

    if (dist(newX, newY, x1, y1) < b.size/2) {
      return false;
    } 

    if (dist(newX, newY, x2, y2) < b.size/2) {
      return false;
    }

    if (dist(newX, newY, x3, y3) < b.size/2) {
      return false;
    }

    return true;
  }
}
