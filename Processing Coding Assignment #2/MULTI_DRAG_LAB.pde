/*  
 ** Amethyst G. H. McKenzie
 * 
 ** MULTI-DRAG LAB
 *
 ** intructions:
    - set row and col to any value 
    - run the program!
    - drag the boxes that appear
 *  
 ** NOV 11 2019
 */


int row = 20; //amount of boxes in row
int col = 20; //amount of boxes in column

float numCol; //variable that calculates dimensions for boxes in column
float numRow; //variable that calculatesd dimensions for boxes in row

float[] colBox; //arrray of column boxes
float[] rowBox; //array of row boxes

boolean[] yes; //if mouse is inside one of the squares
color[] scheme; // array of colours

int xSpace = 5; //spacing between col squares
int ySpace = 5; //spacing between row squares


int n; //variable that stores x and y values


void setup() {
  size(800, 800);
  stroke(255);
  strokeWeight(0.5);

  numCol = 1.0 * width/col; //calculating size of column boxes and turning it to float
  numRow = 1.0 * height/row; //calculating size of row boxes and turning it to float

  colBox = new float[col*row]; //array for x-values (column)
  rowBox = new float[col*row]; //array for y-values (row)
  yes = new boolean[col*row]; //boolean array
  scheme = new color[col*row]; //array for colours
 
  n = 0;
  
  //array filled with coordinates
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      colBox[n] = i * numCol;
      rowBox[n] = j * numRow;
      scheme[n] = color(random(100, 200), 0, random(200, 255), 230); //makes each box a random colour (that's of purple,pink,violet hue)
      n = n + 1; //increasing the index 
    }
  }
}

void draw() {
  background(0);
  //creates the boxes
  for (int n = 0; n < rowBox.length; n = n + 1) {
    fill(scheme[n]); 
    rect(colBox[n], rowBox[n], numCol-xSpace, numRow-ySpace);
  }
}

//determining if mouse is within a box, returning true if so 
void mousePressed() {
  for (int n = 0; n < rowBox.length; n = n + 1) {
    if (colBox[n] <= mouseX && colBox[n] + numCol > mouseX && rowBox[n] <= mouseY && rowBox[n] + numRow > mouseY) {
      yes[n] = true;
    } else {
      yes[n] = false;
    }
  }
}

//allowing the clicked box to be dragged
void mouseDragged() {
  
  int distanceX = mouseX-pmouseX; //distance of mouseX 
  int distanceY = mouseY-pmouseY; //distance of mouseY

  //allows box to follow mouse coordinate
  for (int n = 0; n < rowBox.length; n = n + 1) {
    if (yes[n]) {
      colBox[n] = colBox[n] + distanceX;
      rowBox[n] = rowBox[n] + distanceY;
    }
  }
}
