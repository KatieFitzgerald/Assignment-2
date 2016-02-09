ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

boolean[] keys = new boolean[512];

int foodEaten = 0;
int increase = 15;

boolean startGame = false;
boolean gameOver = false;

void setup()
{
  size(600, 600);
  background(102, 204, 0);
  
  textSize(30);
  text("Press SHIFT to begin", 150, 30);
  
  //game goes too fast otherwise
  frameRate(increase);

  Snake snake = new Snake();
  Food food = new Food();
  
  gameObjects.add(snake);
  gameObjects.add(food);
    
}

void keyPressed()
{
  keys[keyCode] = true;
}
void keyReleased()
{
  keys[keyCode] = false;
}


void draw()
{ 
  if (keyCode == SHIFT)
  {
    startGame = true;
  }
    
    
  if (startGame == true)
  {
    if (gameOver == false)
    {
      for(int i = gameObjects.size() - 1 ; i >= 0; i --)
      {
        GameObject go = gameObjects.get(i);
        
         go.phone();
  
        if(go instanceof Snake)
        {
          ((Snake)go).keyPressed();
        }
        go.render();
        go.update();
        
        foodEaten();
        dead();
        
      }
      
    }
    else
    {
     gameOver();
    }
  }
}


void foodEaten()
{
  for(int i = gameObjects.size() - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    if(go instanceof Snake)
    {
      for(int j = gameObjects.size() - 1; j >= 0; j --)
      {
        GameObject othergo = gameObjects.get(j);
        if (othergo instanceof Food)
        {
          
          if (int (dist(othergo.randomX, othergo.randomY, go.headX[1], go.headY[1])) < 8)
          {
           ((Food) othergo).increaseLen((Snake)go);
            gameObjects.remove(othergo);
         
           //create a "filler" food in place of the old one
            fill(102, 204, 0);
            rect(othergo.randomX, othergo.randomY, othergo.pixel, othergo.pixel);

            Food food = new Food();
            gameObjects.add(food);

            foodEaten++;
            
            increase+=2;
            frameRate(increase);
          }
        }
      }
    }
  }
}

void dead()
{
  for(int i = gameObjects.size() - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    if(go instanceof Snake)
    {
      //counter starts at 2 or it will be counting in the head
      for(int j = 2; j <= go.snakelen; j++)
      {
        if (go.headX[1] == go.headX[j] && go.headY[1] == go.headY[j])
        {
          gameOver = true;
        }
      }
    }
  }
  for(int i = gameObjects.size() - 1; i >= 0; i --)
  {
    GameObject go = gameObjects.get(i);
    
    if(go instanceof Snake)
    {
      if (go.headX[1] >=  width- 40 || go.headY[1] >= height - 90 || go.headX[1] <= 40 || go.headY[1] <= 40)
      {
        gameOver = true;
        
      }
    }
  }
  
}

void gameOver()
{ 
  background(0);
  textSize(30);
  fill(102, 204, 0);
  stroke(102, 204, 0);
  text("Game Over!", 200, 290);
  text("Score: " +foodEaten, 200, 320);
  
  //snake animation
  fill(102, 204, 0);
  stroke(0);
  rect(0, 400, 60, 60);
  rect(70, 400, 60, 60);
  rect(140, 400, 60, 60);
  rect(210, 400, 60, 60);
  
  //eye
  fill(0);
  rect(240, 410, 20, 20);
  //tongue
  fill(255, 0, 0);
  rect(270, 440, 15, 5);
}