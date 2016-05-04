class ShooterGame {
  
  
  float scrollSpeed;
  int SCORE;
  
  ArrayList<Bullet> BulletsRemaining;
  
  
  
  
  
// Method to update location
  void update()
  
  {
    
    
  
  }



  // Method to display
  void display()
  
  {  
  
         drawGradientLinearBackground(GREEN);

    
  }






void activatePlayerControls(){
  
  // https://processing.org/reference/key.html
  // https://processing.org/reference/keyCode.html
  // USE ONLY 'key' for ASCII specification (BACKSPACE, TAB, ENTER, RETURN, ESC, and DELETE)
  // keyCode is used to detect special keys such as the arrow keys (UP, DOWN, LEFT, and RIGHT) as well as ALT, CONTROL, and SHIFT.
  
  //char prevKey = ' ';
  
  if (keyPressed && frameCount - noControlsAtStartTime > 100)
   {
        
     
     if ( keyCode == LEFT && playerLocation.x >= gameOffsetCoord.x )
     {
       playerLocation.x -= raquetSpeed;
       
       if ( playerLocation.x <= gameOffsetCoord.x)
       {
            playerLocation.x = gameOffsetCoord.x;
       }
       

     }
     
     if ( keyCode == RIGHT && playerLocation.x <= gameOffsetCoord.x + (brickWidth*numberColumns) - raquetShape.width*raquetScaleMultiplier)
     {
       playerLocation.x += raquetSpeed;
       
       if ( playerLocation.x >= gameOffsetCoord.x + (brickWidth*numberColumns) - raquetShape.width*raquetScaleMultiplier)
       {
            playerLocation.x = gameOffsetCoord.x + (brickWidth*numberColumns) - raquetShape.width*raquetScaleMultiplier;
       }

     }
     //if the ball is not stopped and the LASER powerup is on, and time from previous bullet has passed generate two bullets
     if ( key == ' ' &&
          raquetCurrentPowerUp == "LASER" &&
          ballobject.isStopped == false  &&
          frameCount - previousBulletTime > framesBetweenBullets )
     {

        laserShotSound.cue(0);
        laserShotSound.play();
                   
        ArkanoidGame.BulletsRemaining.add( new Bullet (playerLocation.x + ballobject.ballRadius, playerLocation.y) );
        ArkanoidGame.BulletsRemaining.add( new Bullet (playerLocation.x + (raquetShape.width*raquetScaleMultiplier) - ballobject.ballRadius, playerLocation.y) );
        
        //reset time from previous bullet
        previousBulletTime = frameCount;
    
     }
     
     //if the ball is stopped release it
     if ( key == ' ' && ballobject.isStopped == true )
     {
      
         raquetHitSound.cue(0);
         raquetHitSound.play();
       
       ballobject.isStopped = false;

     }
     
   }
   
}  
  
  
  
}//END OF CLASS*************************************************


  
  