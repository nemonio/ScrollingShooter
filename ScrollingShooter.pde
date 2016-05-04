void setup() 
{
  size(1280,720);
  //HSB color mode used for all the colos in the game
  colorMode(HSB, 360, 100, 100, 100);
  
  //Used for knowing when every screen started
  frameAnimationStarted=frameCount;
  //
  GAMEMODE = 6;
  //How long controls are blocked
  controlsBlockedDuration=5;
  //Tiltind rate for press space bar to start message
  tiltingDurationInFrames=3;
  
  //disclaimer
  disclaimer="              DISCLAIMER\n\n\nThe copyright of the Arkanoid logo and\nthe sounds used in this college\nassignment are owned by Tayto.";
  tempDisclaimer="";
  disclaimerDuration=250;
  //story
  story="DIMENSION-CONTROLLING FORT 'DOH' IS NOW BEING\n\nPROCCESSED, AND TIME STARTED FLOWING REVERSELY.\n\n'VAUS' MANAGED TO ESCAPE FROM THE DISTORTED SPACE.\n\n\n\nBUT THE REAL VOYAGE OF 'ARKANOID' IN THE GALAXY\n\nHAS ONLY STARTED......";
  tempStory="";
  storyDuration=300;
  //
  charCounter=0;
  

  loadFonts();
  loadAudio();
  loadColors();
  loadVectorShapes();
  loadBitmaps();
  loadGame();
  
  loadAnimations();
  
  OscP5 = new OscP5(this,10000);
  
  oscControl=false; // Set to "true" to control by OSC messages. "False" for keyboard control.
  
 
  
  
}

//**********************************************************GLOBAL VARIABLES START***********

int GAMEMODE;
//float aniScale;

  //fonts
PFont mainFont;
PFont drawingsFont;

String disclaimer, tempDisclaimer, story, tempStory;
int charCounter;
int disclaimerDuration, storyDuration;

int frameAnimationStarted;
int controlsBlockedDuration;
int tiltingDurationInFrames;

float animationStartScale, animationEndScale, animationDurationInframes;
float scaleAnimationSpeed, animationScale;

  //audio
import ddf.minim.*;
//import processing.sound.*;
AudioPlayer player, song,
            raquetHitSound, brickHitSound, laserShotSound, liveLostSound, expandSound,
            introLevelMusic, storyMusic;
Minim minim;//audio context

  //colors
//colorMode(HSB, 360, 100, 100, 100);
color WHITE, BLACK, RED, BLUE, NIGHTSKY, GREY, GREEN, YELLOW;
color POWERUP_LASER_COLOR, POWERUP_EXPAND_COLOR, POWERUP_PLAYER_COLOR, POWERUP_SLOW_COLOR, POWERUP_CATCH_COLOR, POWERUP_BREAK_COLOR, POWERUP_3BALL_COLOR;
color BRICK_GOLD_COLOR, BRICK_SILVER_COLOR;

  //shapes
PShape mainScreenBKG, gameScreenBKG;
PShape raquetShape, raquetLaserShape;
PShape BKGTexture;


//game
ShooterGame ShooterGame;

//osc control
import oscP5.*;
OscP5 OscP5;
float firstValue, secondValue;
boolean oscControl;


//**************************************************************GLOBAL VARIABLES END*********

void draw() 
{ 

     
  switch (GAMEMODE) {
 
  case 0: 

    runMainMenu();
    

    break; 
 
  case 1:

    runGame();

    break;
    
  case 2:

    runTheEnd();

    break;
    
  case 3:
  
    runDisclaimer();
    
    break;
    
  case 4:
  
    runStory();
    
    break;
    
  case 5:
  
    runGameOver();
    
    break;
    
  case 6:
  
    runControlChoice();
    
    break;
    
  default:
    // error
    println("Error number 939; unknown state : .");
    exit();
    break;
  } // switch

  //
} // func 

/////////****************************************************************END DRAW*******

  void loadFonts()
  {
    // The font must be located in the sketch's 
    // "data" directory to load successfully
  mainFont = loadFont("JoystixMonospace-Regular-128.vlw");
  drawingsFont = loadFont("JoystixMonospace-Regular-128.vlw");
  //create one instance to avoid font flickering
  textFont(mainFont);
  textFont(drawingsFont);
  
  }
  
  void loadAudio()
  {
    minim = new Minim(this);
    song = minim.loadFile("Arkanoid Menu.mp3", 2048);
    raquetHitSound = minim.loadFile("sounds/brickHitSound.wav", 512);
    brickHitSound = minim.loadFile("sounds/raquetHitSound.wav", 512);
    laserShotSound = minim.loadFile("sounds/laserShotSound.wav", 512);
    liveLostSound = minim.loadFile("sounds/liveLostSound.wav", 512);
    expandSound = minim.loadFile("sounds/expandSound.wav", 512);
    
    
    introLevelMusic = minim.loadFile("sounds/introLevelMusic.wav", 512);
    storyMusic = minim.loadFile("sounds/storyMusic.wav", 512);
    
    
  }
    
  void loadColors()
  {
    
    colorMode(HSB, 360, 100, 100, 100);
    
    WHITE = color(360,0,100,100);
    BLACK = color(360,0,0,100);
    RED = color(360,100,100,100);
    BLUE = color(240,100,100,100);
    NIGHTSKY = color(240,80,50,100);
    GREY = color(360,0,50,100);
    GREEN = color(100,80,50,100);
    YELLOW = color(60,100,100,100);
    
    POWERUP_LASER_COLOR = color(11,100,85,100);
    POWERUP_EXPAND_COLOR = color(240,100,66,100);
    POWERUP_PLAYER_COLOR = color(0,0,45,100);
    POWERUP_SLOW_COLOR = color(8,62,99,100);
    POWERUP_CATCH_COLOR = color(85,92,82,100);
    POWERUP_BREAK_COLOR = color(332,54,99,100);
    POWERUP_3BALL_COLOR = color(200,76,99,100);
    
    BRICK_GOLD_COLOR = color(58,100,100,100);
    BRICK_SILVER_COLOR = color(0,0,74,100);
    
    
  }
  
  void loadVectorShapes()
  {
    //smooth();
    mainScreenBKG = loadShape("Arkanoid - Main Screen.svg");
    gameScreenBKG = loadShape("Arkanoid - Game Screen.svg");
    raquetShape = loadShape("Arkanoid - Raquet.svg");
    raquetLaserShape = loadShape("Arkanoid - Raquet Laser.svg");
    BKGTexture=loadShape("BKGTexture1.svg");
  }
  
  
  void loadBitmaps()
  {
    //Not this time only, Bryan ;-)
  }

  
  
  void loadAnimations()
  {

}  

  
  void loadGame()
  {
    ShooterGame = new ShooterGame();
  }
///////*************************************COMMON FUNCTIONS FONTS,AUDIO,COLORS   END********


//Different keyboard controls activated for game mode

void activateMainMenuControls()
{
  // https://processing.org/reference/key.html
  // https://processing.org/reference/keyCode.html
  // USE ONLY 'key' for ASCII specification (BACKSPACE, TAB, ENTER, RETURN, ESC, and DELETE)
  // keyCode is used to detect special keys such as the arrow keys (UP, DOWN, LEFT, and RIGHT) as well as ALT, CONTROL, and SHIFT.
  
  if (keyPressed)
   {
     if (key == ' ')
     {
       frameAnimationStarted=frameCount;
       GAMEMODE = 4;
     }
     
     if (keyCode == SHIFT)
     {
       frameAnimationStarted=frameCount;
       GAMEMODE = 0;
     }

   }
   
}

void activateGameOverControls()
{
  // https://processing.org/reference/key.html
  // https://processing.org/reference/keyCode.html
  // USE ONLY 'key' for ASCII specification (BACKSPACE, TAB, ENTER, RETURN, ESC, and DELETE)
  // keyCode is used to detect special keys such as the arrow keys (UP, DOWN, LEFT, and RIGHT) as well as ALT, CONTROL, and SHIFT.
  
   char prevKey = ' ';
  if (keyPressed)
   {
     if (key == ' ')
     {
       frameAnimationStarted=frameCount;
       GAMEMODE = 1;
       //aniScale = 1.1;
       //Ani.from(this, 0.01, "aniScale", 1, Ani.BACK_IN);
     }
     
     if (keyCode == SHIFT)
     {
       frameAnimationStarted=frameCount;
       GAMEMODE = 0;
     }

   }
   
}

void activateStoryControls()
{
  if (keyPressed)
   {
     if (key == ' ')
     {
        frameAnimationStarted=frameCount;
        charCounter=0;
        GAMEMODE=1;
     }
    
   }
}

void activateDisclaimerControls()
{
  if (keyPressed)
   {
     if (key == ' ')
     {
        frameAnimationStarted=frameCount;
        charCounter=0;
        GAMEMODE=0;
     }
    
   }
}



void activateControlChoiceControls(){
  
   if (keyPressed)
   {
     if (key == '1')
     {
        frameAnimationStarted=frameCount;
        charCounter=0;
        
        oscControl=false;
        
        GAMEMODE=3;
     }
    
   
     if (key == '2')
     {
        frameAnimationStarted=frameCount;
        charCounter=0;
        
        oscControl=true;
        
        GAMEMODE=3;
     }
    
   }  
}





///////****************************************************************CONTROLS   END********

void runMainMenu()   //gamemode 0
{
  //play this now and will play in the next game mode, the story PROCESSING WEIRDO
  storyMusic.cue(0);
  storyMusic.play();
  
  BKGTexture.disableStyle();
  stroke(BLACK,30);
  fill(WHITE);
  displayTexturedBackground(BKGTexture);
  

  blendMode(NORMAL);
  drawBackground(mainScreenBKG, width*0.5f, height*0.5f, 1);


  if(frameCount-frameAnimationStarted>controlsBlockedDuration)
  {
     activateMainMenuControls();
     textAlign(CENTER, CENTER);
     
     //tilting msg
     if(frameCount%(2*tiltingDurationInFrames)<tiltingDurationInFrames)
     {
        displayText("Press SPACEBAR to play", drawingsFont, width*0.5f, (height*0.5f)+(height*0.20f), 30, NIGHTSKY, 100, true, 30);
     }
     
     //displayText("SHIFT: CREDITS\nSHIFT: CREDITS", drawingsFont, width*0.5f, (height*0.5f)+(height*0.35f), 30, NIGHTSKY, 100, true, 30);
  }
}

void runGame()       //gamemode 1
{
//next play will start from the beginning
storyMusic.cue(0);

ShooterGame.display();
ShooterGame.update();

}

void runTheEnd()   //gamemode 5
{ 
  
  //controls wont work for this specified time.
  if(frameCount-frameAnimationStarted>controlsBlockedDuration)
  {
     activateGameOverControls();
  }
  
  drawGradientLinearBackground(NIGHTSKY);
  
  textAlign(CENTER, CENTER);
  //(String text2display, PFont fuente, float xtext, float ytext, int size, color textColor, int opacityText, boolean shadow, int shadowOpacity)
  displayText("CONGRATULATIONS", drawingsFont, width*0.5f, height*0.2f, 90, WHITE, 100, true, 100);
  displayText("YOU WIN!!!", drawingsFont, width*0.5f, height*0.5f, 140, WHITE, 100, true, 100);
  
  //displayText("HAPPY XMAS", mainFont, width*0.5f, height*0.5f, 150, WHITE, 100, true, 100);
  
  displayText("Press SPACEBAR to play again\nPress SHIFT to menu", drawingsFont, width*0.5f, (height*0.5f)+(height*0.25f), 30, WHITE, 100, true, 100);
}

void runGameOver()   //gamemode 2
{ 
  if(frameCount-frameAnimationStarted>controlsBlockedDuration)
  {
     activateGameOverControls();
  }
  
  drawGradientLinearBackground(NIGHTSKY);
  
  textAlign(CENTER, CENTER);
  //(String text2display, PFont fuente, float xtext, float ytext, int size, color textColor, int opacityText, boolean shadow, int shadowOpacity)
  displayText("GAME OVER", drawingsFont, width*0.5f, height*0.5f, 90, WHITE, 100, true, 100);
  
  
  //displayText("HAPPY XMAS", mainFont, width*0.5f, height*0.5f, 150, WHITE, 100, true, 100);
  
  displayText("Press SPACEBAR to play again\nPress SHIFT to menu", drawingsFont, width*0.5f, (height*0.5f)+(height*0.25f), 30, WHITE, 100, true, 100);
}
void runDisclaimer()  //gamemode 3
{ 
  activateDisclaimerControls();
  
  drawGradientLinearBackground(NIGHTSKY);
  
  
  
  //typewriting display********
  textAlign(LEFT, TOP);
  //(String text2display, PFont fuente, float xtext, float ytext, int size, color textColor, int opacityText, boolean shadow, int shadowOpacity)
  displayText(tempDisclaimer, drawingsFont, width*0.1f, height*0.3f, 32, WHITE, 100, true, 100);
  
  tempDisclaimer = disclaimer.substring(0, charCounter);
  
  
  
  if(charCounter<disclaimer.length())
  {
     charCounter++;
  }
  else
  {
      if(frameCount-frameAnimationStarted>disclaimerDuration)
      {
        frameAnimationStarted=frameCount;
        charCounter=0;
        GAMEMODE=0;
      }
    
  }
  
    
}

void runStory()  //gamemode 4
{ 

  
  activateStoryControls();
  
  drawGradientLinearBackground(NIGHTSKY);
  
  textAlign(LEFT, TOP);
  //(String text2display, PFont fuente, float xtext, float ytext, int size, color textColor, int opacityText, boolean shadow, int shadowOpacity)
  displayText(tempStory, drawingsFont, width*0.1f, height*0.3f, 24, WHITE, 100, true, 100);
  
  


  
  //displayText("Press SPACEBAR to play again\nPress SHIFT to menu", drawingsFont, width*0.5f, (height*0.5f)+(height*0.25f), 30, WHITE, 100, true, 100);
  
  //typewriting display********
  tempStory = story.substring(0, charCounter);
  
  if(charCounter<story.length())
  {
     charCounter++;
  }
  else
  {
      if(frameCount-frameAnimationStarted>storyDuration)
      {
        frameAnimationStarted=frameCount;
        charCounter=0;
        GAMEMODE=1;
      }
    
  }
  
  
  //char c1 = str.charAt(0);
  
}

void runControlChoice(){
  
  if(frameCount-frameAnimationStarted>controlsBlockedDuration)
  {
  activateControlChoiceControls();
  }
  
  drawGradientLinearBackground(NIGHTSKY);
  
  textAlign(CENTER, CENTER);
  //(String text2display, PFont fuente, float xtext, float ytext, int size, color textColor, int opacityText, boolean shadow, int shadowOpacity)
  displayText("CONTROLS", drawingsFont, width*0.5f, height*0.4f, 70, WHITE, 100, true, 100);
  textAlign(LEFT, CENTER);
  displayText("1: KEYBOARD\n\n2: OSC", drawingsFont, width*0.4f, (height*0.4f)+(height*0.25f), 30, WHITE, 100, true, 100);
  
}

///////****************************************************************GAME MODES   END********

  
void displayText(String text2display, PFont fuente, float xtext, float ytext, int size, color textColor, int opacityText, boolean shadow, int shadowOpacity)
{  
  PVector shadowDistance = new PVector(3,3);
  
  //textAlign(CENTER, CENTER);
  
//draw shadow
  if (shadow == true)
  {
    fill(getColorWithOpacity(BLACK, shadowOpacity));//
    textFont(fuente);
    textSize(size);
    text (text2display, xtext+shadowDistance.x, ytext+shadowDistance.y);
  }  
  
  fill(textColor);//white
  stroke(BLACK);
  textSize(size);
  text (text2display, xtext, ytext);
  //text ("bar"+(millis()/(timeBetweenGameModes*TIMEUNIT/4))+"beat"+(((millis()/(timeBetweenGameModes))%4)+1), 10, 285);

}


void drawGradientLinearBackground(color colorForGradient)
{
  for(int i=0;i<=height;i++)
  {
    colorMode(HSB, 360, 100, 100, 100);
    stroke(hue(colorForGradient),saturation(colorForGradient),10+(i*0.1f));
    line(0,i,width,i);
    //bg = color(180, 50, 50);
  }
}



color getColorWithOpacity(color color1, int opacity)
{
  color colorin;
  colorMode(HSB, 360, 100, 100, 100);
  colorin = color(hue(color1), saturation(color1), brightness(color1), opacity);
  return colorin;
}

void drawBackground(PShape bkg, float x1, float y1, float scale)
{
  shapeMode(CENTER);
  shape(bkg, x1, y1, bkg.width*scale, bkg.height*scale);
  shapeMode(CORNER);
  //shapeMode(TOP-LEFT);
  //println(bkg.width);
  //println(bkg.height);
}


/*
void updateBackground() {
  


}

void displayBackground() {


}

*/

void displayTexturedBackground(PShape shape) {
  
  
  for(int x1=0; x1<width; x1+=shape.width){
    
    for(int y1=0; y1<width; y1+=shape.height){
      shapeMode(CENTER);
      shape(shape, x1, y1, shape.width, shape.height);
      shapeMode(CORNER);
    //println(shape.getWidth()+ "   " + shape.width);

    }
    
  }
  

}

//listener of osc msgs
void oscEvent(OscMessage theOscMessage) {
  /* check if theOscMessage has the address pattern we are looking for. */  
  if(theOscMessage.checkAddrPattern("/accelerometer")==true) {
    /* check if the typetag is the right one. */
    if(theOscMessage.checkTypetag("fff")) {
      /* parse theOscMessage and extract the values from the osc message arguments. */
      firstValue = theOscMessage.get(0).floatValue();  // get the first osc argument
      secondValue = theOscMessage.get(1).floatValue(); // get the second osc argument
      print("### received an osc message /test with typetag ifs.");
      println(" values: "+firstValue+", "+secondValue);
      
      return;
    }
  }
}