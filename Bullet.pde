class Bullet extends GameObject {
 
  //PVector location;
  //PVector velocity;
  //PVector acceleration;

  boolean hasHit;
  boolean isRemovable;
  
  //float bulletSize=5;
  float bulletSpeed;
  

  Bullet (float x1, float y1, float angle, float velo, float rad) {
    
    super(x1, y1, rad, 15, 0);
    
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
    
    ellipse( -size.x/2, -size.y/2, size.x, size.y);
    
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