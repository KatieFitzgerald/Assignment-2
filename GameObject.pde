abstract class GameObject
{
  int angle = 0;
   
  int snakesize = 5;
  int i;

  
  GameObject()
  {
    this.angle = 0;
  }
  
  abstract void render();
  abstract void update();
  abstract void keyPressed();

} 