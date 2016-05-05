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
  
  boolean upPressed;
  boolean downPressed;
  boolean leftPressed;
  boolean rightPressed;
  
  int numberOfKeysPressedAtTheSameTime;
  
  float ratioDiagonalMovement;
  
  
  
  ShooterGame()
  
  {
    gameLimits = new PVector(0,0);
    gameSize = new PVector(width,height);
    
    scrollSpeed = 30;
    score = 0;
    hiscore = 0;
  
    previousBulletTime = frameCount;
    framesBetweenBullets = 5;
    
    noControlsAtStartTime=frameCount;
    
    ScorePopUpsRemaining = new ArrayList<ScorePopUp>();
    BulletsRemaining = new ArrayList<Bullet>();
    PowerUpsRemaining = new ArrayList<PowerUp>();
    EnemiesRemaining = new ArrayList<Enemy>();
    
    player = new Player(width / 2, height / 2 , 100, 100);
    
    
    upPressed = false;
    downPressed = false;
    leftPressed = false;
    rightPressed = false;
    
    numberOfKeysPressedAtTheSameTime = 0;
    
    ratioDiagonalMovement = 0.8f;
  
  }  
  
  
// Method to update location
  void update()
  
  {
   
   activatePlayerControls();
   //controlsUP();
   println(numberOfKeysPressedAtTheSameTime); 
  
  }



  // Method to display
  void display()
  
  {  
  
         drawGradientLinearBackground(GREEN);
         player.display();

    
  }


void keyPressed() {
  
  println("key"); 
  
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
     
     if ( keyCode == DOWN && player.position.y <= gameSize.y )
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
                   
        ShooterGame.BulletsRemaining.add( new Bullet (player.position.x, player.position.y ) );
        ShooterGame.BulletsRemaining.add( new Bullet (player.position.x + player.size.x, player.position.x) );
        
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
  
  
}//END OF CLASS*************************************************


  
  