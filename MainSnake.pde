void setup()
{
  size(500, 500);
  background(0);
  Snake snake = new Snake(UP, LEFT, RIGHT, 200.0f, height / 2.0f);
  gameObjects.add(snake);
  
}
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

boolean[] keys = new boolean[512];

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
  background(0);
    
  for(int i = gameObjects.size() - 1 ; i >= 0   ;i --)
  {
    GameObject go = gameObjects.get(i);
    go.travel();
    go.render();
  }
  
}