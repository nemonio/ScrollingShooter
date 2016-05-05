class Player extends GameObject {
  
  float speed;
  int strokeWeight;
  //PVector size;
  
  Player()
  {
    super();
    speed=10;
    strokeWeight=5;
  }
  
  Player(float x, float y, float sizeX, float sizeY)
  {
    super(x, y, sizeX, sizeY);
    speed=10;
    strokeWeight=5; 
  }
  
  
  
  
  
    public void update()
  {
    
    
    
    
    
  }
  
  
  
  
  
  
  
  
  void display() {

    noFill();
    stroke(RED);
    strokeWeight(strokeWeight);
    rect( position.x, position.y, size.x, size.y);

   
  }
  
  
  }//End of class
  