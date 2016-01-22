abstract class GameObject
{
  int angle = 0;
  
  GameObject()
  {
    this.angle = 0;
  }
  
  abstract void render();
  abstract void update();
  abstract void keyPressed();

} 