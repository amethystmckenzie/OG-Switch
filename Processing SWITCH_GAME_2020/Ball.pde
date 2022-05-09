/*  
 ** Amethyst G. H. McKenzie
 *
 ** BALL CLASS
 *
 ** this class represents the player and all the functions the player can do. 
    it deals with the player's movement, gravity, appearance, and collision between walls. 
 */


class Ball {
  float x; //x-position of ball
  float y; //y-position of ball
  float vX; //x-velocity of ball
  float vY; //y-velocity of ball
  int size; //size of ball
  float gravity; //gravity over ball
  boolean inGravity; //if gravity is in effect 
  color c; //colour of ball

  Ball() {
    x = 133; //the x-position of the ball always starts at this x-coordinate (unless changed in main program)
    y = 614; //the y-position of the ball always starts at this y-coordinate (unless changed in main program)
    size = 30; //size of ball is 30 pixels
    vX = 300; //x-velocity = 200 (is unchanging)
    vY = 300; //y-velocity = 200 (is unchanging)
    gravity = 400; //gravity = 400 (is unchanging)
    c = color(#46B0F0); //light blue
  }


  //displays ball with set x and y coordinates as well as size (+colour)
  void display() {
    noStroke();
    fill(c); 
    ellipse(x, y, size, size);
  }

  //if the right side of the ball is in contact with a wall, function returns false
  boolean moveRight() {
    for (int i = 0; i < wall[level].length; i++) {
      if (x + (size/2) > wall[level][i].x && x+(size/2) < wall[level][i].x + wall[level][i].w && y < wall[level][i].y + wall[level][i].h && y > wall[level][i].y) {
        return false;
      }
    }

    return true;
  } 

  //if the left side of the ball is in contact with a wall, function returns false
  boolean moveLeft() {
    for (int i = 0; i < wall[level].length; i++) {
      if (x - (size/2) > wall[level][i].x && x - (size/2) < wall[level][i].x + wall[level][i].w && y < wall[level][i].y + wall[level][i].h && y > wall[level][i].y) {
        return false;
      }
    }
    return true;
  }

  //if the bottom side of the ball is in contact with a wall, function returns false
  boolean moveDown() {
    for (int i = 0; i < wall[level].length; i++) {
      if (y - (size/2) > wall[level][i].y && y - (size/2) < wall[level][i].y + wall[level][i].h && x < wall[level][i].x + wall[level][i].w && x > wall[level][i].x) {
        y = y + 1; //offsets y position so that ball doesn't continue going down
        inGravity = false; //gravity is not in effect
        return false;
      }
    }
    return true;
  } 

  //if the top side of the ball is in contact with a wall, function returns false
  boolean moveUp() {
    for (int i = 0; i < wall[level].length; i++) {
      if (y + (size/2) < wall[level][i].y + wall[level][i].h && y + (size/2) > wall[level][i].y && x < wall[level][i].x + wall[level][i].w && x > wall[level][i].x) {
        y = y - 1; //offsets y position so that ball doesn't continue going up
        inGravity = false; //gravity is not in effect
        return false;
      }
    }
    return true;
  }  


  //returns true if right arrow key is pressed
  boolean forward() {
    return keyCode == 39; //key code for right arrow key
  }

  //returns true if left arrow pressed
  boolean backward() {
    return keyCode == 37; //key code for left arrow key
  }


  //allows ball to move left and right 
  void move(float elapsed) {
    if (forward() && moveRight()) { //if moving forward and if able to move right, allow to move right
      x = x + (vX*elapsed); // x + speed (in seconds)
      if (moveUp() || moveDown()) { //if not in contact with either top or bottom of screen, allow gravity to be in effect
        inGravity = true; //allows gravity to be in effect
      }
    } else if (backward() && moveLeft()) { //if moving backward and able to move left
      x = x - (vX*elapsed); // x - speed (in seconds)
    }
  }

  //alows gravity to switch
  void switch_() {
    gravity *= -1; //multiply gravity by -1 to change the y-velocity sign (and therefore y-direction)
    inGravity = true; //allows gravity to be in effect
  }

  //gravity that is constantly affecting the ball
  //elapsed = conversion from frames to seconds (so gravity affects the ball in seconds)
  void gravity(float elapsed) {
    if (!moveUp() || !moveDown()) { //if the top or bottom of the ball is touching a wall, set y-velocity to 0 (stop moving)
      vY = 0;
    }

    if (moveUp() || moveDown()) { //if the top or bottom of the ball is not touching a wall set gravity to be in effect
      inGravity = true;
    } 

    //if gravity is on, allow gravity to be applied
    if (inGravity == true) {
      vY = vY + (gravity*elapsed); //y-velocity + gravity (in seconds)
      y = y + (vY*elapsed); // y + y-velocity (in seconds)
    }
  }
}
