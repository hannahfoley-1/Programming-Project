class Bullet{
  float x;            //bullet xpos
  float y;            //bullet ypos
  float dy;           //bullet speed
  int radius;
  color ballColor = color(250);
  
  Bullet(int xpos, int ypos) 
  {
    //call from player class the x position of the paddle
    radius = 15;
    x = xpos + PADDLEWIDTH/2;
    y = ypos + radius;                                //ball position
    dy = random(5, 10);                                //ball speed
  }
  
  void move ()
  {
    y = y - dy;      //only moves in y direction
   
   //moves within wall
    if (x-radius <= 0)
    {
      x = radius;          
    }
    else if (x+radius >= SCREENX)
    {
      x = SCREENX - radius;          
    }
  }
  
  void draw()
  {
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
  }   
  
  void collide (Alien [] alienArray)
  {
    //colliding the aliens if it hits one, the alien explodes
    for (int i = 0; i < alienArray.length; i++)
    {
       if ((x >= alienArray[i].x) && (x <= alienArray[i].x +IMAGEWIDTH) &&
       (y-radius <= alienArray[i].y + IMAGEHEIGHT) && (y >= alienArray[i].y))
       {
         alienArray[i].explode();
       }
    }
  } 
  
}
