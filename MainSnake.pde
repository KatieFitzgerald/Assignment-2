ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean gameOver = false;
boolean[] keys = new boolean[512];

int foodEaten = 0;

void setup()
{
  size(500, 500);
  println(width, height);
  background(255);
  //game goes too fast
  frameRate(15);

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
  
  //border
  fill(0);
  stroke(0);
  rect(0, 0, 12, height);
  rect(0, 0, width, 12);
  rect(0, height-12, width, 12);
  rect(width-12, 0, width, height);
  
  if (gameOver == false)
  {
    for(int i = gameObjects.size() - 1 ; i >= 0   ; i --)
    {
      GameObject go = gameObjects.get(i);
      
      go.keyPressed();
      go.render();
      go.update();
      //go.keyPressed();
      
      foodEaten();
      dead();
  
    }
    
  }
  
  else
  {
        fill(0);
        stroke(0);
        textSize(30);
        text("Game Over", 150, 150);
        
        if (foodEaten != 0)
        {
          text("You ate " + foodEaten + " food", 150, 180);
        }
        else
        {
          text("You ate no food!", 150, 180);
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
        
           if (int (dist(othergo.randomX, othergo.randomY, go.headX[1], go.headY[1])) < 9)
           {
             fill(255);
             gameObjects.remove(othergo);

              Food food = new Food();
              gameObjects.add(food);
              
              //making snake bigger everytime!
              go.snakelen += 2;
              go.render();
              
              foodEaten++;
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
         if (go.headX[1] >=  width-12 || go.headY[1] >= height - 12 || go.headX[1] <= 0 || go.headY[1] <= 0)
         {
           gameOver = true;
           println(go.headX[1], go.headY[1]);
         }  
      }  
    }
  
}
  
  
  