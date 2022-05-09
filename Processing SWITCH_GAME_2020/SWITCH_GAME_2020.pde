/*  
 ** Amethyst G. H. McKenzie
 *
 ** SWITCH GAME
 *
 ** instructions:
 - you're at the home page!
   - click controls to see the controls or click options to see the options page!
   - if you're on the options page, click any circle to change your ball colour
   - for both controls and option pages, press 'B' to begin or press '0' to go back to menu
   - press 'c' to show the credits page (can only access this on home, controls, or options screen -- the menu)
 - home page: press 'B' to start playing. 
   - once in the game, press your right arrow to move forward or press your left arrow to move backward.
   - switch gravity by pressing the space bar
   - avoid red objects! (they are enemies)
   - if you hit an enemy you will die (have to restart the level you are on)
   - if you die more than 50 times (there is a counter!) you will have to restart from the beginning, no matter which level you're on
   - your goal is to reach the cyan square--the trophy! once you reach the trophy in all 3 levels you win!
 - enjoy playing++
 *  
 ** FEB 11 2020
 */




Ball b; //represents the player in the game
Walls wall[][]; //represents the walls of each level
Enemy enemy[][]; //represents the non-moving rectangular enemies of each level
MovingEnemy moving_enemy[][]; //represents the moving enemy on the last level
Spike spike[][]; //represents the spikes of each level
Trophy trophy[][]; //represents the trophy of each level
Tokens token[][]; //represents the tokens of each level
ballColour ballColour[]; //represents the colour of the ball


// IMAGES //
PImage titleScreen; //title screen 
PImage controls; //controls screen
PImage winScreen; //win screen 
PImage gameover; //gameover screen 
PImage pause; //pause screen 
PImage options; //options screen 
PImage credits; //credits screen
PImage hover_control_text; //hovering text (for controls) image
PImage hover_options_text; //hovering text (for options) image

// BALL COLOURS //
color c1 = #46B0F0; //light blue
color c2 = #EC6E57; //light red
color c3 = #EF93C3; //pink
color c4 = #A662C5; //purple
color c5 = #F09937; //orange
color c6 = #E140DB; //magenta
color c7 = color(random(255), random(255), random(255)); //randomly generated colour
color c8 = #FEFF00; //bright yellow
color c9 = #D2FF54; //bright green
color c10 = #FF3944; //dark rose 
color c11 = 0; //black

color[] colours = {c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11}; //puts pre-destined colours into an array and lines each colour up with the appropiate ball selection 

// GLOBAL VARIABLES //
int ptime = 0; //previous time
int coinAmount; //amount of coins collected
int deathCount; //amount of deaths
int neededCoins; //how many tokens are required to be collected in order for the player to collect the trophy

int screen = 0; //which screen the user is on
int level = 0; //which level the user is on


// SOUNDS // + sources
//import processing.sound.*; //allows sounds to be played within program
//SoundFile background_music; //https://freesound.org/people/jammerboy70/sounds/398640/ 
//SoundFile coin; //https://freesound.org/people/bradwesson/sounds/135936/ 
//SoundFile levelComplete; //https://freesound.org/people/GameAudio/sounds/220184/
//SoundFile levelComplete2; //https://freesound.org/people/Mativve/sounds/391539/
//SoundFile start; //https://freesound.org/people/broumbroum/sounds/50565/ 
//SoundFile lose; //https://freesound.org/people/GameAudio/sounds/220203/ 
//SoundFile win; //https://freesound.org/people/LittleRobotSoundFactory/sounds/270528/
//SoundFile menuSelect; //https://freesound.org/people/broumbroum/sounds/50561/ 
//SoundFile menuGoBack; //https://freesound.org/people/broumbroum/sounds/50557/ 
//SoundFile pauseSound; //https://freesound.org/people/Fupicat/sounds/471937/
//SoundFile colourSelect; //https://freesound.org/people/pumodi/sounds/150222/

//intialisation of the game (all the sounds, images, level designs, enemies, and the player itself)
void setup() {
  size(1200, 738); 
  b = new Ball(); //creates player
  wall = new Walls[3][29]; //creates array of walls
  enemy = new Enemy[3][17]; //creates array of enemies for 
  trophy = new Trophy[3][3]; //creates array of trophies
  token = new Tokens[3][18]; //creates array of tokens
  spike = new Spike[3][47]; //creates array of spikes
  moving_enemy = new MovingEnemy[3][1]; //creates the moving enemy only for one level 
  ballColour = new ballColour[11]; //creates array of ball colours

  //loads pictures into variables
  titleScreen = loadImage("titlepage.png"); 
  controls = loadImage("controls2.jpg"); 
  winScreen = loadImage("winScreen.jpg");
  pause = loadImage("pause.jpg");
  gameover = loadImage("gameover.jpg");
  options = loadImage("options.jpg");
  credits = loadImage("credits.jpg");
  hover_control_text = loadImage("control_hover_text.png");
  hover_options_text = loadImage("options_hover_text.png");

  //loads sounds into variables
  //background_music = new SoundFile(this, "background_music.mp3"); //background music
  //start = new SoundFile(this, "start.mp3"); //starting the game
  //coin = new SoundFile(this, "coin.mp3"); //coin is collected
  //levelComplete = new SoundFile(this, "win2.mp3"); //level is completed 
  //levelComplete2 = new SoundFile(this, "win1.mp3"); //level is completed
  //win = new SoundFile(this, "completeWin.mp3"); //winning the game
  //lose = new SoundFile(this, "death.mp3"); //dying
  //menuSelect = new SoundFile(this, "select.mp3"); //selecting something on the menu screen
  //menuGoBack =  new SoundFile(this, "back.mp3"); //going back to the menu
  //pauseSound = new SoundFile(this, "pause.mp3"); //pausing the game
  //colourSelect = new SoundFile(this, "ballSelect.mp3"); //selecting a ball colour
  //background_music.loop(); //loops background music

  //variety of ball colours player can choose from (aligns with array of colours that actually changes the ball's colour)
  //so, if player clicks on a coloured ball it changes the player's colour respectively
  ballColour[0] = new ballColour(159, 305, #46B0F0);
  ballColour[1] = new ballColour(318, 305, #EC6E57);
  ballColour[2] = new ballColour(454, 305, #EF93C3);
  ballColour[3] = new ballColour(595, 305, #A662C5);
  ballColour[4] = new ballColour(733, 305, #F09937);
  ballColour[5] = new ballColour(885, 305, #E140DB);
  ballColour[6] = new ballColour(1034, 305, 255);
  ballColour[7] = new ballColour(399, 474, #FEFF00);
  ballColour[8] = new ballColour(536, 474, #D2FF54);
  ballColour[9] = new ballColour(677, 474, #FF3944);
  ballColour[10] = new ballColour(815, 474, 0);

  //initialises arrays for level 1 (how many components are in each array)
  wall[0] = new Walls[9];
  enemy[0] = new Enemy[3];
  spike[0] = new Spike[0]; 
  trophy[0] = new Trophy[1];
  token[0] = new Tokens[0];
  moving_enemy[0] = new MovingEnemy[0];

  //initialises arrays for level 2
  wall[1] = new Walls[10];
  enemy[1] = new Enemy[5];
  spike[1] = new Spike[36];
  trophy[1] = new Trophy[1];
  token[1] = new Tokens[11];
  moving_enemy[1] = new MovingEnemy[0];

  //initialises arrays for level 3
  wall[2] = new Walls[10];
  enemy[2] = new Enemy[9];
  spike[2] = new Spike[11];
  trophy[2] = new Trophy[1];
  token[2] = new Tokens[7];
  moving_enemy[2] = new MovingEnemy[1];


  // LEVEL ONE //

  //walls of level1 with specific positions and dimensions
  wall[0][0] = new Walls(325, 230, 118, 400);
  wall[0][1] = new Walls(325, 98, 118, 43);
  wall[0][2] = new Walls(597, 98, 118, 399);
  wall[0][3] = new Walls(900, 98, 118, 121);
  wall[0][4] = new Walls(900, 494, 118, 136);
  wall[0][5] = new Walls(41, 47, 48, 634);
  wall[0][6] = new Walls(41, 47, 1112, 51);
  wall[0][7] = new Walls(1106, 47, 47, 634);
  wall[0][8] = new Walls(89, 630, 1018, 51);

  //enemies of level1 with specific positions and dimensions
  enemy[0][0] = new Enemy(207, 600, 118, 29);
  enemy[0][1] = new Enemy(568, 241, 29, 120);
  enemy[0][2] = new Enemy(726, 600, 118, 29);

  //trophy of level1 with a specific position (dimensions are specified in class and remain the same)
  trophy[0][0] = new Trophy(943, 463);


  //LEVEL TWO //

  //walls of level2 with specific changing positions and dimensions
  wall[1][0] = new Walls(50, 42, 52, 651);
  wall[1][1] = new Walls(50, 42, 1093, 56);
  wall[1][2] = new Walls(50, 636, 1093, 57);
  wall[1][3] = new Walls(1089, 42, 55, 650);
  wall[1][4] = new Walls(102, 456, 405, 50);
  wall[1][5] = new Walls(102, 335, 405, 50);
  wall[1][6] = new Walls(102, 211, 405, 50);
  wall[1][7] = new Walls(685, 211, 405, 50);
  wall[1][8] = new Walls(685, 328, 405, 50);
  wall[1][9] = new Walls(685, 456, 405, 50);

  //enemies of level2 with specific changing positions and dimensions
  enemy[1][0] = new Enemy(110, 260, 135, 14);
  enemy[1][1] = new Enemy(123, 99, 111, 14);
  enemy[1][2] = new Enemy(475, 99, 241, 14);
  enemy[1][3] = new Enemy(835, 99, 246, 14);
  enemy[1][4] = new Enemy(947, 260, 135, 14);

  //spikes of level2 with specific changing positions and dimensions (there's a lot of them!)
  spike[1][0] = new Spike(303, 635, 315, 608, 328, 635);
  spike[1][1] = new Spike(328, 635, 341, 608, 353, 635);
  spike[1][2] = new Spike(353, 635, 367, 608, 380, 635);
  spike[1][3] = new Spike(412, 385, 425, 408, 437, 385);
  spike[1][4] = new Spike(437, 385, 450, 408, 463, 385);
  spike[1][5] = new Spike(464, 385, 477, 408, 490, 385);
  spike[1][6] = new Spike(112, 385, 124, 408, 137, 385);
  spike[1][7] = new Spike(138, 385, 150, 408, 163, 385);
  spike[1][8] = new Spike(164, 385, 177, 408, 190, 385);
  spike[1][9] = new Spike(191, 385, 203, 408, 216, 385);
  spike[1][10] = new Spike(217, 385, 229, 408, 242, 385);
  spike[1][11] = new Spike(243, 385, 256, 408, 269, 385);
  spike[1][12] = new Spike(211, 211, 223, 183, 236, 211);
  spike[1][13] = new Spike(237, 211, 249, 183, 261, 211);
  spike[1][14] = new Spike(262, 211, 275, 183, 288, 211);
  spike[1][15] = new Spike(700, 378, 713, 400, 726, 378);
  spike[1][16] = new Spike(727, 378, 740, 400, 753, 378);
  spike[1][17] = new Spike(754, 378, 766, 400, 779, 378);
  spike[1][18] = new Spike(893, 378, 906, 400, 919, 378);
  spike[1][19] = new Spike(920, 378, 932, 400, 945, 378);
  spike[1][20] = new Spike(946, 378, 959, 400, 972, 378);
  spike[1][21] = new Spike(973, 378, 985, 400, 997, 378);
  spike[1][22] = new Spike(998, 378, 1012, 400, 1025, 378);
  spike[1][23] = new Spike(1026, 378, 1038, 400, 1050, 378);
  spike[1][24] = new Spike(767, 636, 780, 608, 793, 636);
  spike[1][25] = new Spike(794, 636, 806, 608, 818, 636);
  spike[1][26] = new Spike(819, 636, 833, 608, 845, 636);
  spike[1][27] = new Spike(853, 636, 868, 587, 880, 636);
  spike[1][28] = new Spike(880, 636, 893, 587, 906, 636);
  spike[1][29] = new Spike(908, 636, 920, 587, 933, 636);
  spike[1][30] = new Spike(933, 636, 945, 560, 958, 636);
  spike[1][31] = new Spike(958, 636, 971, 560, 984, 636);
  spike[1][32] = new Spike(985, 636, 998, 560, 1011, 636);
  spike[1][33] = new Spike(1011, 636, 1024, 587, 1037, 636);
  spike[1][34] = new Spike(1037, 636, 1048, 587, 1062, 636);
  spike[1][35] = new Spike(1063, 636, 1076, 587, 1089, 636);

  //tokens of level2 with specific positions (dimensions are specified in class and remain the same)
  token[1][0] = new Tokens(134, 527);
  token[1][1] = new Tokens(380, 551);
  token[1][2] = new Tokens(796, 551);
  token[1][3] = new Tokens(1052, 528);
  token[1][4] = new Tokens(875, 425);
  token[1][5] = new Tokens(320, 425);
  token[1][6] = new Tokens(320, 295);
  token[1][7] = new Tokens(868, 295);
  token[1][8] = new Tokens(600, 154);
  token[1][9] = new Tokens(380, 183);
  token[1][10] = new Tokens(796, 183);

  //trophy of level2 with specific position (dimensions are specified in class and remain the same)
  trophy[1][0] = new Trophy(160, 180);


  // LEVEL THREE //

  //walls of level3 with specific changing positions and dimensions
  wall[2][0] = new Walls(39, 47, 1118, 55);
  wall[2][1] = new Walls(39, 47, 50, 643);
  wall[2][2] = new Walls(39, 636, 1070, 54);
  wall[2][3] = new Walls(1109, 50, 50, 640);
  wall[2][4] = new Walls(89, 489, 124, 75);
  wall[2][5] = new Walls(134, 354, 122, 71);
  wall[2][6] = new Walls(256, 302, 65, 334);
  wall[2][7] = new Walls(994, 506, 115, 73);
  wall[2][8] = new Walls(994, 353, 115, 73);
  wall[2][9] = new Walls(89, 195, 941, 38);

  //enemies of level3 with specific changing positions and dimensions
  enemy[2][0] = new Enemy(147, 425, 62, 14);
  enemy[2][1] = new Enemy(102, 102, 63, 15);
  enemy[2][2] = new Enemy(210, 180, 63, 15);
  enemy[2][3] = new Enemy(345, 102, 63, 15);
  enemy[2][4] = new Enemy(567, 102, 63, 15);
  enemy[2][5] = new Enemy(650, 179, 63, 16);
  enemy[2][6] = new Enemy(775, 102, 63, 15);
  enemy[2][7] = new Enemy(876, 179, 63, 16);
  enemy[2][8] = new Enemy(353, 233, 600, 14);

  //spikes of level3 with specific changing positions and dimensions
  spike[2][0] = new Spike(159, 564, 171, 588, 183, 564);
  spike[2][1] = new Spike(184, 564, 197, 588, 209, 564);
  spike[2][2] = new Spike(115, 233, 133, 294, 151, 233);
  spike[2][3] = new Spike(151, 233, 169, 294, 188, 233);
  spike[2][4] = new Spike(189, 233, 207, 294, 226, 233);
  spike[2][5] = new Spike(999, 103, 1017, 144, 1034, 103);
  spike[2][6] = new Spike(1035, 103, 1053, 144, 1071, 103);
  spike[2][7] = new Spike(1073, 103, 1091, 144, 1109, 103);
  spike[2][8] = new Spike(435, 195, 454, 142, 472, 195);
  spike[2][9] = new Spike(473, 195, 492, 142, 510, 195);
  spike[2][10] = new Spike(510, 195, 527, 142, 546, 195);

  //tokens of level3 with specific positions (dimensions are specified in class and remain the same)
  token[2][0] = new Tokens(286, 278);
  token[2][1] = new Tokens(375, 604);
  token[2][2] = new Tokens(677, 367);
  token[2][3] = new Tokens(1054, 607);
  token[2][4] = new Tokens(1055, 467);
  token[2][5] = new Tokens(809, 167);
  token[2][6] = new Tokens(373, 167);

  //trophy of level3 with specific position (dimensions are specified in class and remain the same)
  trophy[2][0] = new Trophy(119, 165);

  //the moving enemy / 'final boss' of level3 given a specific position (dimension is specified in class and does not change)
  moving_enemy[2][0] = new MovingEnemy();
}


void draw() {
  int time = millis(); //turns time into milliseconds
  float elapsed = (time - ptime)/1000.0; //conversion of current seconds
  ptime = time; //sets up the conversion for the next second

  //allows home screen to show up first
  if (screen == 0) {
    home();
    title();
  } else if (screen == 2) { //displays control screen
    controls();
  } else if (screen == 1) { //displays game screen
    game(elapsed);
  } else if (screen == 3) { //displays pause screen
    pause();
  } else if (screen == 4) { //displays win screen
    win();
  } else if (screen == 5) { //displays gameover screen
    gameover();
  } else if (screen == 6) { //displays options screen
    options();
  } else if (screen == 7) { //displays credits screen
    credits();
  }

  //hovering text effect for controls and options 
  if (screen == 0) {
    if (mouseX >= 459 && mouseX <= 736 && mouseY >= 421 && mouseY <= 463) {
      imageMode(CENTER);
      image(hover_control_text, 598, 440);
    }

    if (mouseX >= 493 && mouseX <= 710 && mouseY >= 493 && mouseY <= 531) {
      imageMode(CENTER);
      image(hover_options_text, 598, 510);
    }
  }
}


//home screen
void home() {
  text("random text to stop lag in game", 0, 0); //loading the text for my deathcount lagged out my game too much, causing my ball to disappear. I put this line so all text was loaded in the beginning to cut out lag when the user starts the game.
  imageMode(CENTER);
  image(titleScreen, width/2, height/2); //title screen centered
}


//displays game with its functions
//elapsed = conversion from frames to seconds (everything runs in seconds rather than frames)
void game(float elapsed) { 

  background(255); 

  displayAll(); //displays the game

  if (keyPressed) { //the ball can move if the respective arrow keys are pressed down
    b.move(elapsed);
  }

  b.gravity(elapsed); //puts gravity as a constant force over the ball (in seconds rather than frames)

  enemy(); //all enemy functions

  toWin();  //all trophy and token functions

  deathCount();  //death counter + gameover
}


//displays the entire game + enables the functions of the tokens and moving enemy
void displayAll() {

  //displays walls for each level respectively
  for (int i = 0; i < wall[level].length; i++) {
    wall[level][i].display();
  }

  //displays enemies for each level respectively
  for (int i = 0; i < enemy[level].length; i++) {
    enemy[level][i].display();
  }

  //displays spikes for each level respectively
  for (int i = 0; i < spike[level].length; i++) {
    spike[level][i].display();
  }

  //displays tokens for each level respectively and allows them to be collected by the player
  for (int i = 0; i < token[level].length; i++) {
    token[level][i].display();
    token[level][i].collect(b.x, b.y);
  }

  b.display(); //displays ball

  for (int i = 0; i < trophy[level].length; i++) {
    trophy[level][i].display(); //displays trophy for each level respectively
  }

  for (int i = 0; i < moving_enemy[level].length; i++) {
    moving_enemy[level][i].display(); //displays moving enemy
    moving_enemy[level][i].move(); //allows enemy to move and collide with walls
  }
}


//determines if player makes contact with any of the enemies and if so, the player dies
void enemy() {

  boolean yesEnemy = false; //initially player is not in contact with any enemies
  for (int i = 0; i < enemy[level].length; i++) {
    if (!enemy[level][i].contact(b.x, b.y, b.size)) { //determines if ball is in contact with an enemy
      yesEnemy = true; //ball is in contact with an enemy if it well..hits an enemy
    }
  }

  for (int i = 0; i < spike[level].length; i++) {
    if (!spike[level][i].contact(b.x, b.y)) { //determines if ball is in contact with a spike
      yesEnemy = true; //ball is in contact with an enemy if it hits a spike
    }
  }


  for (int i = 0; i < moving_enemy[level].length; i++) {
    if (!moving_enemy[level][i].contact(b.x, b.y)) { //determines if ball is in contact with the moving enemy
      yesEnemy = true; //ball is in contact with an enemy if it hits the moving enemy
    }
  }


  //when player makes contact with an enemy these effects will take place:
  if (yesEnemy) { 
    //lose.play(); //die sound effect 
    b.x = 133; //reset x position of ball
    b.y = 614; //reset y position of ball
    coinAmount = 0; //reset amount of coins collected
    deathCount += 1; //increase amount of deaths 
    for (int i = 0; i < token[level].length; i++) {
      token[level][i].exist = true; //make tokens visible and able to be collected again
    }
  }
}

//determines if player makes contact with the trophy and fulfills the token requirements on each level, and sends them on to the next level (or win the game entirely) if they do
void toWin() {

  neededCoins = 0; //amount of coins needed to be collected to pass the first level
  for (int i = 0; i < trophy[0].length; i++) {
    if (!trophy[0][i].contact(b.x, b.y, b.size) && coinAmount == neededCoins) { //if ball makes contact with the trophy of level1 and required amount of coins for level1 is achieved:
      //levelComplete.play(); //play sound effect
      //levelComplete2.play(); //play sound effect 
      b.x = 600; //set x position of ball to 600 (for the next level)
      b.y = 500; //set y position of ball to 500 (for the next level)
      trophy[0][i].exist = false; //no longer allow trophy just collected to exist (to disable the player from collecting it in other levels)
      trophy[2][i].exist = false; //the trophy on the last level no longer exists (to disable the player from collecting it in the second level specfically)
      level = 1; //go to the next level (level2)
    }
  }


  neededCoins = 11; //amount of coins needed to be collected to pass the second level
  for (int i = 0; i < trophy[1].length; i++) {
    if (!trophy[1][i].contact(b.x, b.y, b.size) && coinAmount == neededCoins) { //if ball makes contact with the trophy of level2 and required amount of coins for level2 is achieved:
      //levelComplete.play(); //play sound effect 
      //levelComplete2.play(); //play sound effect 
      b.x = 133; //set x position of ball to 133 (for next level)
      b.y = 614; //set y position of ball to 614 (for next level)
      coinAmount = 0; //reset coin amount 
      trophy[1][i].exist = false; //no longer allow trophy that was just collected to exist (to disable the player from collecting it in other levels)
      trophy[2][i].exist = true;
      level = 2; //go on to next level (level3)
    }
  }

  neededCoins = 7; //amount of coins needed to be collected to pass the third level
  for (int i = 0; i < trophy[2].length; i++) {
    if (!trophy[2][i].contact(b.x, b.y, b.size) && coinAmount == neededCoins) { //if ball makes contact with the trophy of level3 and required amount of coins for level3 is achieved:
      //levelComplete.play(); //play sound effect
      //levelComplete2.play(); //play sound effect
      //win.play(); //victory sound effect

      coinAmount = 0; //reset coin amount
      screen = 4; //win screen (you win the game!)
    }
  }
}


//deals with death count that's displayed on the screen and ability for player to get a gameover
void deathCount() {
  if (deathCount > 50) { //if player dies more than 50 times: gameover
    screen = 5;
  }

  textAlign(CENTER);
  fill(0);
  text("DEATH COUNT: "+deathCount, 1074, 32); //prints death count on screen
}


//deals with all the key presses within the program
void keyPressed() {
  //only in game if the spacebar is pressed the gravity of the ball is switched
  if (screen == 1) {
    if (keyCode == 32) {
      b.switch_();
    }
  }

  //if 'b' is pressed and the screen isn't on 1, 4 or 5, start the game
  //player shouldn't be able to start the game on the gameover screen, win screen, or current game screen
  if (screen != 1 && screen != 4 && screen != 5) {
    if (key == 'b' || key == 'B') {
      //start.play(); //start sound effect
      screen = 1; //display game screen
    }
  } 

  //if 'q' is pressed at any time the program quits 
  if (key == 'q' || key == 'Q') {
    exit();
  }

  //if 'p' is pressed only when the player is playing the actual game the pause screen is displayed (and play sound effect). 
  //a pause screen does not need to be accessed in other screens. 
  if (screen == 1) {
    if (key == 'p' || key == 'P') {
      //pauseSound.play(); //play sound effect
      screen = 3; //pause screen
    }
  }

  //if '0' is pressed and the player is not on the game screen, call reset function
  //player should not be able to go back to the home screen directly from the game screen or from the home screen itself
  if (key == '0' && screen != 1 && screen != 0) {
    //menuGoBack.play(); //play sound effect
    reset();
  }

  //credits screen can only be accessed if the player is on the home screen, controls screen or options screen
  //a credits screen does not need to be accessed in other screens
  if (screen != 1 && screen != 4 && screen != 5 && screen != 3 && screen != 7) {
    if (key == 'c' || key == 'C') {
      //menuSelect.play(); //play sound effect
      screen = 7; //credits screen
    }
  }
}

//resets the entire game (different than just getting killed by an enemy because everything from each level resets and the player has to go back to level1) 
void reset() {
  screen = 0; //takes user back to title screen
  level = 0; //sets level back to the first one
  coinAmount = 0; //resets coin amount
  deathCount = 0; //resets death count

  //trophy for each level now exists and is able to be collected
  for (int i = 0; i < trophy[level].length; i++) {
    trophy[0][i].exist = true;
    trophy[1][i].exist = true;
    trophy[2][i].exist = true;
  }

  //all the tokens on level2 exist and are able to be collected (if any were collected)
  for (int i = 0; i < token[1].length; i++) {
    token[1][i].exist = true;
  }

  //all the tokens on level3 exist and are able to be collected (if any were collected)
  for (int i = 0; i < token[2].length; i++) {
    token[2][i].exist = true;
  }

  b.x = 133; //resets x position of ball to 133 (the x-position the player started with on level1)
  b.y = 614; //resets y position of ball to 614 (the y-position the player started with on level1)
}


//deals with all the mouse clicks within the program
void mousePressed() {
  //only when the player is on the home screen are they allowed to access the controls and options screen by clicking within these coordinates:
  if (screen == 0) {
    if (mouseX >= 459 && mouseX <= 736 && mouseY >= 421 && mouseY <= 463) {
      //menuSelect.play();
      screen = 2; //takes player to controls screen
    }

    if (mouseX >= 493 && mouseX <= 710 && mouseY >= 493 && mouseY <= 531) {
      //menuSelect.play();
      screen = 6; //takes player to options screen
    }
  }

  //only when the player in on the options screen can they change their ball colour
  else if (screen == 6) {
    for (int i = 0; i < ballColour.length; i++) {
      ballColour[i].changeColour(colours[i]); //allows ball colour to be changed when appropiate circle is clicked (circle aligns with array of colours)
    }
  }
}


//aesthetic feature (little bars around the 'press 'b' to begin')
void title() {
  noStroke();
  fill(255);

  rect(348, 337, 6, 21);
  rect(348, 337, 20, 6);
  rect(348, 405, 6, -18);
  rect(348, 405, 20, 6);

  rect(850, 337, -6, 21);
  rect(850, 337, -20, 6);
  rect(850, 405, -6, -18);
  rect(850, 405, -20, 6);
}

//pause screen
void pause() {
  imageMode(CENTER);
  image(pause, width/2, height/2);
}

//win screen
void win() {
  imageMode(CENTER);
  image(winScreen, width/2, height/2);
}

//gameover screen
void gameover() {
  imageMode(CENTER);
  image(gameover, width/2, height/2);
}

//controls screen
void controls() {
  imageMode(CENTER);
  image(controls, width/2, height/2);
}

//options screen
void options() {
  imageMode(CENTER);
  image(options, width/2, height/2);
  for (int i = 0; i < ballColour.length; i++) {
    ballColour[i].display(); //displays selection of ball colours to choose from
  }
}

//credits screen
void credits() {
  imageMode(CENTER);
  image(credits, width/2, height/2);
}
