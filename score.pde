class Score 
{
  private int score = 0;
  private boolean scoreIncreased = false;

  void increase() 
  {
    if (!scoreIncreased) 
    {
      score += 1;   //CONTROLS HOW MANY POINTS YOU GET
      scoreIncreased = true;
    }
  }

  void reset() 
  {
    score = 0;
    scoreIncreased = false;
  }

  void allowScoreIncrease() 
  {
    scoreIncreased = false;
  }

  void draw() 
  {
    pushStyle();

    rectMode(CORNER);
    textAlign(CENTER);
    fill(0);
    textFont(regularFont);
    text("score = " + score, 10, 10, width, 40);

    popStyle();
  }
  
  int getScore()
  {
    return this.score;
  }
}