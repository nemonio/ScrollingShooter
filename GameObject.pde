class GameObject {
  
  PVector position;
  PVector scale;
  PVector rotation;
  PVector size;
  
  
  PVector forward;
  PVector velocity;

  float theta;
  float turretTheta;

  
  
  GameObject(float x, float y, float sizeX, float sizeY, float thetaAngle)
  {
    position = new PVector(x, y);
    scale = new PVector(1, 1);
    
    forward = new PVector(0, 1);
    velocity = new PVector(0, 0);

    theta = thetaAngle;
    turretTheta=0;


    
    rotation = new PVector(0, 0);
    size = new PVector(sizeX, sizeY);

  }
  
  GameObject()
  {
    // This calls a constructor in the same class
    this(width / 2, height / 2 , 1, 1, 0);
  } 
  
  public void update()
  {
  }
  
  public void render()
  {
  }
  
  
  }//End of class