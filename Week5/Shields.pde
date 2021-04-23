final int SHIELDHEIGHT = 10;
final int SHIELDWIDTH = 100;

class Shield {
  float x;
  float y;
  float dx;
  color fillColor = color(0, 255, 0);
  int damage = 0;
  boolean functioning = true;
  
  Shield(float xpos, float ypos){
    x = xpos;
    y = ypos;
    dx = 1;
  }
  
  void move(){
     x = x + dx;
     if (x >= SCREENX-SHIELDWIDTH || x <= SHIELDWIDTH)
     {
        dx = -dx;
     }
  }
  
  void draw(){
    fill (fillColor);
    rect(x, y, SHIELDWIDTH, SHIELDHEIGHT);  
  }
  
  void collide (ArrayList bulletArray, ArrayList bombArray){
    //colliding with bullet
    if (functioning)  //only if shield hasnt been hit so many times that it no longer functions
    {
    for (int i = 0; i < bulletArray.size(); i++)
    {
      Bullet currentBullet = (Bullet) bulletArray.get(i);
      if (currentBullet != null){
      if (currentBullet.x >= x && currentBullet.x <= x + SHIELDWIDTH && 
      currentBullet.y >= y && currentBullet.y <= y + SHIELDHEIGHT) {
        damage = damage + 1;
        fillColor -= 50;
      }
      }
    }
    for (int i = 0; i < bombArray.size(); i++)
    {
      Bomb currentBomb = (Bomb) bombArray.get(i);
      if (currentBomb != null){
      if (currentBomb.x >= x && currentBomb.x <= x + SHIELDWIDTH && 
      currentBomb.y >= y && currentBomb.y <= y + SHIELDHEIGHT) {
        currentBomb.shieldPlayer();
        bombArray.remove(i);
        damage = damage + 1;
        fillColor -= 50;
      }
      }
    }
    }
    if (damage > 3) {
     functioning = false;
     fillColor = color(0);
    }
    
  }
}
