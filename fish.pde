class Fish 
{
  float x;
  float y;
  float size = 80;
  float vy = 0;
  float ay = 0.2;             //CONTROLS THE FISH'S GRAVITY, or, ABILITY TO FALL
  PImage fish;  

  Fish(float initialX, float initialY) 
  {
    x = initialX;
    y = initialY;
    fish = loadImage("fishy.png");
  }


  void draw() 
  {    
    pushStyle();

    imageMode(CENTER);
    
    image(fish, x, y, 100, size);
    
    popStyle();

    y += vy;
    vy += ay;
  }

  void reset() 
  {
    y = 0;
    vy = 0;
  }
  
  void jump()
  {
    vy = -4;        //CONTROLS HOW HIGH THE FISH JUMPS
  }
}