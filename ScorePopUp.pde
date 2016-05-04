class ScorePopUp extends GameObject {

  //PVector location;
  //PVector velocity;
  //PVector acceleration;
  color scorePopUpColor;

  boolean isDead;
  boolean isRemovable;
  
  int scoreDisplayed;
  

  ScorePopUp (float x1, float y1, color bcol, int score) {

    
    position = new PVector(x1, y1);
    scorePopUpColor=bcol;
    scoreDisplayed=score;
   
    isDead=true;
    isRemovable=false;
    
  }

  // Method to update location
  void update() {

      if ( isDead == true ) {
        
      position.y+=3;
      scorePopUpColor = color( hue(scorePopUpColor), saturation(scorePopUpColor), brightness(scorePopUpColor), alpha(scorePopUpColor)-5 );
      
      }
      
      if ( alpha(scorePopUpColor) <= 0 ) {
        
      isRemovable=true;
      
      }
  }

  // Method to display
  void display() {
    textAlign(LEFT,CENTER);
    //(String text2display, PFont fuente, float xtext, float ytext, int size, color textColor, int opacityText, boolean shadow, int shadowOpacity)
    displayText( "+" + scoreDisplayed, mainFont, position.x, position.y, int(size.x*0.25f), scorePopUpColor, int(alpha(scorePopUpColor)), true, int(alpha(scorePopUpColor)));
  }
  
}//End of class