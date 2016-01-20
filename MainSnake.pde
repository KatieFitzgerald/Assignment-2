ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
int frames = 0;

void setup()
{
  size(500, 500);
  background(255);
  //game goes too fast
  frameRate(10);
  
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