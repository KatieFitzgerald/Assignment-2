abstract class GameObject
{
  int angle = 0;
  
  int randomX = int(random(1,480));
  int randomY = int(random(1,480));
    
  //using array instead of arraylist, easier to visualise
  int[] headX = new int[500];
  int[] headY = new int[500];

  int snakelen = 6;
  int i;

  GameObject()
  {
    this.angle = 0;

  }
  
  abstract void render();
  abstract void update();
  abstract void keyPressed();
 
   

} 