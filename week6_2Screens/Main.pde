Screen screen1;
Screen screen2;
Screen currentScreen;
ArrayList widgetList;
ArrayList screenList;
int showScreen = 0;
Widget checkbox1;
Widget checkbox2;

void settings(){
 size(SCREENX, SCREENY);
}

void setup(){
  myFont=loadFont("CenturyGothic-48.vlw");
  textFont(myFont);
  
  widgetList = new ArrayList();

  //creating the buttons that will be on the screens
  Widget fowardButton = new Widget(SCREENX/4, 100, 300, 70, "Next page", color(150), myFont, EVENT_FORWARD_BUTTON);
  Widget backwardButton = new Widget(SCREENX/4, 100, 350, 70, "Previous page", color(150), myFont, EVENT_BACKWARD_BUTTON);
  Widget button1 = new Widget(SCREENX/4, 300, 350, 70, "Button 1", color(200), myFont, BUTTON1);
  Widget button2 = new Widget(SCREENX/4, 300, 350, 70, "Button 2", color(200), myFont, BUTTON2);
  checkbox1 = new Widget(SCREENX/3, 400, 50, 50, "", color(255), myFont, CHECKBOX1);
  checkbox2 = new Widget(SCREENX/3, 475, 50, 50, "", color(255), myFont, CHECKBOX2);
  
  //making screen 1
  Screen screen1 = new Screen(PURPLE);
  screen1.addWidget(fowardButton);
  screen1.addWidget(button1);
  screen1.addWidget(checkbox1);
  //screen1.addStrings("Click this box", SCREENX/3+75, 400);
  screen1.addWidget(checkbox2);
  //screen1.addStrings("Click that box", SCREENX/3+75, 515);
  
  //making screen2
  Screen screen2 = new Screen(BABYBLUE);
  screen2.addWidget(backwardButton);
  screen2.addWidget(button2);
  
  //screen array list to switch between screens
  screenList = new ArrayList();
  screenList.add(screen1);  
  screenList.add(screen2);
}

void draw(){
  Screen currentScreen = (Screen) screenList.get(showScreen);
  currentScreen.draw();
}

//for clicking buttons
void mousePressed(){
  Screen currentScreen = (Screen) screenList.get(showScreen);
  int event = currentScreen.getEvents();
    switch(event) {
      case EVENT_FORWARD_BUTTON:
      println("next page"); 
      showScreen = 1;
      break;
      case EVENT_BACKWARD_BUTTON:
      println("previous page");
      showScreen = 0;
      break;
      case BUTTON1:
      println("button 1");
      break;
      case BUTTON2:
      println("button 2");
      break;
      case CHECKBOX1:
      println("checkbox 1");
      checkbox1.boxChecked(); 
      break;
      case CHECKBOX2:
      println("checkbox 2");
      checkbox2.boxChecked();
      break;
    }
  }
  
  //highlight button that is hovered over
  void mouseMoved(){
    int event;
    Screen currentScreen = (Screen) screenList.get(showScreen);
    ArrayList widgetList = currentScreen.widgets;
    for (int i = 0; i < widgetList.size(); i++)
    {
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent(mouseX, mouseY);
      switch(event){
         case EVENT_FORWARD_BUTTON:
         case EVENT_BACKWARD_BUTTON:
         case BUTTON1:
         case BUTTON2:
         case CHECKBOX1:
         case CHECKBOX2:
         aWidget.hovering(true);
         break;
         case EVENT_NULL:
         aWidget.hovering(false);
         break;
      }
   }
  }
