class Bullet extends GameObject {
 
  //PVector location;
  //PVector velocity;
  //PVector acceleration;

  boolean hasHit;
  boolean isRemovable;
  
  //float bulletSize=5;
  float bulletSpeed;
  

  Bullet (float x1, float y1, float angle, float velo) {
    
    super(x1, y1, 5, 15, 0);
   
    hasHit=false;
    isRemovable=false;
    
    theta = angle;
    
    bulletSpeed=velo;
    
  }



  // Method to update location
  void update() {
    
    

    
    
                     if ( hasHit == false )
                 {
        
                    //position.y-=bulletSpeed;
                    forward.x = sin(theta);
                    forward.y = -cos(theta);
                    velocity.x = forward.x;
                    velocity.y = forward.y;    
                    velocity.mult(bulletSpeed);    
                    position.add(velocity);
      
                 }
                 
                 //bulletPos.add(PVector.mult(forward, 30)); // Start the bullet 30 units in front of the player

    ////COLLISIONS****
      //If bullet hits a enemy...
      /*
      for (int i = ShooterGame.EnemiesRemaining.size() - 1; i >= 0; i--) {
     
                 //println("hello");
                 if( (ShooterGame.EnemiesRemaining.get(i)).isDead==false &&
                     position.y >= (ShooterGame.EnemiesRemaining.get(i)).position.y &&
                     position.y <= (ShooterGame.EnemiesRemaining.get(i)).position.y + (ShooterGame.EnemiesRemaining.get(i)).size.y &&
                     position.x <= (ShooterGame.EnemiesRemaining.get(i)).position.x + (ShooterGame.EnemiesRemaining.get(i)).size.x
                   ){
                     
                     brickHitSound.cue(0);
                     brickHitSound.play();

                     
                     //update score and hiscore if the bullet hits a brick
                     ShooterGame.score+=(ShooterGame.EnemiesRemaining.get(i)).scoreStored;
                     
                     if( ShooterGame.score > ShooterGame.hiscore){
                       
                       ShooterGame.hiscore = ShooterGame.score;
                       
                       
                     }
                     //ShooterGame.BrickCounterForGeneratingEnemies++;
                     hasHit=true;
                     isRemovable=true;
                     //(ShooterGame.EnemiesRemaining.get(i)).broken=true;
                     //if((ShooterGame.EnemiesRemaining.get(i)).unbreakable==false)
                     //{
                       (ShooterGame.EnemiesRemaining.get(i)).hitCount--;
                     //}
                     if((ShooterGame.EnemiesRemaining.get(i)).hitCount<=0)
                     {
                       (ShooterGame.EnemiesRemaining.get(i)).isDead=true;
                       //ShooterGame.ScorePopUpsRemaining.add(new ScorePopUp ((ShooterGame.EnemiesRemaining.get(i)).position.x, (ShooterGame.EnemiesRemaining.get(i)).position.y, (ShooterGame.EnemiesRemaining.get(i)).enemyColor, (ShooterGame.EnemiesRemaining.get(i)).scoreStored));
                       if((ShooterGame.EnemiesRemaining.get(i)).powerUpType=="NONE")
                        {
                          //Don't create a Powerup if the brick hasn't got any stored one. 
                        }
                        else
                        {
                          // ShooterGame.PowerUpsRemaining.add(new PowerUp ( (ShooterGame.EnemiesRemaining.get(i)).powerUpType, (ShooterGame.EnemiesRemaining.get(i)).position.x, (ShooterGame.EnemiesRemaining.get(i)).position.y) );
                        }
                     }
                     
                     break;
                 }

               }

      if ( hasHit == false ) {
        
      position.y-=bulletSpeed;
      
      }
      
      */
      
  }

  // Method to display
  void display() {

    //Bevel lights
    
    pushMatrix(); // reset the translation and rotation
    translate(position.x+size.x/2, position.y+size.y/2);
    rotate(theta);
    strokeWeight(2);
    stroke( hue(WHITE), saturation(WHITE), brightness(WHITE), 70);
    fill(BLACK);
    //Vertical
    
    ellipse( -size.x/2, -size.y/2, 5, 15);
    
    popMatrix();
    
    /*
    pushMatrix(); // reset the translation and rotation
    translate(position.x+size.x/2, position.y+size.y/2);
    rotate(turretTheta); // We want rotate to happen first, so you make the call AFTER translate    
    image(cannonTurret, -size.x/2, -size.y/2, size.x, size.y);
    popMatrix();
    */
  }

}//End of class
  
  
  
  
  
  
  
  
  /*
  
  
  class Bullet extends GameObject
{
  float speed = 10.0f;
  
  
  Bullet(float x, float y, float theta)
  {
    super(x,y);
    this.theta = theta;
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    velocity.x = forward.x;
    velocity.y = forward.y;    
    velocity.mult(speed);    
    position.add(velocity);
    
    if ((pos.x < 0) || (pos.x > width) || (pos.y < 0) || (pos.y > height))
    {
      bullets.remove(this);
    }    
}
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, -5, 0, 5);
    popMatrix();     
  }
}


*/
  