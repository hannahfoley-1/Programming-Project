final int SCREENX = 1000;
final int SCREENY = 1000;
final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;              //direction variables
final int IMAGEHEIGHT = 50;
final int IMAGEWIDTH = 50;
final int ALIVE = 0;
final int EXPLODING = 1;
final int DEAD = 2;               // status variables
final int PADDLEWIDTH = 70;
final int PADDLEHEIGHT = 15;
 

class Alien {
float x;
float y;
float dx;
float dy;
int direction;
int status;
PImage explosionImage = loadImage("exploding.gif");
PImage alienImage = loadImage("spacer.gif");
PImage showImage;
int i;              //direction count
int j;              //status count



Alien(float xpos, float ypos, PImage passedImage)
{
  x = xpos;
  y = ypos;
  dx = 1;
  dy = 2;
  showImage = passedImage;    
  direction = A_FORWARD;      //will start off moving foward
  i = 0;
  status = ALIVE;
  j = 0;
}

void draw ()
{
  if (status == EXPLODING)  
  {
     j++;
     if (j >= 50)                //after 1 second (50 frames) of exploding, the alien dies and is no longer drawn 
     {
       status = DEAD; 
     }
     showImage = explosionImage; 
  }
  if (status != DEAD)           // if the alien is not dead, show its image
  { 
  image(showImage, x, y, IMAGEHEIGHT, IMAGEWIDTH);
  }
}

void explode()
{
    status = EXPLODING;
}

void move() {
if (x <= 0)      //left wall
  {
    if (direction == A_BACKWARD || direction == A_DOWN)
    {
      direction = A_DOWN;
    }
    else
    {
     direction = A_FORWARD;
    }
  }
  
if (x >= SCREENX - IMAGEWIDTH)    //right wall
{  
  direction = A_DOWN; 
}

if (i >= 50 && direction == A_DOWN)
{
  if (x <= 0)      //left wall
  {
    direction= A_FORWARD;
  }
  else            //right wall
  {
  direction = A_BACKWARD; 
  }
  i = 0;
}


if(direction == A_FORWARD)
{ //if we need to go forward, increment x position.
  x = x + dx;
}
else if(direction == A_BACKWARD)
{//if we need to go backward, decrement x position.
  x = x - dx; 
}
else if(direction == A_DOWN) {  //if we need to go down, increment y position.
   i = i + 1; 
   println(i);
   y = y + dy; 
} 

}
}
