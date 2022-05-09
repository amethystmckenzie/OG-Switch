/*  
 ** Amethyst G. H. McKenzie
 *
 ** WHEEL OF DOOM (baby edition)
 *
 ** instructions:
     - wait for title screen to load
     - click to begin!
         - the images will cycle through randomly
           click the mouse to land on a victm..ahem..I mean STUDENT
     - click again to resume cycle
     - enjoy the relaxing lullaby :) + the cute photos!
 *  
 ** NOV 3 2019
 */

PFont f; //font for names
PFont t; //font for title page
PImage[] classmates = new PImage[9]; //array of student images
String[] names = new String[9]; //array of student names
//SoundFile sound; // sound effect
//SoundFile squeak; // sound effect
//SoundFile background; // background music (twinkle twinkle little star)
//import processing.sound.*;
int count = 0; // determines how many times user has clicked the screen
int screen = 0; // variable for title page

void setup() {
  size(1000, 800);
  background(0);
  t = createFont("Letters for Learners.ttf", 50, true); // title font
  f = createFont("baby blocks.ttf", 50, true); // name fonts
  //sound = new SoundFile(this, "effect.mp3"); 
  //squeak = new SoundFile(this, "squeak.mp3");
  //background = new SoundFile(this, "background_music.mp3");
  //background.play(); // plays background music
  //background.loop(); //loops background music


  //array of images
  classmates[0] = loadImage("20ikl2.jpg");
  classmates[1] = loadImage("20jl2.jpg");
  classmates[2] = loadImage("20mgd2.jpg");
  classmates[3] = loadImage("20ml2.jpg");
  classmates[4] = loadImage("21agm2.jpg");
  classmates[5] = loadImage("22fjr2.jpg");
  classmates[6] = loadImage("22mn2.jpg");
  classmates[7] = loadImage("22ojr2.jpg");
  classmates[8] = loadImage("22zld2.jpg");

  //array of names
  names[0] = "IZZY";
  names[1] = "KELLY";
  names[2] = "MICHAELA";
  names[3] = "MATT";
  names[4] = "AMETHYST";
  names[5] = "FRANK";
  names[6] = "MARTINA";
  names[7] = "OLIVER";
  names[8] = "ZENO";
}


void draw() {
  background(0);

  //title screen
  textAlign(CENTER);
  if (screen == 0) {
    background(0);
    fill(#FF9DF4); // baby pink
    textFont(t, 50);
    text("WELCOME TO THE WHEEL OF DOOM!", width/2, height/2);
    textFont(t, 30);
    fill(255);
    text("*baby edition*", width/2, 450);
    text("(click to start)", width/2, 750);
  } else {
    background(0);
  }

  int n;

  textFont(f, 25);

  //goes through each image and student name randomly
  if (count % 2 != 0) {
    n = int(random(9));
    image(classmates[n], 0, 0);
    text(names[n], 800, 400);

    /* changes name colours. doesn't specifically do so for boys or girls
     because breaking gender stereotypes (just an aesthetic) */
    if (n%2 == 0) {
      fill(#FF9DF4); //baby pink
    } else {
      fill(#8BEFFF); //baby blue
    }
  }
}

//determines whether to stop or continue the loop depending on the # of clicks 
void mousePressed() {
  count = count + 1; // user click increases by one
  screen += 1; //makes it so that title page only comes up once (in the beginning)
  if (count % 2 == 0) {
    //sound.play(); //plays effect upon picking a student
    //squeak.play(); //plays squeak upon picking a student
    noLoop();
  } else {
    loop();
  } 
}
