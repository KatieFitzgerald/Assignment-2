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
  int newRandomX = int(random(400));
  int newRandomY =  int(random(400));
  
  for(int i = gameObjects.size() - 1 ; i >= 0   ; i --)
  {
    GameObject go = gameObjects.get(i);
    
    go.render();
    go.update();
    go.keyPressed();
    
    foodEaten();
  
    if (food == 1)
    {
      fill(225, 0, 0);
      rect(newRandomX, newRandomY, 8, 8);
      food = 0;
      println("Food eaten");
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
           if (int(dist(othergo.randomX, othergo.randomY, go.headX[1], go.headY[1])) < 22 )
           {
             gameObjects.remove(othergo);
             food = 1;
            
           }  
        }  
      }
    }
 }
}