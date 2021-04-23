
ArrayList widgetList;
Rectangle rectangle;
color rectColour = (255);


  void settings(){
    size(SCREENX, SCREENY);
  }

  void setup(){
  myFont=loadFont("CenturyGothic-48.vlw");
  textFont(myFont);
  
  Widget widget1=new Widget(SCREENX/4, 100, 250, 60, "RED", RED, myFont, EVENT_BUTTONRED);
  Widget widget2=new Widget(SCREENX/4, 200, 250, 60, "GREEN", color(0, 255, 0), myFont, EVENT_BUTTONGREEN);
  Widget widget3 = new Widget(SCREENX/4, 300, 250, 60, "BLUE", color(0, 0, 255), myFont, EVENT_BUTTONBLUE);
  
  widgetList = new ArrayList();
  widgetList.add(widget1);
  widgetList.add(widget2);
  widgetList.add(widget3);
  
  rectangle = new Rectangle(SCREENX/2, 450, 80, 80, rectColour);
}

  void draw(){
    for(int i = 0; i<widgetList.size(); i++){
      Widget aWidget = (Widget) widgetList.get(i);
      aWidget.draw();
    }
    rectangle.draw();
  }
  
  void mousePressed(){
  int event;
  for(int i = 0; i<widgetList.size(); i++){
    Widget aWidget = (Widget) widgetList.get(i);  
    event = aWidget.getEvent(mouseX,mouseY);
    switch(event) {
      case EVENT_BUTTONRED:
      println("red button"); 
      rectangle.colourChange(RED);
      break;
      case EVENT_BUTTONGREEN:
      println("green button");
      rectangle.colourChange(GREEN);
      break;
      case EVENT_BUTTONBLUE:
      println("blue button");
      rectangle.colourChange(BLUE);
    }
  }
  }
  
  void mouseMoved(){
    int event;
    for (int i = 0; i < widgetList.size(); i++)
    {
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent(mouseX, mouseY);
      switch(event){
         case EVENT_BUTTONRED:
         case EVENT_BUTTONGREEN:
         case EVENT_BUTTONBLUE:
         aWidget.hovering(true);
         break;
         case EVENT_NULL:
         aWidget.hovering(false);
         break;
      }
   }
  
  }
