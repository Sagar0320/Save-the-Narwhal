    Fish fish;
    Obstacle[] obstacle = new Obstacle[2];
    Score score;
    PImage backgroundImage;
    PImage startImage;
    
    PFont italicFont;
    PFont boldFont;
    PFont regularFont;
    
    boolean gameStarted = false;
    boolean gameOver = false;
                   
    //import ddf.minim.*;
    //import processing.sound.*;
    //SoundFile backgroundmusic;
    //SoundFile whale;
    //SoundFile whalesound;
    //SoundFile minim;
    
    void setup() 
    {
      size(1012, 700);
      fish = new Fish(width/2, 0);
      obstacle[0] = new Obstacle(width, random(200, height-1));
      obstacle[1] = new Obstacle(width*1.5+25, random(200, height-1));
      score = new Score();
      backgroundImage = loadImage("backgroundNEW.jpg");
      
      //backgroundmusic = new SoundFile(this, "BgMusicNEW.mp3");
      //whalesound = new SoundFile(this,"single_bubble.mp3");
      //backgroundmusic.play();
      
      italicFont = createFont("Arial Italic", 32);
      boldFont = createFont("Arial Bold", 48);
      regularFont = createFont("Arial", 32);
    }
    
    
    void draw() 
    {
      background(backgroundImage);             //CHANGE BACKGROUND
    
      if (gameOver) 
      {
        drawGameOver();
      } 
      else if (!gameStarted) 
      {
        drawStartScreen();
      } 
      else 
      {
        fish.draw();
        for(Obstacle c : obstacle) 
        {
          c.draw(); 
        }
        score.draw();
        detectCollision();
      }
    }
      
    void mousePressed() 
    {
      action();
    }
    
    void keyPressed()
    {
      action();
    }
    
    void action() 
    {
      if (gameOver)
      {
        gameOver = false;
        fish.reset();
        for(Obstacle c : obstacle) 
        { 
          c.reset(); 
        }
        score.reset();
      } 
      else if (!gameStarted) 
      {
        gameStarted = true;
      } 
      else 
      {
        fish.jump();
        //whalesound.play();
      }
    }
    
    void drawGameOver() 
    { 
      startImage = loadImage("backgroundOUTRO.jpg");
      background(startImage);
    
      rectMode(CENTER);
      textAlign(CENTER, CENTER);
      fill(255);
      textFont(boldFont);
      text("GAME OVER\nScore = " + score.getScore(), width/2, height/2 - 100);   //THE PURPLE COLORED TEXT IS WHAT SHOWS ON THE END GAME SCREEN
      textFont(italicFont);
      text("\n\nPress any key to play again!", width/2, height/2);              //THE PURPLE COLORED TEXT IS WHAT SHOWS ON THE END GAME SCREEN
    }
    
    void drawStartScreen()
    {
      startImage = loadImage("backgroundINTRO.jpg");
      background(startImage);
    
      rectMode(CENTER);
      textAlign(CENTER, CENTER);
      fill(255);
      textFont(boldFont);
      text("Save the Narwhal!", width/2, height/2-100);      //THE PURPLE COLORED TEXT IS WHAT SHOWS ON THE START GAME SCREEN
      textFont(italicFont);
      text("Press any key to play...", width/2, height/2);   //THE PURPLE COLORED TEXT IS WHAT SHOWS ON THE START GAME SCREEN
    }
  
    void detectCollision() 
    {  
      if (fish.y > height || fish.y < 0) 
      {
        gameOver = true;
      }
    
      for(Obstacle coral : obstacle) 
      {
        if (fish.x - fish.size/2.0 > coral.topX + coral.w) 
        {
          score.increase();
        }
    
        if (coral.topX + coral.w < 0) 
        {
          coral.reposition();
          score.allowScoreIncrease();
        }
  
        if (coral.detectCollision(fish)) 
        {
          gameOver = true;
        }
      }
    }