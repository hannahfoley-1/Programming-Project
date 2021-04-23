Player thePlayer;
Ball theBall;
Player computerPlayer;

int playerScore;
int computerScore;
int computerLevel;  //determines spped computer plays at

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  thePlayer = new Player(SCREENY - MARGIN - PADDLEHEIGHT);
  theBall = new Ball();
  computerPlayer = new Player(SCREENY - MARGIN - PADDLEHEIGHT);
  ellipseMode(RADIUS);
  computerScore = 0;
  playerScore = 0;
}

void draw()
{
  background(0);
  float ballXPosition = theBall.xPosition();
  thePlayer.move(mouseX, ballXPosition);
  theBall.move();
  theBall.collide(thePlayer, computerPlayer);
  thePlayer.livesAndEndingGame();
  computerPlayer.livesAndEndingGame();
  //theBall.reset();
  thePlayer.draw();            //draws computer player and mouse player
  theBall.draw(); 
}
