Alien alienArray[];
PImage alienImage;
PImage explosionImage;

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
  
}

void init_array (Alien theArray[], PImage alienImage){
 /* for each position in the array,  create a new alien at an appropriate starting point on the screen */
 for (int i = 0; i < theArray.length; i++)
  {
    theArray[i] = new Alien((0+(i*75)), 100, alienImage); //<>//
    //println("new alien" + i);
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
     alienArray[i].explode();
    /* float x = alienArray[i].xpos();
     float y = alienArray[i].ypos();
     println("alien " + i + " xpos " + x + " y pos " + y); */
  }
} 

void move_array(Alien theArray[])
{
  for(int i = 0; i < theArray.length; i++)
  {
    theArray[i].move();
  }
}

void draw_array(Alien theArray[])
{
  for (int i = 0; i < theArray.length; i++)
  {
    theArray[i].draw();
  }
} 

void explode_array(Alien theArray[]){
  for (int i = 0; i < theArray.length; i++)
  {
    theArray[i].explode();
  }
} 
