class Player {
int xpos;
int ypos;
color paddlecolor = color(250);

Player(int screen_y)  //its original starting position
{
  xpos = SCREENX/2;
  ypos = screen_y;
}
  
void move ()
{
  xpos = mouseX;         //moves left and right at bottom of screen using user mouse
  
  //players paddle stays on screen
  if (xpos > SCREENX-PADDLEWIDTH)
  {
     xpos = SCREENX - PADDLEWIDTH;         //cannot move outside of the screen 
  }
}

  void draw()
  {
    //mouse player
    fill (paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  
  int xpos()       //x and y pos returned to main to know where to shoot the ball from
  {
    return xpos; 
  }
  
  int ypos()
  {
    return ypos; 
  }
}
  
