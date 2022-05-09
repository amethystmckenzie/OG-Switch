/*  
 ** Amethyst G. H. McKenzie
 *
 ** TOKENS CLASS
 *
 ** this class represents the tokens present in level2 and level3
    it deals with the token's position, apperance, and ability to be collected by the player
 */


class Tokens {
  float x; //x-position of token
  float y; //y-position of token
  boolean exist; //the token can be interacted with (exists)
  int radius; //radius of token
  color c; //colour of token

  //sets x and y variables to a value that can be inputted in the main function so that the position can be changed
  Tokens(float _x, float _y) {
    x = _x;
    y = _y; 
    radius = 20; //radius = 20 pixels and is unchanging
    exist = true; //the token can be interacted with (exists!)
    c = color(#FAE232); //gold
  }

  //displays token only if it exists (can be interacted with)
  void display() {
    if (exist) {
      fill(c);
      ellipse(x, y, radius, radius);
    }
  }


  //allows player to collect token only if it exists and if the player makes contact with it
  //once token is collected, the token no longer exists and therefore cannot be interacted with
  //newX = x-position of ball ; newY = y-position of ball
  void collect(float newX, float newY) {
    if (exist) { 
      if (dist(newX, newY, x, y) < radius) {
        coinAmount += 1; //coin amount increases
        //coin.play(); //sound effect plays
        exist = false;
      }
    }
  }
}
