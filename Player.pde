class Player extends GameObject {
  
  float speed;
  int strokeWeight;
  boolean isDead;
  //PVector size;
  
  Player()
  {
    super();
    speed=10;
    strokeWeight=5;
  }
  
  Player(float x, float y, float sizeX, float sizeY)
  {
    super(x, y, sizeX, sizeY, 0);
    speed=10;
    strokeWeight=5;
    isDead=false;
  }
  
  
  
  
  
    public void update()
  {
    
    
    
        ////COLLISIONS****
      //If player hits a enemy bullet...
      
      for (int i = ShooterGame.BulletsRemaining.size() - 1; i >= 0; i--) {
     
                 //println("hello");
                 if( position.y <= (ShooterGame.BulletsRemaining.get(i)).position.y &&
                     position.y + size.y >= (ShooterGame.BulletsRemaining.get(i)).position.y &&
                     position.x <= (ShooterGame.BulletsRemaining.get(i)).position.x &&
                     position.x + size.x >= (ShooterGame.BulletsRemaining.get(i)).position.x
                   ){
                     
                     //brickHitSound.cue(0);
                     //brickHitSound.play();
                     
                     

                     isDead=true;
                     ShooterGame.BulletsRemaining.remove(i);
                     //break;
                 }

               }

    
    
    
    
  }
  
  
  
  
  
  
  
  
  void display() {
    
    image(spaceship, position.x, position.y, size.x, size.y);
    
    if (isDead==true)
    {
    noFill();
    stroke(RED);
    strokeWeight(strokeWeight*0.7f);
    //rect( position.x, position.y, size.x, size.y);
    ellipse( position.x + size.x*0.5f, position.y + size.y*0.5f, size.x, size.y);

    isDead=false;
    }

   
  }
  
  
  }//End of class