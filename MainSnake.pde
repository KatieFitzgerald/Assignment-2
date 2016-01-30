ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
int food = 0;

void setup()
{
  size(500, 500);
  background(255);
  //game goes too fast
  frameRate(15);
  
  Snake snake = new Snake();
  Food food = new Food();
  
  gameObjects.add(snake);
  gameObjects.add(food);
  
}

void draw()
{
  
  for(int i = gameObjects.size() - 1 ; i >= 0   ; i --)
  {
    GameObject go = gameObjects.get(i);
    
    go.render();
    go.update();
    go.keyPressed();
    
    foodEaten();

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
              go.snakesize += 2;
              go.render();
           }  
        }  
      }
   }
}

void eatSelf()
{
   for(int i = gameObjects.size() - 1; i >= 0; i --)
 {
    GameObject go = gameObjects.get(i);
    if(go instanceof Snake)
    {
           if (int (dist(go.headX[1], go.headY[1], go.headY[go.i], go.headX[go.i])) < 1)
           {
             println("Dead");
           }  
        }  
    }
}
  
  
  