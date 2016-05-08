class Enemy extends GameObject {

  
  boolean isRemovable;

  boolean isDead;
  int scoreStored;
  int hitCount;
  color enemyColor;
  String enemyType;
  
  //float shotAngle;
  
  int strokeWeight;
  
  float cannonSizeDim;
  
  float timeCreated;
  float lastShotTime;
  float timeBetweenShots;
  
  Enemy()
  {
    super();

  }
  
  Enemy(String type, float x, float y)
  {
    super(x, y, ShooterGame.cannonRadius, ShooterGame.cannonRadius, PI);
    strokeWeight=3;
    enemyType=type;
    isDead=false;
    isRemovable=false;
    scoreStored=100;
    //shotAngle=0;
    cannonSizeDim=50;
    
    timeCreated=frameCount;
    lastShotTime=frameCount;
    timeBetweenShots=3;


    switch(type) {
    case "CANNON":
    break;
    default:             // Default executes if the case labels
    //println("None");   // don't match the switch parameter
    break;
    }  


  }
  
  
  
  
  
    public void update()
  {
    
    
    /*
    switch(enemyType) {
    case "CANNON":
    position.y++;
    break;
    default:             // Default executes if the case labels
    //println("None");   // don't match the switch parameter
    break;
    }  
    */
    
    //position.y+=ShooterGame.scrollSpeed;
    
    
                    forward.x = sin(theta);
                    forward.y = -cos(theta);
                    velocity.x = forward.x;
                    velocity.y = forward.y;    
                    velocity.mult(ShooterGame.scrollSpeed);    
                    position.add(velocity);    
    
    //behaviour Rotate to player
    
    //turretTheta+=radians(1);
    //turretTheta=PVector.angleBetween(ShooterGame.player.position, position)+PI/2;
    turretTheta=atan2( (ShooterGame.player.position.y + ShooterGame.player.size.y/2) - (position.y + size.y/2) , (ShooterGame.player.position.x + ShooterGame.player.size.x/2) - (position.x + size.x/2) );
    //turretTheta=atan2(ShooterGame.player.position.y, ShooterGame.player.position.x) - atan2(position.y, position.x);
    //atan2(v2.y,v2.x) - atan2(v1.y,v1.x)
    //ShooterGame.player.position.x + ShooterGame.player.position.y + position.x + position.y;
    //turretTheta=atan2( (ShooterGame.player.position.x - position.x)/(ShooterGame.player.position.y - position.y) );
    
    
    //shooting
      if ( frameCount - lastShotTime > timeBetweenShots )
     {
        PVector bulletPos = new PVector(position.x, position.y);
        PVector forwardTurret = new PVector(sin(turretTheta+ PI/2), -cos(turretTheta+ PI/2));
        
        bulletPos.add(PVector.mult(forwardTurret, 70));       
        ShooterGame.BulletsRemaining.add( new Bullet (bulletPos.x + size.x/2, bulletPos.y + size.y/2, turretTheta + PI/2) );
        
        //reset time from previous bullet
        lastShotTime = frameCount;
    
     }
    
    
    
  }
  
  
  
  
  
  
  
  
  void display() {
    
    
    switch(enemyType) {
    case "CANNON":
    
    
    image(cannonCrater, position.x, position.y, size.x, size.y);
    image(cannonBase, position.x, position.y, size.x, size.y);
    
    pushMatrix(); // reset the translation and rotation
    translate(position.x+size.x/2, position.y+size.y/2);
    rotate(turretTheta); // We want rotate to happen first, so you make the call AFTER translate    
    image(cannonTurret, -size.x/2, -size.y/2, size.x, size.y);
    popMatrix();
    
    
    //image(cannonTurret, 0, 0, size.x, size.y);

    break;
    default:             // Default executes if the case labels
    //println("None");   // don't match the switch parameter
    break;
    }  
    
    noFill();
    stroke(RED);
    strokeWeight(strokeWeight);
    rect( position.x+cannonSizeDim, position.y+cannonSizeDim, size.x-2*cannonSizeDim, size.y-2*cannonSizeDim);


   
  }  
  
  
  
  
  
  
  
  
  
  
  }//End of class
  