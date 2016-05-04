class GameObject {
  
  PVector position;
  PVector scale;
  PVector rotation;
  PVector size;
  
  
  GameObject(float x, float y)
  {
    position = new PVector(x, y);
    scale = new PVector(1, 1);
    rotation = new PVector(0, 0);

  }
  
  GameObject()
  {
    // This calls a constructor in the same class
    this(width / 2, height / 2);
  } 
  
  public void update()
  {
  }
  
  public void render()
  {
  }
  
  
  }//End of class
  