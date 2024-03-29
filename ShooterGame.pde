class ShooterGame {
  
  PVector gameLimits;
  PVector gameSize;
  
  float scrollSpeed;
  int score;
  int hiscore;
  int level;
  
  int previousBulletTime;
  int framesBetweenBullets;
  
  int noControlsAtStartTime;
  
  int framesUntilBoss;
  boolean HasBossBeenCreated;
  
  ArrayList<Bullet> BulletsRemaining;
  ArrayList<Bullet> PlayerBulletsRemaining;
  ArrayList<ScorePopUp> ScorePopUpsRemaining;
  ArrayList<PowerUp> PowerUpsRemaining;
  ArrayList<Enemy> EnemiesRemaining;
  ArrayList<Boss> BossesRemaining;
  
  Player player;
  float playerWidth;
  float playerHeight;
    
  boolean upPressed;
  boolean downPressed;
  boolean leftPressed;
  boolean rightPressed;
  
  int numberOfKeysPressedAtTheSameTime;
  
  float ratioDiagonalMovement;
  
  
  int numberOfLinesInScreen;
  
  Background backgroundlines;
  
  float distanceBetweenBackgroundLines;
  
  int gameStartTime;
  int lastCannonTime;
  int timeBetweenCannons;
  
  float cannonRadius;
  
  
  
  ShooterGame()
  
  {
    gameLimits = new PVector(0,0);
    gameSize = new PVector(width,height);
    
    scrollSpeed = 2;
    score = 0;
    hiscore = 0;
    level = 1;
  
    previousBulletTime = frameCount;
    framesBetweenBullets = 10;
    
    noControlsAtStartTime=frameCount;
    framesUntilBoss=1800;
    HasBossBeenCreated=false;
    
    ScorePopUpsRemaining = new ArrayList<ScorePopUp>();
    BulletsRemaining = new ArrayList<Bullet>();
    PlayerBulletsRemaining = new ArrayList<Bullet>();
    PowerUpsRemaining = new ArrayList<PowerUp>();
    EnemiesRemaining = new ArrayList<Enemy>();
    BossesRemaining = new ArrayList<Boss>();
    
    playerWidth = 100;
    playerHeight= 50;
    player = new Player(width / 2, height*0.8f, playerWidth, playerHeight);
    //backgroundlines = new Background();
    
    
    upPressed = false;
    downPressed = false;
    leftPressed = false;
    rightPressed = false;
    
    numberOfKeysPressedAtTheSameTime = 0;
    
    ratioDiagonalMovement = 0.8f;
    
    numberOfLinesInScreen=10;
    
    backgroundlines = new Background();
    
    gameStartTime = frameCount;
    lastCannonTime = frameCount;
    timeBetweenCannons = 100;
    
    cannonRadius=200;
  
  }  
  
  
// Method to update location
  void update()
  
  {
   
   activatePlayerControls();
   //controlsUP();
   //println(ShooterGame.BulletsRemaining.size()); 
  
  }



  // Method to display
  void display()
  
  {  
  
         drawGradientLinearBackground(GREEN);
         
         backgroundlines.display();
         backgroundlines.update();
         
         generateCannons();

         
         displayEnemies();
         removeEnemies();
         
         displayBosses();
         removeBosses();
         
         displayBullets();
         removeBullets();
         
         displayPlayerBullets();
         removePlayerBullets();         
         
         player.display();
         player.update();
         
         displayScore();
         
    
  }


void keyPressed() {
  
  
  if ((key == UP)) {
    
    upPressed = true;
    numberOfKeysPressedAtTheSameTime++;
    
  }
  
    if ((key == DOWN)) {
    
    downPressed = true;
    numberOfKeysPressedAtTheSameTime++;

    
  }
  
    if ((key == RIGHT)) {
    
    rightPressed = true;
    numberOfKeysPressedAtTheSameTime++;
    
  }
  
    if ((key == LEFT)) {
    
    leftPressed = true;
    numberOfKeysPressedAtTheSameTime++;
    
  }
  
}

void keyReleased() {
  
  if ((key == UP)) {
    
    upPressed = false;
    numberOfKeysPressedAtTheSameTime--;
    
  }
  
      if ((key == DOWN)) {
    
    downPressed = false;
    numberOfKeysPressedAtTheSameTime--;

    
  }
  
    if ((key == RIGHT)) {
    
    rightPressed = false;
    numberOfKeysPressedAtTheSameTime--;
    
  }
  
    if ((key == LEFT)) {
    
    leftPressed = false;
    numberOfKeysPressedAtTheSameTime--;
    
  }
  
}


void controlsUP()
{
  switch(numberOfKeysPressedAtTheSameTime) {
    case 0:
    println("None"); 
    break;
    case 1: 
    activatePlayerControls();
    break;
    case 2: 
    activatePlayerControlsNEW();
    break;
    case 3:
    break;
    case 4:
    break;
    default:             // Default executes if the case labels
    println("None");   // don't match the switch parameter
    break;
    } 
}

void activatePlayerControlsNEW(){
  
  
    
  if (frameCount - noControlsAtStartTime > 100)
  {
   
    if (upPressed == true && leftPressed  == true)
    {
      player.position.x -= player.speed*ratioDiagonalMovement;
      player.position.y -= player.speed*ratioDiagonalMovement;
      
      stayInLimitsLEFT();
      stayInLimitsUP();
    }
    
    if (upPressed == true && rightPressed  == true)
    {
      player.position.x += player.speed*ratioDiagonalMovement;
      player.position.y -= player.speed*ratioDiagonalMovement;
      
      stayInLimitsLEFT();
      stayInLimitsUP();    }
    
    if (downPressed == true && leftPressed  == true)
    {
      player.position.x -= player.speed*ratioDiagonalMovement;
      player.position.y += player.speed*ratioDiagonalMovement;
      
      stayInLimitsLEFT();
      stayInLimitsUP();    }
    
    if (downPressed == true && rightPressed  == true)
    {
      player.position.x += player.speed*ratioDiagonalMovement;
      player.position.y += player.speed*ratioDiagonalMovement;
      
      stayInLimitsLEFT();
      stayInLimitsUP();   
    }
    
    
   
  }
  
}


void activatePlayerControls(){
  
  // https://processing.org/reference/key.html
  // https://processing.org/reference/keyCode.html
  // USE ONLY 'key' for ASCII specification (BACKSPACE, TAB, ENTER, RETURN, ESC, and DELETE)
  // keyCode is used to detect special keys such as the arrow keys (UP, DOWN, LEFT, and RIGHT) as well as ALT, CONTROL, and SHIFT.
  
  //char prevKey = ' ';
  
  if (keyPressed && frameCount - noControlsAtStartTime > 100)
   {
        
     if ( keyCode == UP && player.position.y >= gameLimits.y )
     {
       player.position.y -= player.speed;
       
       if ( player.position.y <= gameLimits.y)
       {
            player.position.y = gameLimits.y;
       }
       

     }
     
     if ( keyCode == DOWN && player.position.y <= gameSize.y - player.size.y )
     {
       player.position.y += player.speed;
       
       if ( player.position.y >= gameSize.y)
       {
            player.position.y = gameSize.y;
       }
       

     }
     
     
     
     
     
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
                   
        ShooterGame.PlayerBulletsRemaining.add( new Bullet (player.position.x, player.position.y, 0, 20, 5) );
        ShooterGame.PlayerBulletsRemaining.add( new Bullet (player.position.x + player.size.x, player.position.y, 0, 20, 5) );
        
        //reset time from previous bullet
        previousBulletTime = frameCount;
    
     }
     
     
   }
   
}  
 
 
  void stayInLimitsRIGHT()
 {
       if ( player.position.x >= gameSize.x)
       {
            player.position.x = gameSize.x;
       }
 }
 
 void stayInLimitsDOWN()
 {
       if ( player.position.y >= gameSize.y)
       {
            player.position.y = gameSize.y;
       }
 }
 
   void stayInLimitsLEFT()
 {
       if ( player.position.x <= gameSize.x)
       {
            player.position.x = gameSize.x;
       }
 }
 
 void stayInLimitsUP()
 {
       if ( player.position.y <= gameSize.y)
       {
            player.position.y = gameSize.y;
       }
 }
 
 void displayBullets()
{
   for (int i = 0; i < BulletsRemaining.size(); i++) {
     
     (BulletsRemaining.get(i)).display();
     (BulletsRemaining.get(i)).update();
     

   }
   
}
   
 void removeBullets()
{
   
         // If any bullet is set to be removable, remove it 
      for (int i = ShooterGame.BulletsRemaining.size() - 1; i >= 0; i--) {
                

                      
                if( (ShooterGame.BulletsRemaining.get(i)).isRemovable == true ||
                    (ShooterGame.BulletsRemaining.get(i)).position.y < ShooterGame.gameLimits.y ||
                    (ShooterGame.BulletsRemaining.get(i)).position.y > height ||
                    (ShooterGame.BulletsRemaining.get(i)).position.x < ShooterGame.gameLimits.x ||
                    (ShooterGame.BulletsRemaining.get(i)).position.x > width
                ){
                     ShooterGame.BulletsRemaining.remove(i);
                 }
      }

}


 void displayPlayerBullets()
{
   for (int i = 0; i < PlayerBulletsRemaining.size(); i++) {
     
     (PlayerBulletsRemaining.get(i)).display();
     (PlayerBulletsRemaining.get(i)).update();
     

   }
   
}
   
 void removePlayerBullets()
{
   
         // If any bullet is set to be removable, remove it 
      for (int i = ShooterGame.PlayerBulletsRemaining.size() - 1; i >= 0; i--) {
                

                      
                if( (ShooterGame.PlayerBulletsRemaining.get(i)).isRemovable == true ||
                    (ShooterGame.PlayerBulletsRemaining.get(i)).position.y < ShooterGame.gameLimits.y ||
                    (ShooterGame.PlayerBulletsRemaining.get(i)).position.y > height ||
                    (ShooterGame.PlayerBulletsRemaining.get(i)).position.x < ShooterGame.gameLimits.x ||
                    (ShooterGame.PlayerBulletsRemaining.get(i)).position.x > width
                ){
                     ShooterGame.PlayerBulletsRemaining.remove(i);
                 }
      }

}


 void displayEnemies()
{
   for (int i = 0; i < EnemiesRemaining.size(); i++) {
     
     (EnemiesRemaining.get(i)).display();
     (EnemiesRemaining.get(i)).update();
     

   }
   
}
   
 void removeEnemies()
{
   
         // If any bullet is set to be removable, remove it 
      for (int i = ShooterGame.EnemiesRemaining.size() - 1; i >= 0; i--) {
                

                      
                if( (ShooterGame.EnemiesRemaining.get(i)).isRemovable == true ||
                    (ShooterGame.EnemiesRemaining.get(i)).position.y > height
                ){
                     ShooterGame.EnemiesRemaining.remove(i);
                 }
      }

} 

 void displayBosses()
{
   for (int i = 0; i < BossesRemaining.size(); i++) {
     
     (BossesRemaining.get(i)).display();
     (BossesRemaining.get(i)).update();
     

   }
   
}
   
 void removeBosses()
{
   
         // If any bullet is set to be removable, remove it 
      for (int i = ShooterGame.BossesRemaining.size() - 1; i >= 0; i--) {
                

                      
                if( (ShooterGame.BossesRemaining.get(i)).isRemovable == true ||
                    (ShooterGame.BossesRemaining.get(i)).position.y > height
                ){
                     ShooterGame.BossesRemaining.remove(i);
                 }
      }

} 



void generateCannons()
         {
   
        if (frameCount - lastCannonTime > timeBetweenCannons &&
            frameCount < ShooterGame.framesUntilBoss +  ShooterGame.noControlsAtStartTime
        ) {
            //ShooterGame.ScorePopUpsRemaining.add(new ScorePopUp ((ShooterGame.EnemiesRemaining.get(i)).position.x, (ShooterGame.EnemiesRemaining.get(i)).position.y, (ShooterGame.EnemiesRemaining.get(i)).enemyColor, (ShooterGame.EnemiesRemaining.get(i)).scoreStored));
            //add one tturret
            ShooterGame.EnemiesRemaining.add(new Enemy ("CANNON", random(0,width-cannonRadius), 0-cannonRadius, 2) ) ;
            

            
            //println(ShooterGame.EnemiesRemaining.size());
            //println(ShooterGame.BulletsRemaining.size()); 
            lastCannonTime = frameCount;
         }
         
         
         
        if (frameCount > ShooterGame.framesUntilBoss +  ShooterGame.noControlsAtStartTime &&
            HasBossBeenCreated==false &&
            ShooterGame.EnemiesRemaining.size()<1
        )
        {
              //add boss
            ShooterGame.BossesRemaining.add(new Boss () ) ;
            HasBossBeenCreated=true;
        }

} 
            
void displayScore() {
     
    
  textAlign(CENTER, TOP);
  displayText("LEVEL "+ level, mainFont, width*0.5f, 10, 32, WHITE, 100, true, 100);
  textAlign(LEFT, TOP);
  displayText(""+score, mainFont, 100, 10, 32, WHITE, 100, true, 100);
  
  textAlign(RIGHT, TOP);
  displayText(""+hiscore, mainFont, 1140, 10, 32, WHITE, 100, true, 100);
    
}  

void resetGame()
{
     gameLimits = new PVector(0,0);
    gameSize = new PVector(width,height);
    
    scrollSpeed = 2;
    score = 0;
    //hiscore = 0;
    level = 1;
  
    previousBulletTime = frameCount;
    framesBetweenBullets = 10;
    
    noControlsAtStartTime=frameCount;
    framesUntilBoss=600;
    HasBossBeenCreated=false;
    
    ScorePopUpsRemaining = new ArrayList<ScorePopUp>();
    BulletsRemaining = new ArrayList<Bullet>();
    PlayerBulletsRemaining = new ArrayList<Bullet>();
    PowerUpsRemaining = new ArrayList<PowerUp>();
    EnemiesRemaining = new ArrayList<Enemy>();
    BossesRemaining = new ArrayList<Boss>();
    
    playerWidth = 100;
    playerHeight= 50;
    player = new Player(width / 2, height*0.8f, playerWidth, playerHeight);
    //backgroundlines = new Background();
    
    
    upPressed = false;
    downPressed = false;
    leftPressed = false;
    rightPressed = false;
    
    numberOfKeysPressedAtTheSameTime = 0;
    
    ratioDiagonalMovement = 0.8f;
    
    numberOfLinesInScreen=10;
    
    backgroundlines = new Background();
    
    gameStartTime = frameCount;
    lastCannonTime = frameCount;
    timeBetweenCannons = 100;
    
    cannonRadius=200; 
}
  
}//END OF CLASS*************************************************