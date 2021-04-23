Alien alienArray[];
ArrayList bulletArray;
ArrayList bombArray;
Shield shieldArray[];

PImage alienImage;
PImage explosionImage;

PFont myFont;

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
  myFont = loadFont("Dialog.plain-48.vlw");
/* create a new alien array */
  alienArray = new Alien [10];
  
//create a new shield array
  shieldArray = new Shield [4];
  
/* load the images */
  alienImage = loadImage("spacer.gif");
  explosionImage = loadImage("exploding.gif");
  
  
/* initialise the array */
    init_array(alienArray, alienImage);
    init_shields(shieldArray);
    
//create player object
    thePlayer = new Player(SCREENY - 100);
    
// bullet arraylist starts off empty until mouse is pressed
    bulletArray = new ArrayList();
    
//creating a bomb Array list
   bombArray = new ArrayList();
  
}

void init_array (Alien theArray[], PImage alienImage){
 /* for each position in the array,  create a new alien at an appropriate starting point on the screen */
 for (int i = 0; i < theArray.length; i++)
  {
    theArray[i] = new Alien((0+(i*75)), 100, alienImage);
  }
} 

void init_shields(Shield shieldArray[]){
 // for each position in the array, create a new shield at a random starting point
 for (int i = 0; i < shieldArray.length; i++)
 {
   shieldArray[i] = new Shield(random(SHIELDWIDTH, SCREENX-SHIELDWIDTH), random(SCREENY/2, SCREENY-3*SHIELDHEIGHT));
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
    
     //get the alien's bomb, if it has one, draw and move it, if not, do nothing
     Bomb currentBomb = alienArray[i].getBomb();     
     if (currentBomb != null)
     {
      currentBomb.draw();
      currentBomb.move();
    
    //if bomb has collided with player, display game over
      boolean gameOver = currentBomb.collide(thePlayer);
      if (gameOver)
      {
        textFont(myFont);
        text("GAME OVER!", SCREENX/3, SCREENY/2);
        noLoop();
      }
      }
  }
  
  /* draw the player */
  thePlayer.draw();
  thePlayer.move();
  
  /* draw the bullet (this is drawing bullets that have already been created)*/;
  for (int i = 0 ; i < bulletArray.size(); i++)
  {
     Bullet theBullet = (Bullet) bulletArray.get(i);
     theBullet.draw();
     theBullet.move();
     theBullet.collide(alienArray);  // I'm not calling explode because my collide function calls expolde
  }
  
  //draw the shields
  for (int i = 0; i < shieldArray.length; i++)
  {
    shieldArray[i].draw();
    shieldArray[i].move();
    shieldArray[i].collide(bulletArray, bombArray);
  }
}
  
void mousePressed(){
  
  bulletx = thePlayer.xpos();
  bullety = thePlayer.ypos();              //the position of the bullet
  Bullet newBullet = new Bullet(bulletx, bullety);   //make new bullet
  bulletArray.add(newBullet); //extend bulletArraylist
  
  
  /* for each bullet in the array - move the bullet, then draw the bullet */
  for (int i = 0 ; i < bulletArray.size(); i++)
  {
     Bullet currentBullet = (Bullet) bulletArray.get(i);
     currentBullet.move();
     currentBullet.draw();
     currentBullet.collide(alienArray);
  }
  
  
 
}
