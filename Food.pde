class Food extends GameObject implements SnakeFood
{
  Food()
  {
  }
  
  //interface
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
        
        randomNewX = int(random(380));
        randomNewY = int(random(380));
        
        noStroke();
        rect(randomNewX, randomNewY, pixel, pixel);
      }
      
    }
  }
  
  void update()
  {
    
    
  }
  
}