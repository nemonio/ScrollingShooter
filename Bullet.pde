class Bullet extends GameObject {
 
  //PVector location;
  //PVector velocity;
  //PVector acceleration;

  boolean hasHit;
  boolean isVisible;
  boolean isRemovable;
  
  float bulletSize;
  float bulletSpeed;
  

  Bullet (float x1, float y1) {

    
    position = new PVector(x1, y1);
   
    hasHit=false;
    isRemovable=false;
    
    bulletSize=5;
    bulletSpeed=20;
    
  }



  // Method to update location
  void update() {
    
    
      // If any bullet is set to be removable, remove it 
      for (int i = ShooterGame.BulletsRemaining.size() - 1; i >= 0; i--) {
                
                
                if( (ShooterGame.BulletsRemaining.get(i)).isRemovable == true ||
                    (ShooterGame.BulletsRemaining.get(i)).position.y < ShooterGame.gameLimits.y
                ){
                     ShooterGame.BulletsRemaining.remove(i);
                 }
      }
    
    
    
    ////COLLISIONS****
      //If bullet hits a enemy...
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
      
  }

  // Method to display
  void display() {

    
    //Bevel lights
    stroke( hue(YELLOW), saturation(YELLOW), brightness(YELLOW), 70);
    fill(RED);
    strokeWeight(4);
    //Vertical
    ellipse( position.x, position.y, bulletSize, 3*bulletSize);
    
  }

}//End of class
  
  