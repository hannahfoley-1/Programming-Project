//a square that smoothy wraps around

//will have to do 2 squares
//square 1 moves as normal
//then when it reaches rhs, new square appears 
//x value doesnt increment and y increments until y = size of square
//then it starts again

int i;
int t;

void setup()
{
  size(500, 500);
  noStroke();
  fill(255, 0, 0);
  i = 0;
  t = -49;          //starts here as it will slowly move out one pixel at a time to make illusion of wrap
}

void draw()
{
  background(255);
  rect(i, 30, 50, 50);
    if ((i++ >= 450) | (t>=450))  //i increments moving the square right
    { //as soon as not all of sqaure i is visable, the 'wrap' sqaure starts to show
      rect(t, 30, 50, 50);
      t++;              //t increments to move th wrap sqaure right
      if (t >= 450)
      {
        i = -49;        //when t sqaure starts to disappear, i sqaure can be drawn again 
      } 
      if (t == 500)
      {
        t = -49;
      }
    }
    
    
}
