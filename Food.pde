class Food extends GameObject
{
  int randomX;
  int randomY;
  
  
  Food()
  {
    
    randomX = int(random(0, 500));
    randomY = int(random(0, 500));
    
  }
  
  //objects that extend GameObject must use all the methods in it
  void render()
  {
    fill(0);
    rect(randomX, randomY, 8, 8);
  }
  void update()
  {
    angle = 10;
    
  }
  
  void keyPressed()
  {
    
  }
  
  
}