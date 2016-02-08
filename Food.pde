class Food extends GameObject implements SnakeFood
{
  Food()
  {
  }
  
   // From the interface. This class won't compile unless it has this method  
  void increaseLen(Snake snake)
  {
    snake.snakelen ++;
    snake.render();
  }
  
  void render()
  {
    
    //some error checking to make sure new food new spawns inside snake
    for(int j = 0;  j <= snakelen;  j++)
    {
      if (randomX != headX[j] && randomY != headY[j])
      {
        fill(0);
        stroke(0);
        rect(randomX, randomY, pixel, pixel);
      }
      else
     {
        int randomNewX;
        int randomNewY;
        
        randomNewX = int(random(48));
        randomNewY = int(random(48));
        
        noStroke();
        rect(randomNewX, randomNewY, pixel, pixel);
      }
      
    }
  }
  
  void update()
  {
    
    
  }
  
}