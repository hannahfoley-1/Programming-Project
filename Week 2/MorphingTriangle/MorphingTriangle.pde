void setup ()
{
  size(500, 500);
  
  
}
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void draw()
{
  background(0);
  int vertices = 3;
  boolean circle = false;
  
  while (!circle)
  {
   fill(255);
   polygon(225, 275, 150, vertices);
  }
  
}
