Player thePlayer;
Ball theBall;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  thePlayer = new Player(SCREENY - MARGIN - PADDLEHEIGHT);
  theBall = new Ball();
  ellipseMode(RADIUS);
}

void draw()
{
  background(0);
  thePlayer.move(mouseX);
  theBall.move();
  theBall.collide(thePlayer);
  thePlayer.draw();
  theBall.draw();
}
