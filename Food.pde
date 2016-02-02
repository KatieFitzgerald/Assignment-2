class Food extends GameObject
{
  Food()
  {
  }

  void render()
  {
    
   //some error checking to make sure new food new spawns inside snake
    for(int j = 0;  j <= snakelen;  j++)
    {
       if (randomX != headX[j] && randomY != headY[j])
       {       
          fill(225, 0, 0);
          rect(randomX, randomY, 10, 10);
       }  
       else
       {
          int randomNewX;
          int randomNewY;
          
          randomNewX = int(random(400));
          randomNewY = int(random(400));
          
          rect(randomNewX, randomNewY, 10, 10);
       }
       
    }  
  }

  void update()
  {
  
  }
  
  void keyPressed()
  {

  }
}