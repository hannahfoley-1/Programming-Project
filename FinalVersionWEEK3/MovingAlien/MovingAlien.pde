final int SCREENX = 1000;
final int SCREENY = 1000;
final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;

class Alien {
float x;
float y;
float dx;
float dy;
int imageHeight;
int imageWidth;
int direction;
int explode;
boolean showExplosion; 
PImage explosionImage = loadImage("exploding.gif");
PImage alienImage = loadImage("spacer.gif");
PImage showImage;
int i; 


Alien(float xpos, float ypos, PImage passedImage)
{
  x = xpos;
  y = ypos;
  dx = 1;
  dy = 2;
  imageHeight = 50;
  imageWidth = 50;
  showImage = passedImage;
  direction = A_FORWARD;      //will start off moving foward
  i = 0;
}

void draw ()
{
  if (showExplosion)
  {
     showImage = explosionImage; 
  }
  image(showImage, x, y, imageHeight, imageWidth);
}

void explode()
{
  explode = int(random(0, 10000));
  if (explode <= 10 )
  {
     showExplosion = true;
  }
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
  
if (x >= SCREENX - imageWidth)    //right wall
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


if(direction == A_FORWARD) //if we need to go forward, increment x position.
  x = x + dx;
else if(direction == A_BACKWARD) //if we need to go backward, decrement x position.
  x = x - dx; 
else if(direction == A_DOWN) {  //if we need to go down, increment y position.
   i = i + 1; 
   println(i);
   y = y + dy; 
} 

}}
