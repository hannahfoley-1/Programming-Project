int y; // y for yellow
int g; // g for green 
int b; // b for blue

void setup()
{
  size(500, 500);
  noStroke();
  y = 50;        //starting x position of these squares
  g = 30;
  b = 70;
}
void draw()
{
  background(255); // if not put in the colour drawn stays 
  //yellow square moving left
  fill(255, 255, 0);
  rect(y, 20, 50, 50);
  if(y-- <= 0)
  {
    y =50;         //moves back to its original position when it hits the screen
  }
  
  //green square moving right
  fill(0, 255, 0);
  rect(g, 40, 50 ,50);
  if(g++ >= 450)
  {
    g = 30;
  }
  
  // blue square moving down
  fill(0, 0, 255);
  rect(60, b, 50, 50);
  if(b++ >=450) {
    b = 70;
  }
}
