ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean gameOver = false;
boolean[] keys = new boolean[512];

int foodEaten = 0;
int increase = 15;


void setup()
{
  size(500, 500);

  background(255);
  
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
  if (gameOver == false)
  {
    for(int i = gameObjects.size() - 1 ; i >= 0   ; i --)
    {
      GameObject go = gameObjects.get(i);
      
      //border
      fill(0);
      stroke(0);
      rect(0, 0, go.pixel, height);
      rect(0, 0, width, go.pixel);
      rect(0, height-go.pixel, width, go.pixel);
      rect(width-go.pixel, 0, width, height);
      
      
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
            
            //background redraw

            
            //redraw border to make it not appear glitchy
            fill(0);
            stroke(0);
            rect(0, 0, go.pixel, height);
            rect(0, 0, width, go.pixel);
            rect(0, height-go.pixel, width, go.pixel);
            rect(width-go.pixel, 0, width, height);
            
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
      if (go.headX[1] >=  width- go.pixel || go.headY[1] >= height - go.pixel || go.headX[1] <= 0 || go.headY[1] <= 0)
      {
        gameOver = true;
        println(go.headX[1], go.headY[1]);
      }
    }
  }
  
}

void gameOver()
{
  background(255);
  
   fill(0);
    textSize(30);
    text("Game Over", 150, 150);

    text("Score: " + foodEaten, 160, 180);
    
  fill(0, 225, 0);
  stroke(0, 255, 0);
  //body
  rect(0, 250, 250, 70);
  rect(210, 220, 70, 120);
  //eyes
  fill(0);
  stroke(0);
  rect(260, 230, 20, 20);
  rect(260, 300, 20, 20);
  //tongue
  fill(225, 0, 0);
  stroke(255, 0, 0);
  rect(280, 270, 30, 10);
  
}