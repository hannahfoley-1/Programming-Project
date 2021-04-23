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
  /*void livesAndEndingGame()
  {
    textSize(10);
    fill(255);
    text("Player's score: ", 10, 20);
    text(playerScore, 80, 20);
    textSize(10);
    fill(255);
    text("Computer's score: ", 215, 20);           
    text(computerScore, 305, 20);
    
    if (playerScore >=3)
    {
      //player has won
      textSize(16);
      fill(255);
      text("Congratulations, you won!", 50, SCREENY/2);
    }
    if (computerScore >=3)
    {
      //computer has won
      textSize(16);
      fill(255);
      text("Computer has won!", 50 , SCREENY/2);
    }
  } */
