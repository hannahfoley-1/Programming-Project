
class Player{
  
  int xpos;
  int ypos;
  color paddlecolor = color(50);
  float computerXpos;
  float computerYpos;
  
  Player(int screen_y)
  {
    xpos = SCREENX/2;
    ypos = screen_y;
  }
  
  void move (int x, float ballx)
  {
    //players paddles stays on screen
    if (x > SCREENX-PADDLEWIDTH)
    {
      xpos = SCREENX - PADDLEWIDTH;         //cannot move outside of the screen 
    }
    else
    {
      xpos = x;
    }
    if (computerXpos > SCREENX-PADDLEWIDTH)
    {
      computerXpos = SCREENX - PADDLEWIDTH;         //cannot move outside of the screen 
    }
    //HOW THE COMPUTER PLAYER MOVES:
    //moving the paddle towards the ball within the size of the screen
    if (ballx > computerXpos)
    {
      computerXpos +=15;                         
      //if (computerLevel > 1)
      //{
       // computerXpos +=5;                        //moves closer to the ball if the player is on a HIGHER level
      //}
    }
    else 
    {
      computerXpos -=15;
      //if (computerLevel > 1)
      //{
      //  computerXpos -=5;
      //}
    } 
  }

  void draw()
  {
    //mouse player
    fill (paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
    
    //computer player
    fill (paddlecolor);
    
    rect(computerXpos, computerYpos, PADDLEWIDTH, PADDLEHEIGHT);
    
  }
  
  void livesAndEndingGame()
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
  }
}
