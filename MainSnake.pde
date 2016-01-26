ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
int frames = 0;

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
    
    //game goes too fast otherwise

      go.render();
      go.update();
      go.keyPressed();

  }
} 

void foodEaten()
{
    GameObject go = gameObjects.get(0);
    if(go instanceof Snake)
    {
        GameObject othergo = gameObjects.get(1);
        if (othergo instanceof Food)
        {
           if(othergo.randomX == go.headX[go.snakesize])
           {
             gameObjects.remove(othergo);
           }  
        }  
      }
}