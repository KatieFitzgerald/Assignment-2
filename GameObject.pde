abstract class GameObject
{
  int angle = 0;
  //using array instead of arraylist, easier to visualise 
  int[] headX = new int[500];
  int[] headY = new int[500];
  
  int snakesize = 3;
  int i;

  
  GameObject()
  {
    this.angle = 0;
  }
  
  abstract void render();
  abstract void update();
  abstract void keyPressed();

} 