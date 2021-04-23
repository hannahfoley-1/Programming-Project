int i;
int t;  // i and t for the first rectangle
int i2;
int t2; // i and t for the second rectangle

void setup()
{
  size(500, 500);
  noStroke();
  fill(255, 0, 0);
  i = 0;               //first rectangle starts from point 0
  t = -49;             
  i2 = 499;            // second rectange is moving in the opposite direction so starts from point 499
  t2 = 549;
}

void draw()
{
  background(255);
  rect(i, 30, 50, 50);
    if ((i++ >= 450)| ( t >= 450))      // when first rectangle reaches end of screen, we want to start drawing from the other side again as a wrap around illusion
    {
      rect(t, 30, 50, 50);
      t++;
      if (t >= 450)      // when the 'wrap' rectangle reaches the end of the screen, bring i position back to increment it and create a new wrap
      {
         i = -49;  
      }   
      if (t >= 500)      // when t rectangle is gone from the screen, bring t back so loop can continue
      {
         t = -49;
      }
    }

   
   rect(i2, 200, 50, 50);
   if (i2-- <= 50) 
   {
      rect(t2, 200, 50, 50);
      t2--;
      if (t2 <= 50)
      {
        i2 = 549;
      }
      if (t2 <= 0)
      {
        t2 = 549;
      }
   }  
}
