int y; // y for yellow
int g; // g for green 
int b; // b for blue

void setup()
{
  size(500, 500);
  noStroke();
  y = 10;
  g = 30;
  b = 70;
}
void draw()
{
  background(255); // if not put in the colour drawn stays 
  //yellow square moving left
  fill(255, 255, 0);
  rect(y, 10, 50, 50);
  if(y-- <= 0)
  {
    y =10;
  }
  
  //green square moving right
  fill(0, 255, 0);
  rect(g, 40, 50 ,50);
  if(g++ >= 499)
  {
    g = 30;
  }
  
  // blue square moving down
  fill(0, 0, 255);
  rect(60, b, 50, 50);
  if(b++ >=499)
  {
    b = 70;
  }
}
