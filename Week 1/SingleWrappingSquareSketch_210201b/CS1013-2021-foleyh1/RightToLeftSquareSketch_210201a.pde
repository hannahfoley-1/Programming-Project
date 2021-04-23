int i;
void setup()
{
  size (500, 500);
  noStroke();
  fill(255, 0 , 0);
  i = 0;
}

void draw()
{
  background(255);
  rect(i, 100, 50, 50);
  if (i++ >= 499)     //when left corner pixel reaches 499, the square moev back to (0, 30)
  {
    i=0;
  }
}
