class Bullet extends GameObject {
  /*
  PVector location;
  PVector velocity;
  PVector acceleration;

  boolean hasHit;
  boolean isVisible;
  boolean isRemovable;
  
  float bulletSize;
  float bulletSpeed;
  

  Bullet (float x1, float y1) {

    
    location = new PVector(x1, y1);
   
    hasHit=false;
    isRemovable=false;
    
    bulletSize=5;
    bulletSpeed=20;
    
  }

  // Method to update location
  void update() {
    
    
      // If any bullet is set to be removable, remove it 
      for (int i = ArkanoidGame.BulletsRemaining.size() - 1; i >= 0; i--) {
                
                
                if( (ArkanoidGame.BulletsRemaining.get(i)).isRemovable == true ||
                    (ArkanoidGame.BulletsRemaining.get(i)).location.y < ArkanoidGame.gameOffsetCoord.y
                ){
                     ArkanoidGame.BulletsRemaining.remove(i);
                 }
      }
    
    
    
    ////COLLISIONS****
      //If bullet hits a brick...
      for (int i = ArkanoidGame.BricksRemaining.size() - 1; i >= 0; i--) {
     
                 //println("hello");
                 if( (ArkanoidGame.BricksRemaining.get(i)).isDead==false &&
                     location.y >= (ArkanoidGame.BricksRemaining.get(i)).location.y &&
                     location.y <= (ArkanoidGame.BricksRemaining.get(i)).location.y + ArkanoidGame.brickHeight &&
                     location.x >= (ArkanoidGame.BricksRemaining.get(i)).location.x &&
                     location.x <= (ArkanoidGame.BricksRemaining.get(i)).location.x + ArkanoidGame.brickWidth
                   ){
                     
                     brickHitSound.cue(0);
                     brickHitSound.play();

                     
                     //update score and hiscore if the bullet hits a brick
                     ArkanoidGame.score+=(ArkanoidGame.BricksRemaining.get(i)).scoreStored;
                     
                     if( ArkanoidGame.score > ArkanoidGame.hiscore){
                       
                       ArkanoidGame.hiscore = ArkanoidGame.score;
                       
                       
                     }
                     ArkanoidGame.BrickCounterForGeneratingEnemies++;
                     hasHit=true;
                     isRemovable=true;
                     (ArkanoidGame.BricksRemaining.get(i)).broken=true;
                     if((ArkanoidGame.BricksRemaining.get(i)).unbreakable==false)
                     {
                       (ArkanoidGame.BricksRemaining.get(i)).hitCount--;
                     }
                     if((ArkanoidGame.BricksRemaining.get(i)).hitCount<=0)
                     {
                       (ArkanoidGame.BricksRemaining.get(i)).isDead=true;
                       ArkanoidGame.ScorePopUpsRemaining.add(new ScorePopUp ((ArkanoidGame.BricksRemaining.get(i)).location.x, (ArkanoidGame.BricksRemaining.get(i)).location.y, (ArkanoidGame.BricksRemaining.get(i)).brickColor, (ArkanoidGame.BricksRemaining.get(i)).scoreStored));
                       if((ArkanoidGame.BricksRemaining.get(i)).powerUpType=="NONE")
                        {
                          //Don't create a Powerup if the brick hasn't got any stored one. 
                        }
                        else
                        {
                           ArkanoidGame.PowerUpsRemaining.add(new PowerUp ( (ArkanoidGame.BricksRemaining.get(i)).powerUpType, (ArkanoidGame.BricksRemaining.get(i)).location.x, (ArkanoidGame.BricksRemaining.get(i)).location.y) );
                        }
                     }
                     
                     break;
                 }

               }

      if ( hasHit == false ) {
        
      location.y-=bulletSpeed;
      
      }
      
  }

  // Method to display
  void display() {

    
    //Bevel lights
    stroke( hue(YELLOW), saturation(YELLOW), brightness(YELLOW), 70);
    fill(RED);
    strokeWeight(4);
    //Vertical
    ellipse( location.x, location.y, bulletSize, 3*bulletSize);
    
  }
*/
}//End of class
  
  