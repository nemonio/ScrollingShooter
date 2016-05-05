class GameObject {
  
  PVector position;
  PVector scale;
  PVector rotation;
  PVector size;
  
  
  GameObject(float x, float y, float sizeX, float sizeY)
  {
    position = new PVector(x, y);
    scale = new PVector(1, 1);
    rotation = new PVector(0, 0);
    size = new PVector(sizeX, sizeY);

  }
  
  GameObject()
  {
    // This calls a constructor in the same class
    this(width / 2, height / 2 , 1, 1);
  } 
  
  public void update()
  {
  }
  
  public void render()
  {
  }
  
  
  }//End of class
  