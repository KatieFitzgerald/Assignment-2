abstract class GameObject
{
  int angle = 0;
  int pixel = 10;
  
  int randomX = int(random(10,480));
  int randomY = int(random(10,480));
    
  //using array instead of arraylist, easier to visualise
  int[] headX = new int[500];
  int[] headY = new int[500];

  int snakelen = 6;
  int i;

  GameObject()
  {

  }
  
  abstract void render();
  abstract void update();

} 