class Bomb {
 float x;
 float y;
 float dy;
 int radius = 10;
 color bombColour = color(255, 0, 0);
 boolean workingBomb;
 
 Bomb (float xpos, float ypos) 
 {
    x = xpos;
    y = ypos;
    dy = 5;
    workingBomb = true;
 }
 
 void move()
 {
   y = y + dy;         
 }
 
 void draw()
 {
   fill(bombColour);
   ellipse(int(x), int(y), radius, radius);
 }
 
 void shieldPlayer()
 {
   bombColour = color(255, 255, 0);
   workingBomb = false;
 }
 
 boolean offScreen()
 {
   if (y+radius > SCREENY )
   {
      return true; 
   }
   else 
   {
      return false; 
   }
 }
 
 boolean collide (Player thePlayer)
 {
   if (workingBomb) { 
   //use xpos and ypos to get player x and y posoitions
   if ((x >= thePlayer.xpos() && x <= thePlayer.xpos() + PADDLEWIDTH) && 
   (y >= thePlayer.ypos() && y <= thePlayer.ypos() + PADDLEHEIGHT))
   {
     return true;
   }
   else  // if it hasnt collided with the player
   {
      return false; 
   }
   }
   else // if its not a working bomb
   {
     return false;
   }
 }
  
}
