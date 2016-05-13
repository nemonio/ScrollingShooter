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
    strokeWeight(strokeWeight);
    rect( position.x, position.y, size.x, size.y);
    isDead=false;
    }

   
  }
  
  
  }//End of class
  
  

  
  
  
  
/*

  // The class name starts with uppercase
class Ship extends GameObject
{
  PVector force;
  PVector acceleration;
  float mass;
  float timeDelta = 1.0f / 60.0f;
  
  // Constructor!!
  // HAS NO RETURN TYPE
  // Name is always the same as the class
  Ship()
  {
    super();    
  }
  
  Ship(float x, float y)
  {
    super(x, y);
    force = new PVector();
    acceleration = new PVector();
    mass = 1.0f;
  }
  
  int toPass = 60 / 5; // How many frames must pass
  int ellapsed = toPass;
 
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    
    if (keys[' '] && ellapsed > toPass)
    {
      PVector bulletPos = pos.get();
      bulletPos.add(PVector.mult(forward, 30)); // Start the bullet 30 units in front of the player
      Bullet b = new Bullet(bulletPos.x, bulletPos.y, theta);
      bullets.add(b);
      ellapsed = 0;
    }
    ellapsed ++;
    
    if (keys[UP])
    {
      // The direction is the forward vector
      // The amount is 10 newtons
      // we add this to the force vector
      force.add(PVector.mult(forward, 200));
    }      
    if (keys[LEFT])
    {
      theta -= 0.1f;
    }
    if (keys[RIGHT])
    {
      theta += 0.1f;
    }      
    
    if (pos.x < 0)
    {
      pos.x = width;
    }
    
    if (pos.x > width)
    {
      pos.x = 0;
    }
    
    if (pos.y < 0)
    {
      pos.y = height;
    }
    
    if (pos.y > height)
    {
      pos.y = 0;
    }
    
    acceleration = PVector.div(force, mass);
    velocity.add(PVector.mult(acceleration, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    velocity.mult(0.99f);
  }
  
  void render()
  {
    stroke(255);
    pushMatrix(); // reset the translation and rotation
    translate(pos.x, pos.y);
    rotate(theta); // We want rotate to happen first, so you make the call AFTER translate    
    line(- halfW, halfW, 0, - halfW);
    line(0, - halfW, halfW, halfW);
    line(halfW, halfW, 0, 0);
    line(- halfW, halfW, 0, 0);
    popMatrix();
  }   
}
*/