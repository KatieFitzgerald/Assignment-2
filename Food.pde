class Food extends GameObject
{
  int randomX;
  int randomY;
  
  Food()
  {
    randomX = int(random(400));
    randomY = int(random(400));
  }
    
  //objects that extend GameObject must use all the methods in it
  void render()
  {
  
    fill(225, 0, 0);
    rect(randomX, randomY, 10, 10);
  }
  
  void update()
 {
   angle = 10;
  
  for(i = 1; i < snakesize; i++)
   {
    if (randomX == headX[i] && randomY == headY[i])
    {
      println("Food eaten");
    }
   }
  
    
  }
  
  void keyPressed()
  {
    
  }
  
  
}