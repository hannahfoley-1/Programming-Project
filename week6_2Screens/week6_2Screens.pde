final int EVENT_FORWARD_BUTTON = 1;
final int EVENT_BACKWARD_BUTTON = 2;
final int BUTTON1 = 3;
final int BUTTON2 = 4;
final int CHECKBOX1 = 5;
final int CHECKBOX2 = 6;

class Screen{
  ArrayList widgets;
  color background;
  ArrayList strings = new ArrayList();
  int Stringxpos = 0;
  int Stringypos = 0;
  
  Screen(color background){
    widgets = new ArrayList();
    this.background = background;
    Stringxpos = 0;
    Stringypos = 0;
  }
  
   //adding widgets to the screen
  void addWidget(Widget widget){    
    widgets.add(widget);
  }
  
  void draw(){
   background(background);
   for (int i = 0; i < widgets.size(); i++)
   {
     Widget aWidget = (Widget) widgets.get(i);
     aWidget.draw();
   }
     for (int i = 0; i < strings.size(); i++)
     {
       String aString = (String) strings.get(i);
       text(aString, Stringxpos, Stringypos);
     }
     
   }
  
  //returns what button was pressed
  int getEvents(){ 
    int event = 0;     
    for (int i =0; i < widgets.size(); i++)
    {
          Widget aWidget =(Widget) widgets.get(i);
          event = aWidget.getEvent(mouseX, mouseY);
          if (event != EVENT_NULL)
          {
            return event;
          }
    }
    return event;
  }
  
  void addStrings(String string, int xpos, int ypos){
    strings.add(string);
    this.Stringxpos = xpos;
    this.Stringypos = ypos;
  }

}
