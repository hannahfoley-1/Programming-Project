class Ball{
  float x;            //ball xpos
  float y;            //ball ypos
  float dx;           //ball speed
  float dy;
  int radius;
  color ballColor = color(200, 100, 50);
  boolean lastTouch;  //true for mouse player, false for computer player
  
  Ball() 
  {
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);        //ball position
    dx = random(1, 2);
    dy = random(1, 2);                       //ball speed
    radius = 5;
  }
  
  void move ()
  {
    x = x + dx;
    y = y + dy;
   

   //moves within wall, will bounces of left and right walls
    if (x-radius <= 0)
    {
      dx = -dx;           //should change direction if hit left wall
    }
    else if (x+radius >= SCREENX)
    {
      dx = -dx;          //should change direction if hits right wall
    }
  }
  
  float xPosition()   //sent to main in order to move the computer player paddle towards the ball
  {
    return x;
  }
  
  void draw()
  {
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
  }   
  
  void collide (Player tp, Player cp)
  {
    //colliding the player
    if ((y+radius >= tp.ypos) && (y-radius < tp.ypos+PADDLEHEIGHT) && 
    (x >= tp.xpos) && (x <= tp.xpos+PADDLEWIDTH))
    {
      println("collided!");
      dy = -dy;
    }
    //colliding with the computer
    if ((y-radius <= cp.computerYpos+PADDLEHEIGHT) && (y+radius > cp.computerYpos-PADDLEHEIGHT) && (x >= cp.computerXpos) && (x <= cp.computerXpos+PADDLEWIDTH))
    {
       println("collided!");
       dy = -dy;
    }
    if ((y > SCREENY-PADDLEHEIGHT) || (y < PADDLEHEIGHT))
    {
      reset();
    }
  }
 
  
  //ball has fallen off screen (below paddles)
  void reset() 
  {
   if (y > SCREENY-PADDLEHEIGHT)   
    {
      dx = 0;
      dy = 0;
      lastTouch = false;
      resetText();
    }
    if (y < PADDLEHEIGHT) 
    {
      
      dx = 0;
  
      dy = 0;
      computerLevel++;
      lastTouch = true;
      resetText();
    }
  }
  
  void resetText()
  {
    if(!lastTouch)
    {
      computerScore = computerScore + 1;
    }
    else if (lastTouch)
    {
      playerScore = playerScore + 1;
    }
    textSize(12);
    fill(255);
    text("Ball speed: " + computerLevel, 50, SCREENY/3);
    textSize(16);
    fill(255);
    text("Press mouse to continue", 50, SCREENY/2);
    
    if (mousePressed)
    {
      mousePressed();
    }
  } 
  
  void mousePressed()                 //ball goes to a random place on the screen and starts to move again
  {
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(1, 2);
    dy = random(1, 2);
    move(); 
    draw();
   
  }
  
}


  
  
