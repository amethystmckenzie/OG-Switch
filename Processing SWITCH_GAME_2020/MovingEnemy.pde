/*  
 ** Amethyst G. H. McKenzie
 *
 ** MOVING ENEMY CLASS
 *
 ** this class represents the moving enemy exhibited in level3.
    it deals with the moving enemy's position, movement, collision with the player and collision with the walls
 */


class MovingEnemy {
  float x; //x-position of moving enemy
  float y; //y-position of moving enemy
  float speed; //velocity/speed of moving enemy
  float size; //size of moving enemy 
  color c; //colour of moving enemy

  MovingEnemy() {
    x = 662; //the x-position of the moving enemy always starts at this x-coordinate
    y = 535; //the y-position of the moving enemy always starts at this y-coordinate
    size = 200; //size is set to 200 pixels and is unchanging
    speed = 4; //moving enemy speed = 4 and is unchanging
    c = color(#E8695B); //light red
  }

  //displays moving enemy with set x and y coordinates as well as size (+colour)
  void display() {
    fill(c);
    ellipse(x, y, size, size);
  }

  //allows enemy to move + switch direction when it collides with a wall
  void move() {
    x = x+1 * speed;
    if (!moveRight() || !moveLeft()) {
      speed *= -1;
    }
  }


  //checks if the right side of the enemy comes in contact with a wall, returns false if it does
  boolean moveRight() {
    for (int i = 0; i < wall[level].length; i++) {
      if (x + (size/2) > wall[level][i].x && x+(size/2) < wall[level][i].x + wall[level][i].w && y < wall[level][i].y + wall[level][i].h && y > wall[level][i].y) {
        return false;
      }
    }

    return true;
  } 

  //checks if the left side of the enemy is in contact with a wall, returns false if it does
  boolean moveLeft() {
    for (int i = 0; i < wall[level].length; i++) {
      if (x - (size/2) > wall[level][i].x && x - (size/2) < wall[level][i].x + wall[level][i].w && y < wall[level][i].y + wall[level][i].h && y > wall[level][i].y) {
        return false;
      }
    }
    return true;
  }


  //checks if the ball is in contact with the enemy, returns false if it is
  //newX = x-position of the ball ; newY = y-position of the ball
  boolean contact(float newX, float newY) {
    if (dist(newX, newY, x, y) < size/2) {
      return false;
    }
    return true;
  }
}
