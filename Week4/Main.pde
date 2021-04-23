Alien alienArray[];
Bullet bulletArray[];

PImage alienImage;
PImage explosionImage;

boolean showBullet;
int bulletx;
int bullety;        //bullet x and y positions
int bulletNo = 0;   //for the bullet array
boolean explode = false;

Player thePlayer;
Bullet theBullet;

void settings()
{
   size(SCREENX,SCREENY); 
}

void setup(){
/* create a new alien array */
  alienArray = new Alien [10];
  
/* load the images */
  alienImage = loadImage("spacer.gif");
  explosionImage = loadImage("exploding.gif");
  
  
/* initialise the array */
    init_array(alienArray, alienImage);
    
//create player object
    thePlayer = new Player(SCREENY - 100);
    
    // bullet array starts off empty until mouse is pressed
    bulletArray = new Bullet [1];
  
}

void init_array (Alien theArray[], PImage alienImage){
 /* for each position in the array,  create a new alien at an appropriate starting point on the screen */
 for (int i = 0; i < theArray.length; i++)
  {
    theArray[i] = new Alien((0+(i*75)), 100, alienImage);
  }
} 

void draw(){
  /* clear the screen */
   background(0);
  
  /* for each alien in the array - move the alien, then draw the alien */
  for (int i = 0 ; i < alienArray.length; i++)
  {
     alienArray[i].draw();
     alienArray[i].move();
  }
  
  /* draw the player */
  thePlayer.draw();
  thePlayer.move();
  
  /* draw the bullet (this is drawing bullets that have already been created)*/;
  for (int i = 1 ; i < bulletArray.length; i++)
  {
     bulletArray[i].draw();
     bulletArray[i].move();
     bulletArray[i].collide(alienArray);  // I'm not calling explode because my collide function calls expolde
  }
}
  
void mousePressed(){
  bulletNo++;        //what bullet we're on
  Bullet [] tempArray = new Bullet [bulletArray.length + 1];    //extending bullet array
  arrayCopy(bulletArray, tempArray);
  bulletArray = tempArray;
  
  bulletx = thePlayer.xpos();
  bullety = thePlayer.ypos();              //the position of the bullet
  bulletArray[bulletNo] = new Bullet(bulletx, bullety);   //make new bullet
  
  
  /* for each bullet in the array - move the bullet, then draw the bullet */
  for (int i = 1 ; i < bulletArray.length; i++)
  {
     bulletArray[i].move();
     bulletArray[i].draw();
     bulletArray[i].collide(alienArray);
  }
  
  
 
}
