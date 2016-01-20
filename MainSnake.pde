ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

void setup()
{
  size(500, 500);
  background(0);
  Snake snake = new Snake();
  gameObjects.add(snake);
  
}

void draw()
{
  background(0);
    
  for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
  {
    GameObject go = gameObjects.get(i);
    go.render();
    go.travel();
    go.keyPressed();
  }
} 