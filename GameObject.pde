abstract class GameObject
{
  //fields
  int angle = 0;
  int pixel = 10;
  
  int randomX = int(random(40, 380));
  int randomY = int(random(40, 380));
    
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
  
   void phone()
  {
    
    fill(255);
    stroke(255);
    rect(0, height- 90,width, 90);
    
    fill(0);
    stroke(0);
    rect(40, 0, 10, height);
    rect(40, 40, width, 10);
    
    //border
    fill(0, 0, 51);
    stroke(0, 0, 51);
    rect(0, 0, 40, height); //left
    rect(0, 0, width, 40); //top
    rect(0, height-80, width, 80); //bottom
    rect(width-40, 0, width, height); //right
    
    //buttons
    fill(255);
    stroke(255);
    rect(40, height - 60, 153, 40);//first
    rect(220, height - 60, 153, 40);//second
    rect(400, height - 60, 153, 40);//third
    
    //button details
    //hang up button
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rect(width - 180, height - 45, 30, 20);
    rect(width - 100, height - 45, 30, 20);
    rect(width - 180, height - 50, 110, 10);
    
    //pick up button
    fill(0, 255, 0);
    stroke(0, 255, 0);
    rect(width - 540, height - 45, 30, 20);
    rect(width - 460, height - 45, 30, 20);
    rect(width - 540, height - 50, 110, 10);

  }

} 