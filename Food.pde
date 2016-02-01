class Food extends GameObject
{
  Food()
  {
  }

  void render()
  {
    
   //some error checking to make sure new food new spawns inside snake
    for(int j = 0;  j <= snakesize;  j++)
    {
       if (randomX != headX[j] && randomY != headY[j])
       {       
        fill(225, 0, 0);
        rect(randomX, randomY, 10, 10);
       }  
       else
       {
          randomX = int(random(400));
          randomY = int(random(400));
          
          rect(randomX, randomY, 10, 10);
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