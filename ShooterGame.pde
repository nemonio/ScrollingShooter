class ShooterGame {
  
  PVector gameLimits;
  PVector gameSize;
  
  float scrollSpeed;
  int score;
  int hiscore;
  
  int previousBulletTime;
  int framesBetweenBullets;
  
  int noControlsAtStartTime;
  
  ArrayList<Bullet> BulletsRemaining;
  ArrayList<ScorePopUp> ScorePopUpsRemaining;
  ArrayList<PowerUp> PowerUpsRemaining;
  ArrayList<Enemy> EnemiesRemaining;
  
  Player player;
  
  
  
  
  
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
        
     
     if ( keyCode == LEFT && player.position.x >= gameLimits.x )
     {
       player.position.x -= player.speed;
       
       if ( player.position.x <= gameLimits.x)
       {
            player.position.x = gameLimits.x;
       }
       

     }
     
     if ( keyCode == RIGHT && player.position.x <= gameLimits.x + gameSize.x - player.size.x)
     {
       player.position.x += player.speed;
       
       if ( player.position.x >= gameLimits.x + gameSize.x - player.size.x)
       {
            player.position.x = gameLimits.x + gameSize.x - player.size.x;
       }

     }
     //and time from previous bullet has passed generate two bullets
     if ( key == ' ' &&
          frameCount - previousBulletTime > framesBetweenBullets )
     {

        laserShotSound.cue(0);
        laserShotSound.play();
                   
        ShooterGame.BulletsRemaining.add( new Bullet (player.position.x, player.position.y ) );
        ShooterGame.BulletsRemaining.add( new Bullet (player.position.x + player.size.x, player.position.x) );
        
        //reset time from previous bullet
        previousBulletTime = frameCount;
    
     }
     
     
   }
   
}  
  
  
  
}//END OF CLASS*************************************************


  
  