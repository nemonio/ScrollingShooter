class Background extends GameObject {
  
 
  ArrayList<BackgroundLine> BackgroundLinesRemaining;
  
  Background()
  {
   super(0, 0, width, height, 0);
   
   BackgroundLinesRemaining = new ArrayList<BackgroundLine>();
   
   //println(ShooterGame.numberOfLinesInScreen); 
   
   //for (int i = 0; i < 10; i++) {
   //BackgroundLinesRemaining.add(new BackgroundLine ( 0, i*(height/10) ));
   //}
   BackgroundLinesRemaining.add(new BackgroundLine ( 0, 0));
    
  }
  
  
  void update()
  {
    
    for (int i = BackgroundLinesRemaining.size() - 1; i >= 0; i--) {
      
      if((BackgroundLinesRemaining.get(i)).position.y >= height)
      {
        //BackgroundLinesRemaining.remove(i);
        //BackgroundLinesRemaining.add(new BackgroundLine ( 0, -height/10 ));
        
      }
      
      (BackgroundLinesRemaining.get(i)).update();
      
    }
    
    
  }
  
  
  
  
  
  
  
  
  void display() {

    for (int i = BackgroundLinesRemaining.size() - 1; i >= 0; i--) {
      
      (BackgroundLinesRemaining.get(i)).display();
      
    }

   
  }
  
  
    }//End of class