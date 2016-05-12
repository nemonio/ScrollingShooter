class Boss extends Enemy {
  
     int numberOfTurrets=8;
     float turretsHztalSeparation=30;
     PVector turretsCoordinates;
     
     float bossSpeed;
     String bossMoveType;
     float upPosition;
     float downPosition;
     boolean isUP;
     int timeLastVerticalMovement;
     int timeBetweenVerticalMovement;
     
     ArrayList<Enemy> bossTurrets;
     
     
   Boss()
   {

     super("CANNON", width/2-800/2, 0-100);
     size = new PVector(800,100);
     turretsCoordinates = new PVector(-cannonSizeDim,-cannonSizeDim);
     turretsHztalSeparation=size.x/numberOfTurrets;
     //position = new PVector (width/2-size.x/2, 0-size.y);
     bossTurrets = new ArrayList<Enemy>();
     
     
     for(int i=0; i<numberOfTurrets;i++)
     {
       bossTurrets.add(new Enemy ("CANNON", position.x + turretsCoordinates.x + turretsHztalSeparation*i, position.y + turretsCoordinates.y) ) ;
     }
     
     bossSpeed=5;
     bossMoveType="ENTERING";
     downPosition=150;
     upPosition=20;
     isUP=true;
     timeLastVerticalMovement=frameCount;
     timeBetweenVerticalMovement=200;

     
     }
     
     
     
 void update() {
   
            if (frameCount-timeLastVerticalMovement > timeBetweenVerticalMovement)
               {
                 if(isUP==true)
                 {
                   bossMoveType="GODOWN";
                   timeLastVerticalMovement=frameCount;
                 }
                 else
                 {
                   bossMoveType="GOUP";
                   timeLastVerticalMovement=frameCount;
                 }
                 
               }
   
   
           switch(bossMoveType) {
               case "ENTERING":               
               position.y++;
               if (position.y > upPosition)
                     {
                       bossMoveType="GORIGHT";
                     }
               
               break;
               case "GORIGHT":               
               position.x+=bossSpeed;
               if (position.x >= width - size.x)
                     {
                       bossMoveType="GOLEFT";
                     }
              break;
              case "GOLEFT":               
               position.x-=bossSpeed;
               if (position.x <= 0)
                     {
                       bossMoveType="GORIGHT";
                     }
              break;
              case "GODOWN":               
               position.y+=bossSpeed;
               if (position.y >= downPosition)
                     {
                       bossMoveType="GOLEFT";
                       isUP=false;
                     }
              break;
              case "GOUP":               
               position.y-=bossSpeed;
               if (position.y <= upPosition)
                     {
                       bossMoveType="GORIGHT";
                       isUP=true;
                     }
              break;
              default:             // Default executes if the case labels
              //println("None");   // don't match the switch parameter
              break;
              }  
   
   
   //turretsCoordinates = position;
   
      // set turret position depending on the boss position

   updateDisplayTurrets();
   

 }
 

void display() {
  
    noFill();
    stroke(RED);
    strokeWeight(strokeWeight);
    rect( position.x, position.y, size.x, size.y);
    
    rect( position.x + turretsCoordinates.x, position.y + turretsCoordinates.y, size.x, size.y);
   
   

 }
     
void updateDisplayTurrets()
{
   for (int i = 0; i < bossTurrets.size(); i++) {
     
     (bossTurrets.get(i)).display();
     (bossTurrets.get(i)).update();
    
           
     (bossTurrets.get(i)).position = new PVector(position.x + turretsCoordinates.x + turretsHztalSeparation*i, position.y + turretsCoordinates.y);
           
      
 

   }
   
}     
     
     
     
     
     
     
}//End of class