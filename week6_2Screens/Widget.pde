class Widget {
  int x, y, width, height;
  String label; 
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  color strokeColor;
  boolean boxTicked = false;
  
  Widget(int x,int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event){
  this.x=x; 
  this.y=y; 
  this.width = width; 
  this.height= height;
  this.label=label; this.event=event;
  this.widgetColor=widgetColor; this.widgetFont=widgetFont;
  labelColor= color(0);
  strokeColor = color(0, 0, 0);
}

  void draw(){
  fill(widgetColor);
  stroke(strokeColor);
  rect(x,y,width,height);
  fill(labelColor);
  textFont(myFont);
  text(label, x+10, y+height-10);
}

  int getEvent(int mX, int mY){
  if(mX>x && mX < x+width && mY >y && mY <y+height){
    return event;
  }
  return EVENT_NULL;
  }
  
  void hovering(boolean hovering){
   if (hovering){
     strokeColor = color(255);
   }
   else {
     strokeColor = color(0);
   }
  }
  
  //for check box widgets
  void boxChecked(){
   if (!boxTicked)
   {
     widgetColor = color(0); 
     boxTicked = true;
   }
   else
   {
     widgetColor = color(255);
     boxTicked = false;
   }
  }
  
}
