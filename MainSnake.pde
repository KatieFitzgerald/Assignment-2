ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

void setup()
{
  size(500, 500);
  background(255);
  Snake snake = new Snake();
  Food food = new Food();
  gameObjects.add(snake);
  gameObjects.add(food);
  
}

void draw()
{
  for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
  {
    GameObject go = gameObjects.get(i);
    go.render();
    go.update();
    go.keyPressed();
  }
} 