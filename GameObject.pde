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
  
  
  
  
  
  
  
  /*
  class GameObject
{
  PVector pos;
  PVector forward;
  float theta = 0.0f;
  float w;
  float halfW;
  float speed = 5.0f;
  color c; 
  PVector velocity;
  
  GameObject(float x, float y)
  {
    pos = new PVector(x, y);
    theta = 0;
    forward = new PVector(0, -1);
    velocity = new PVector(0, 0);
    w = 50;
    halfW = w * 0.5f;
    theta = 0.0f;
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
  
}
  
  */