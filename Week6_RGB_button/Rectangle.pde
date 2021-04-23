class Rectangle {
  int x;
  int y;
  int height;
  int width;
  color fillColour;
  color strokeColor = color(0);
  
  Rectangle (int x, int y, int height, int width, color fillColor) {
    this.x = x;
    this.y = y;
    this.height = height;
    this.width = width;
    this.fillColour = fillColor;
  }
  
  void colourChange (color toChange){
    fillColour = toChange;
  }
  
  void draw(){
    fill(fillColour);
    stroke(strokeColor);
    rect(x, y, width, height);
  }

}
