class PowerUp extends GameObject {
  /*
  PVector location;
  PVector velocity;
  PVector acceleration;
  color powerUpColor;

  boolean isDead;
  boolean isRemovable;
  
  AudioPlayer SoundToPlayWhenCollected;
  
  float powerUpWidth;
  
  int scoreDisplayed;
  
  String powerUpType;
  

  PowerUp (String pType, float x1, float y1) {

    powerUpType = pType;
    powerUpWidth = ArkanoidGame.brickWidth+4;
    
    location = new PVector(x1, y1);
    
    acceleration = new PVector(0, 0.2);
    velocity = new PVector(0, 0);
    
    switch(powerUpType) {
    case "LASER": 
    powerUpColor=POWERUP_LASER_COLOR;
    SoundToPlayWhenCollected=laserShotSound;
    break;
    case "EXPAND": 
    powerUpColor=POWERUP_EXPAND_COLOR;
    SoundToPlayWhenCollected=expandSound;
    break;
    case "PLAYER": 
    powerUpColor=POWERUP_PLAYER_COLOR;
    SoundToPlayWhenCollected=introLevelMusic;
    break;
    case "SLOW": 
    powerUpColor=POWERUP_SLOW_COLOR;
    SoundToPlayWhenCollected=introLevelMusic;    
    break;
    case "CATCH": 
    powerUpColor=POWERUP_CATCH_COLOR;
    SoundToPlayWhenCollected=introLevelMusic;    
    break;
    case "BREAK": 
    powerUpColor=POWERUP_BREAK_COLOR;
    SoundToPlayWhenCollected=introLevelMusic;
    break;
    case "3BALL": 
    powerUpColor=POWERUP_3BALL_COLOR;
    SoundToPlayWhenCollected=introLevelMusic;
    break;
    default:             // Default executes if the case labels
    println("None");   // don't match the switch parameter
    break;
    }   
    
    
   
    isRemovable=false;
    
  }

  // Method to update location
  void update() {
    
      //Update if it's not removable
      if ( isRemovable == false ) { 
      
      velocity.add(acceleration);
      location.add(velocity);
      //location.y+=3;
      }
      
      //remove it if reaches the bottom without being collected
      if ( location.y >= height ) {
        
      isRemovable=true;
      
      }
      
      //Set to be removable it if it is collected and apply different things depending on which powerup is collected
      if ( location.y >= ShooterGame.player.position.y &&
           location.y <= ShooterGame.player.position.y + player.size.y &&
           location.x >= ShooterGame.player.position.x - powerUpWidth &&
           location.x <= ShooterGame.player.position.x + player.size.x
      ) {
          
          //Add a live if it didnt reach the maximun lives number
          if (powerUpType=="PLAYER")
          {
            if (ArkanoidGame.lives<ArkanoidGame.maxLives)
            {
              ArkanoidGame.lives+=1;
            }
          }
          

          
          if ( (powerUpType=="CATCH")==false )
          {
            ArkanoidGame.ballobject.isStopped=false;
          }
          else
          {
            
             ArkanoidGame.ballobject.isStopped=true;
            
          }
          
          if ( powerUpType=="CATCH" && ArkanoidGame.ballobject.isStopped==true)
          {
            ArkanoidGame.ballobject.isStopped=false;
          }
        
          if (powerUpType=="BREAK")
          {
              
              //if the level is the last one. go to the end screen
              if(ArkanoidGame.level==ArkanoidGame.lastlevel)
              {
                ArkanoidGame.resetGameWhenChangingLevel();
                frameAnimationStarted=frameCount; 
                GAMEMODE = 2;
              }
              else
              {
                ArkanoidGame.level+=1;
              }
              
              ArkanoidGame.resetGameWhenChangingLevel();
              
              ArkanoidGame.ballobject.isStopped=true;
              
            
          
          }
          
         //ArkanoidGame.PowerUpsRemaining.remove(i);
         isRemovable=true;
         SoundToPlayWhenCollected.cue(0);
         SoundToPlayWhenCollected.play();
         
         //set current PowerUp
         ArkanoidGame.raquetCurrentPowerUp=powerUpType;
         
      }
      
      
      
  }

  // Method to display
  void display() {

    
    //shadow
    noFill();
    stroke(0, 0, 100, alpha(powerUpColor)-50);
    strokeWeight(ArkanoidGame.brickHeight);
    line( location.x + 6, location.y + ArkanoidGame.brickHeight*0.5f + 2, location.x + ArkanoidGame.brickWidth - 2, location.y + ArkanoidGame.brickHeight*0.5f + 2);
    
    noFill();
    stroke(powerUpColor);
    strokeWeight(ArkanoidGame.brickHeight);
    line( location.x + 4, location.y + ArkanoidGame.brickHeight*0.5f, location.x + ArkanoidGame.brickWidth - 4, location.y + ArkanoidGame.brickHeight*0.5f);
    
    
    textAlign(CENTER,CENTER);
    displayText( powerUpType, mainFont, location.x + (ArkanoidGame.brickWidth*0.5f), location.y + (ArkanoidGame.brickHeight*0.5f), int(ArkanoidGame.brickWidth*0.25f), WHITE, 100, true, 50);
    

   
  }
   */
}//End of class