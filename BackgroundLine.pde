class BackgroundLine extends GameObject {
  
 
  PImage allbkg;
  
  
  BackgroundLine(float x, float y)
  {
   super(x, y, width, y);
   allbkg = getTiledImageFromSingleImage(0, 0, width, height, seamlessBKG, 1);
    
  }
  
  
  
  
  public void update()
  {
    
    //scrollSpeed
    position.y += ShooterGame.scrollSpeed;
    if( position.y >= 0 )
    {
      position.y = position.y - height;
    }
    
  }
  
  
  
  
  
  
  
  
  void display() {
/*
    noFill();
    stroke(WHITE);
    strokeWeight(30);
    line( position.x, position.y, size.x, position.y);
 
    noStroke();
    beginShape();
    texture(seamlessBKG);
    
    vertex(0, position.y, 0, 0);
    vertex(width, position.y, 100, 0);
    vertex(width, position.y + height, 100, 100);
    vertex(0, position.y + height, 0, 100);
    endShape();
    */   
    image(allbkg, 0, position.y);
    image(allbkg, 0, position.y + height);
    


   
  }
  
  

    
    
    
private PImage getTiledImageFromSingleImage(int x1, int y1, int x2, int y2,  PImage texture, float tint){


float planeWidth = x2 - x1;
float planeHeight = y2 - y1;

int textureWidth = texture.width;

int textureHeight = texture.height;

if(planeWidth<texture.width)
planeWidth = texture.width;
if(planeHeight<texture.height)
planeHeight = texture.height;

int timesWidth = (int)(planeWidth/textureWidth);

int timesHeight = (int)(planeHeight/textureHeight);

double restWidth = (planeWidth%textureWidth);

double restHeight = (planeHeight%textureHeight);

PImage tiledImage = new PImage((int)planeWidth, (int)planeHeight, PImage.ARGB);


for (int i = 0; i < timesWidth; i++) {

int startX = i * textureWidth;

for (int j = 0; j < timesHeight; j++) {

int startY = j * textureHeight;


tiledImage.copy(texture, 0, 0, texture.width, texture.height, startX, startY,  textureWidth,  textureHeight);  


if(restWidth > 0 && !((i+1) < timesWidth)){ //rest zeichnen, der ganz nicht hinpasste


tiledImage.copy(texture, 0, 0, (int)restWidth, texture.height , startX + textureWidth, startY, (int)restWidth,  textureHeight);

}


if(restHeight > 0 && !((j+1) < timesHeight)){

tiledImage.copy(texture, 0, 0, texture.width,(int)restHeight , startX, startY + textureHeight,  textureWidth,  (int)restHeight);

}


if((restHeight > 0 && !((j+1) < timesHeight)) && (restWidth > 0 && !((i+1) < timesWidth)) ){


tiledImage.copy(texture, 0, 0, (int)restWidth,(int)restHeight , startX + textureWidth , startY + textureHeight, (int)restWidth, (int)restHeight);
}

}

}

return tiledImage;

}













    }//End of class