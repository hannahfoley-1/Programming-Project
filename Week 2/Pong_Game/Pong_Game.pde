

class Player{
  
  int xpos;
  int ypos;
  color paddlecolor = color(50);
  
  Player(int screen_y)
  {
    xpos = SCREENX/2;
    ypos = screen_y;
  }
  
  void move (int x)
  {
    if ( x > SCREEN-PADDLEWIDTH)
    {
      xpos = SCREEN - PADDLEWIDTH;         //cannot move outside of the screen 
    }
    else
    {
      xpos = x;
    }
  }
  
  void draw()
  {
    fill (paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
}
