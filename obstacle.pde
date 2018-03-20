 class Obstacle 
    {
      float initX;
      float topX;
      float topY;
      float w = 50; //CHANGES WIDTH OF RECTANGLES
    
      Obstacle(float initialTopX, float initialTopY) 
      {
        initX = initialTopX;
        topX = initialTopX;
        topY = initialTopY;
      }
    
      void draw()
      {
        pushStyle();
        
        rectMode(CORNERS);
        fill(#49D37A);
        rect(topX, topY, topX+w, height-1);
        rect(topX, 0, topX+w, topY - 200);
        
        popStyle();
    
        topX -= 2;         //CONTROLS OBSTACLES - WHEN SET TO 0, NO RECTANGLES WILL EXIST
      }
    
      void reset() 
      {
        topX = initX;
        topY = random(200, height-1);
      }
    
      void reposition() 
      {
        topX = width;
        topY = random(200, height-1);
      }
    
      boolean detectCollision(Fish f) 
      {
        boolean result = false;
    
        if (rectsCollide(f.x, f.y, f.size, f.size, topX, topY, topX+w, height -1) || rectsCollide(f.x, f.y, f.size, f.size, topX, 0, topX+w, topY - 200)) 
            result = true;
    
        return result;
      }
    
      boolean rectsCollide(float firstX, float firstY, float firstWidth, float firstHeight, float secondULX, float secondULY, float secondBRX, float secondBRY) 
      {
        float hh = firstHeight/2;
        float hw = firstWidth/2;
        return isInside(firstX - hw, firstY - hh, secondULX, secondULY, secondBRX, secondBRY) ||
               isInside(firstX + hw, firstY - hh, secondULX, secondULY, secondBRX, secondBRY) ||
               isInside(firstX + hw, firstY + hh, secondULX, secondULY, secondBRX, secondBRY) ||
               isInside(firstX - hw, firstY + hh, secondULX, secondULY, secondBRX, secondBRY);
      }
    
      boolean isInside(float x, float y, float ulX, float ulY, float brX, float brY) 
      {
        return (x >= ulX && x <= brX && y >= ulY && y <= brY);
      }
    
    }