abstract class GameObject
{
  //fields
  int angle = 0;
  int pixel = 10;
  
  int randomX = int(random(40, 400));
  int randomY = int(random(40, 400));
    
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