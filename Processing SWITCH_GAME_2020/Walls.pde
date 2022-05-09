/*  
 ** Amethyst G. H. McKenzie
 *
 ** WALLS CLASS
 *
 ** this class represents the walls of the game.
    it deals with the wall's position and apperance (collision is taken care of in other classes)
 */

class Walls {
  float x; //x position of wall
  float y; //y position of wall
  float w; //width of wall
  float h; //height of wall
  color c; //colour of wall


  //sets all variables (except colour) to a value that can be inputted in the main function so that position and dimensions can be changed 
  Walls(float x_, float y_, float w_, float h_) {
    x = x_; 
    y = y_; 
    w = w_; 
    h = h_; 
    c = color(#9AF56A); //light green
  }

  //displays wall
  void display() {
    fill(c);
    rect(x, y, w, h);
  }
}
